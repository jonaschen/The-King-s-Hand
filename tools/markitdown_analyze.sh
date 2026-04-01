#!/usr/bin/env bash
# markitdown_analyze.sh — Multi-format document extraction for The King's Hand
#
# Uses Microsoft markitdown to convert a document to Markdown text suitable
# for pasting into The King's Hand agent. Handles pptx, pdf, docx, xlsx, and more.
#
# USAGE:
#   ./tools/markitdown_analyze.sh document.pptx
#   ./tools/markitdown_analyze.sh report.pdf
#   ./tools/markitdown_analyze.sh status_report.docx
#   ./tools/markitdown_analyze.sh jira_export.xlsx
#   ./tools/markitdown_analyze.sh document.pptx --output extracted.md
#   ./tools/markitdown_analyze.sh document.pptx --manager henry
#
# SUPPORTED FORMATS (via markitdown):
#   .pptx   PowerPoint presentations
#   .pdf    PDF documents (text-extractable)
#   .docx   Word documents
#   .xlsx   Excel spreadsheets
#   .html   Web pages
#   .csv    Comma-separated values
#   .txt    Plain text
#
# OUTPUT:
#   Prints extracted Markdown to stdout (default) or writes to --output FILE.
#   Paste the output into your King's Hand agent session for analysis.
#
# REQUIRES:
#   pip install markitdown

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ─── Argument parsing ─────────────────────────────────────────────────────────

INPUT_FILE=""
OUTPUT_FILE=""
MANAGER_NAME=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --output|-o)    OUTPUT_FILE="$2"; shift 2 ;;
        --manager|-m)   MANAGER_NAME="$2"; shift 2 ;;
        --help|-h)
            sed -n '2,/^# REQUIRES/{ /^# REQUIRES/d; s/^# \{0,3\}//; p }' "$0"
            exit 0
            ;;
        -*)  echo "Unknown option: $1" >&2; exit 1 ;;
        *)
            if [[ -z "$INPUT_FILE" ]]; then INPUT_FILE="$1"
            else echo "Unexpected argument: $1" >&2; exit 1
            fi
            shift
            ;;
    esac
done

if [[ -z "$INPUT_FILE" ]]; then
    echo "ERROR: No input file specified." >&2
    exit 1
fi

if [[ ! -f "$INPUT_FILE" ]]; then
    echo "ERROR: File not found: $INPUT_FILE" >&2
    exit 1
fi

# ─── Dependency check ─────────────────────────────────────────────────────────

if ! python3 -c "import markitdown" 2>/dev/null; then
    echo "ERROR: markitdown is not installed." >&2
    echo "Run:   pip install markitdown" >&2
    exit 1
fi

INPUT_PATH="$(realpath "$INPUT_FILE")"
TMPDIR_WORK="$(mktemp -d)"
trap 'rm -rf "$TMPDIR_WORK"' EXIT

# ─── Convert with markitdown ──────────────────────────────────────────────────

EXTRACTED_FILE="$TMPDIR_WORK/extracted.md"
EXT="${INPUT_FILE##*.}"

echo "[markitdown_analyze] Converting $(basename "$INPUT_PATH") ($EXT) to Markdown..." >&2

python3 - <<PYEOF > "$EXTRACTED_FILE"
from markitdown import MarkItDown
md = MarkItDown()
result = md.convert("$INPUT_PATH")
print(result.text_content)
PYEOF

LINE_COUNT="$(wc -l < "$EXTRACTED_FILE")"
echo "[markitdown_analyze] Extracted $LINE_COUNT lines." >&2

# ─── Manager profile injection ───────────────────────────────────────────────

REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

if [[ -n "$MANAGER_NAME" ]]; then
    MANAGER_SLUG="$(echo "$MANAGER_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')"
    PROFILE_PATH="$REPO_ROOT/manager_profiles/$MANAGER_SLUG.md"
    if [[ -f "$PROFILE_PATH" ]]; then
        COMBINED_FILE="$TMPDIR_WORK/with_profile.txt"
        {
            cat "$PROFILE_PATH"
            echo ""
            echo "════════════════════════════════════════════════════════════════════════════════"
            echo "PROJECT DOCUMENTS FOR ANALYSIS:"
            echo "════════════════════════════════════════════════════════════════════════════════"
            echo ""
            cat "$EXTRACTED_FILE"
        } > "$COMBINED_FILE"
        EXTRACTED_FILE="$COMBINED_FILE"
        echo "[markitdown_analyze] Manager profile injected: $PROFILE_PATH" >&2
    else
        echo "[markitdown_analyze] WARNING: No profile found for '$MANAGER_NAME' at $PROFILE_PATH" >&2
    fi
fi

# ─── Output extracted text ───────────────────────────────────────────────────

if [[ -n "$OUTPUT_FILE" ]]; then
    cp "$EXTRACTED_FILE" "$OUTPUT_FILE"
    echo "[markitdown_analyze] Extracted text written to: $OUTPUT_FILE" >&2
else
    cat "$EXTRACTED_FILE"
fi
