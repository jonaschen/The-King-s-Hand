#!/usr/bin/env bash
# analyze_pptx.sh — End-to-end PowerPoint analysis pipeline for The King's Hand
#
# Converts a .pptx file to structured text and pipes it directly to the
# gemini-cli King's Hand agent, producing a complete five-module intelligence
# report in Traditional Chinese (繁體中文).
#
# USAGE:
#   ./tools/analyze_pptx.sh presentation.pptx
#   ./tools/analyze_pptx.sh presentation.pptx --manager henry
#   ./tools/analyze_pptx.sh presentation.pptx --manager henry --output report.md
#   ./tools/analyze_pptx.sh presentation.pptx --output report.md
#   ./tools/analyze_pptx.sh presentation.pptx --extract-only
#   ./tools/analyze_pptx.sh presentation.pptx --extractor python
#   ./tools/analyze_pptx.sh presentation.pptx --extractor soffice
#   ./tools/analyze_pptx.sh presentation.pptx --extractor markitdown
#
# MANAGER PROFILE (--manager NAME):
#   If a Manager Profile exists at manager_profiles/[NAME].md, it is
#   prepended to the extracted document before analysis. The King's Hand
#   Step 0 picks up the profile and calibrates domain vocabulary, priority
#   weighting, and question style to that specific manager.
#
#   After each session, run tools/calibrate.sh to update the profile.
#   The profile becomes richer with each session.
#
# EXTRACTORS (choose with --extractor):
#   python      Uses python-pptx for structured extraction (recommended for
#               text-heavy decks; preserves slide numbers and table structure).
#               Requires: pip install python-pptx
#
#   soffice     Uses LibreOffice headless conversion. No Python dependencies.
#               Lower fidelity (no slide numbers, tables may break) but works
#               immediately with zero installation.
#               Requires: soffice (LibreOffice) — already installed.
#
#   markitdown  Uses Microsoft markitdown (handles pptx, pdf, docx, xlsx).
#               Best multi-format option; output is Markdown.
#               Requires: pip install markitdown
#
# DEFAULT EXTRACTOR SELECTION (automatic if --extractor not specified):
#   1. python-pptx (if installed)
#   2. markitdown (if installed)
#   3. soffice (always available as fallback)
#
# OUTPUT MODES:
#   Default:          Pipe extracted text to gemini-cli → full King's Hand report
#   --extract-only:   Print extracted text to stdout without running gemini-cli
#   --output FILE:    Write the final King's Hand report to FILE (Markdown)
#
# DEPENDENCIES:
#   Always required:  gemini-cli (already installed at v0.34.0)
#   Always available: soffice/LibreOffice (already installed)
#   Optional:         pip install python-pptx  (better extraction)
#   Optional:         pip install markitdown   (multi-format support)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# ─── Argument parsing ────────────────────────────────────────────────────────

INPUT_FILE=""
EXTRACTOR="auto"
EXTRACT_ONLY=false
OUTPUT_FILE=""
INCLUDE_NOTES=false
MANAGER_NAME=""

usage() {
    sed -n '/^# USAGE/,/^# DEFAULT/{ /^# DEFAULT/d; s/^# \{0,3\}//; p }' "$0"
    exit 1
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --extractor)    EXTRACTOR="$2"; shift 2 ;;
        --extract-only) EXTRACT_ONLY=true; shift ;;
        --output|-o)    OUTPUT_FILE="$2"; shift 2 ;;
        --notes)        INCLUDE_NOTES=true; shift ;;
        --manager|-m)   MANAGER_NAME="$2"; shift 2 ;;
        --help|-h)      usage ;;
        -*)             echo "Unknown option: $1" >&2; usage ;;
        *)
            if [[ -z "$INPUT_FILE" ]]; then
                INPUT_FILE="$1"
            else
                echo "Unexpected argument: $1" >&2; usage
            fi
            shift
            ;;
    esac
done

if [[ -z "$INPUT_FILE" ]]; then
    echo "ERROR: No input file specified." >&2
    usage
fi

if [[ ! -f "$INPUT_FILE" ]]; then
    echo "ERROR: File not found: $INPUT_FILE" >&2
    exit 1
fi

INPUT_PATH="$(realpath "$INPUT_FILE")"
TMPDIR_WORK="$(mktemp -d)"
trap 'rm -rf "$TMPDIR_WORK"' EXIT

# ─── Extractor selection ──────────────────────────────────────────────────────

select_extractor() {
    # Preference order: markitdown > python-pptx > soffice
    # markitdown is preferred because it auto-includes speaker notes, preserves
    # tables as Markdown, and handles multiple formats beyond pptx.
    if python3 -c "import markitdown" 2>/dev/null; then
        echo "markitdown"
    elif python3 -c "import pptx" 2>/dev/null; then
        echo "python"
    elif command -v soffice &>/dev/null; then
        echo "soffice"
    else
        echo "none"
    fi
}

if [[ "$EXTRACTOR" == "auto" ]]; then
    EXTRACTOR="$(select_extractor)"
    if [[ "$EXTRACTOR" == "none" ]]; then
        echo "ERROR: No extractor available. Install one of:" >&2
        echo "  pip install python-pptx" >&2
        echo "  pip install markitdown" >&2
        echo "  (or ensure soffice/LibreOffice is installed)" >&2
        exit 1
    fi
    echo "[analyze_pptx] Using extractor: $EXTRACTOR (auto-selected)" >&2
else
    echo "[analyze_pptx] Using extractor: $EXTRACTOR (specified)" >&2
fi

# ─── Text extraction ──────────────────────────────────────────────────────────

EXTRACTED_TEXT_FILE="$TMPDIR_WORK/extracted.txt"

extract_python() {
    local notes_flag=""
    [[ "$INCLUDE_NOTES" == true ]] && notes_flag="--notes"
    python3 "$SCRIPT_DIR/pptx_to_text.py" "$INPUT_PATH" $notes_flag > "$EXTRACTED_TEXT_FILE"
}

extract_soffice() {
    # LibreOffice headless: convert pptx → HTML, then strip tags with Python
    # (the txt filter is unavailable for Impress/pptx format).
    # Note: slide boundaries are preserved as page breaks in the HTML.
    local html_basename
    html_basename="$(basename "$INPUT_PATH" .pptx).html"

    soffice --headless \
        --convert-to html \
        --outdir "$TMPDIR_WORK" \
        "$INPUT_PATH" >/dev/null 2>&1

    local soffice_out="$TMPDIR_WORK/$html_basename"
    if [[ ! -f "$soffice_out" ]]; then
        soffice_out="$(ls "$TMPDIR_WORK"/*.html 2>/dev/null | head -1)"
    fi

    if [[ -z "$soffice_out" || ! -f "$soffice_out" ]]; then
        echo "ERROR: soffice failed to produce an HTML file in $TMPDIR_WORK" >&2
        exit 1
    fi

    # Strip HTML tags using Python's built-in html.parser (no extra dependencies)
    python3 - "$soffice_out" <<'PYEOF'
import sys, re
from html.parser import HTMLParser

class TextExtractor(HTMLParser):
    def __init__(self):
        super().__init__()
        self.parts = []
        self.in_style = False
    def handle_starttag(self, tag, attrs):
        if tag == "style": self.in_style = True
        if tag in ("p", "div", "tr", "br", "li"): self.parts.append("\n")
    def handle_endtag(self, tag):
        if tag == "style": self.in_style = False
    def handle_data(self, data):
        if not self.in_style:
            self.parts.append(data)
    def handle_entityref(self, name):
        mapping = {"nbsp": " ", "lt": "<", "gt": ">", "amp": "&", "quot": '"'}
        self.parts.append(mapping.get(name, ""))
    def handle_charref(self, name):
        if name.startswith("x"):
            self.parts.append(chr(int(name[1:], 16)))
        else:
            self.parts.append(chr(int(name)))

html = open(sys.argv[1], encoding="utf-8", errors="replace").read()
parser = TextExtractor()
parser.feed(html)
text = "".join(parser.parts)
text = re.sub(r"[ \t]+", " ", text)
text = re.sub(r"\n{3,}", "\n\n", text)
text = text.strip()
print("[PPTX CONTENT — extracted via LibreOffice HTML conversion]")
print(f"Source file: {sys.argv[1].rsplit('/', 1)[-1].replace('.html', '.pptx')}")
print()
print(text)
PYEOF
} > "$EXTRACTED_TEXT_FILE"

extract_markitdown() {
    python3 -c "
from markitdown import MarkItDown
md = MarkItDown()
result = md.convert('$INPUT_PATH')
print(result.text_content)
" > "$EXTRACTED_TEXT_FILE"
}

echo "[analyze_pptx] Extracting text from: $(basename "$INPUT_PATH")" >&2

case "$EXTRACTOR" in
    python)     extract_python ;;
    soffice)    extract_soffice ;;
    markitdown) extract_markitdown ;;
    *)
        echo "ERROR: Unknown extractor '$EXTRACTOR'. Choose: python, soffice, markitdown" >&2
        exit 1
        ;;
esac

LINE_COUNT="$(wc -l < "$EXTRACTED_TEXT_FILE")"
echo "[analyze_pptx] Extracted $LINE_COUNT lines of text." >&2

# ─── Manager profile injection ───────────────────────────────────────────────

if [[ -n "$MANAGER_NAME" ]]; then
    MANAGER_SLUG="$(echo "$MANAGER_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')"
    PROFILE_PATH="$REPO_ROOT/manager_profiles/$MANAGER_SLUG.md"
    if [[ -f "$PROFILE_PATH" ]]; then
        # Prepend profile to extracted text — Step 0 in SKILL.md will consume it
        COMBINED_FILE="$TMPDIR_WORK/with_profile.txt"
        {
            cat "$PROFILE_PATH"
            echo ""
            echo "════════════════════════════════════════════════════════════════════════════════"
            echo "PROJECT DOCUMENTS FOR ANALYSIS:"
            echo "════════════════════════════════════════════════════════════════════════════════"
            echo ""
            cat "$EXTRACTED_TEXT_FILE"
        } > "$COMBINED_FILE"
        EXTRACTED_TEXT_FILE="$COMBINED_FILE"
        echo "[analyze_pptx] Manager profile injected: $PROFILE_PATH" >&2
    else
        echo "[analyze_pptx] WARNING: No profile found for manager '$MANAGER_NAME' at $PROFILE_PATH" >&2
        echo "[analyze_pptx]          Run: ./tools/calibrate.sh --manager $MANAGER_SLUG --session session.txt" >&2
    fi
fi

if [[ "$EXTRACT_ONLY" == true ]]; then
    cat "$EXTRACTED_TEXT_FILE"
    exit 0
fi

# ─── Pipe to gemini-cli King's Hand ──────────────────────────────────────────

# The gemini-cli in this environment is pre-configured as The King's Hand.
# We pipe the extracted text as stdin; the -p flag provides the analysis trigger.
# The King's Hand system prompt takes over from there.

ANALYSIS_PROMPT="以下是待分析的專案文件，請直接開始產出五模組情報報告，勿加任何前言或自我介紹。"

echo "[analyze_pptx] Running King's Hand analysis via gemini-cli..." >&2
echo "" >&2

if [[ -n "$OUTPUT_FILE" ]]; then
    gemini \
        --output-format text \
        -p "$ANALYSIS_PROMPT" \
        < "$EXTRACTED_TEXT_FILE" \
        | tee "$OUTPUT_FILE"
    echo "" >&2
    echo "[analyze_pptx] Report written to: $OUTPUT_FILE" >&2
else
    gemini \
        --output-format text \
        -p "$ANALYSIS_PROMPT" \
        < "$EXTRACTED_TEXT_FILE"
fi
