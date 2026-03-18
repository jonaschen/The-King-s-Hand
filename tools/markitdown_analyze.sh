#!/usr/bin/env bash
# markitdown_analyze.sh — Multi-format document analysis for The King's Hand
#
# Uses Microsoft markitdown to convert a document to Markdown, then pipes
# to the gemini-cli King's Hand agent. Handles pptx, pdf, docx, xlsx, and more.
#
# USAGE:
#   ./tools/markitdown_analyze.sh document.pptx
#   ./tools/markitdown_analyze.sh report.pdf
#   ./tools/markitdown_analyze.sh status_report.docx
#   ./tools/markitdown_analyze.sh jira_export.xlsx
#   ./tools/markitdown_analyze.sh document.pptx --output report.md
#   ./tools/markitdown_analyze.sh document.pptx --extract-only
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
# This is the recommended tool when document format varies week-to-week.
# For .pptx specifically, python-pptx (pptx_to_text.py) gives better slide
# structure. Use this tool when you receive reports in PDF or Word format.
#
# REQUIRES:
#   pip install markitdown
#   gemini-cli (already installed)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ─── Argument parsing ─────────────────────────────────────────────────────────

INPUT_FILE=""
EXTRACT_ONLY=false
OUTPUT_FILE=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --extract-only) EXTRACT_ONLY=true; shift ;;
        --output|-o)    OUTPUT_FILE="$2"; shift 2 ;;
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

# ─── Output mode: extract only ───────────────────────────────────────────────

if [[ "$EXTRACT_ONLY" == true ]]; then
    cat "$EXTRACTED_FILE"
    exit 0
fi

# ─── Pipe to gemini-cli King's Hand ──────────────────────────────────────────

ANALYSIS_PROMPT="以下是待分析的專案文件，請直接開始產出五模組情報報告，勿加任何前言或自我介紹。"

echo "[markitdown_analyze] Running King's Hand analysis via gemini-cli..." >&2
echo "" >&2

if [[ -n "$OUTPUT_FILE" ]]; then
    gemini \
        --output-format text \
        -p "$ANALYSIS_PROMPT" \
        < "$EXTRACTED_FILE" \
        | tee "$OUTPUT_FILE"
    echo "" >&2
    echo "[markitdown_analyze] Report written to: $OUTPUT_FILE" >&2
else
    gemini \
        --output-format text \
        -p "$ANALYSIS_PROMPT" \
        < "$EXTRACTED_FILE"
fi
