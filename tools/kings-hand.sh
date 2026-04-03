#!/usr/bin/env bash
# kings-hand.sh — Launch The King's Hand as a persistent working partner
#
# Assembles the system prompt, Manager Profile, and Living Work State,
# then launches an interactive Claude Code session.
#
# USAGE:
#   ./tools/kings-hand.sh                      # New user (triggers calibration)
#   ./tools/kings-hand.sh --manager jonas       # Existing user with profile
#   ./tools/kings-hand.sh --manager jonas --repo ~/projects/my-app
#   ./tools/kings-hand.sh --manager jonas --analyze report.pdf
#   ./tools/kings-hand.sh --manager jonas --ask "Is this email hiding something?"
#
# OPTIONS:
#   --manager NAME    Load Manager Profile and Living Work State for NAME
#   --repo PATH       Set working directory to PATH (for repo-aware features).
#                     Claude will run git/gh commands relative to this path.
#                     Can be specified multiple times for multi-repo context.
#   --analyze FILE    Extract text from FILE and submit for Full Analysis
#   --ask QUESTION    Start with a specific question (Quick Scan mode)
#   --status          Show current Living Work State and exit
#   --help            Show this help
#
# FIRST-TIME SETUP:
#   Run without --manager to start a calibration conversation.
#   The system will get to know you in 3-5 questions, then create
#   your Manager Profile and Living Work State automatically.
#
# DAILY USE:
#   Just run with --manager and start talking. Tell the system what
#   happened today, ask it to look at something, or ask for your
#   weekly report. It maintains state across sessions.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILL_DIR="$REPO_ROOT/skills/universal-kings-hand"
SKILL_FILE="$SKILL_DIR/SKILL.md"
PROFILES_DIR="$REPO_ROOT/manager_profiles"
WORK_STATE_DIR="$REPO_ROOT/work_state"

# ─── Argument parsing ────────────────────────────────────────────────────────

MANAGER_NAME=""
ANALYZE_FILE=""
ASK_QUESTION=""
SHOW_STATUS=false
REPO_PATHS=()

while [[ $# -gt 0 ]]; do
    case "$1" in
        --manager|-m)   MANAGER_NAME="$2"; shift 2 ;;
        --repo|-r)      REPO_PATHS+=("$(realpath "$2")"); shift 2 ;;
        --analyze|-a)   ANALYZE_FILE="$2"; shift 2 ;;
        --ask|-q)       ASK_QUESTION="$2"; shift 2 ;;
        --status|-s)    SHOW_STATUS=true; shift ;;
        --help|-h)
            sed -n '2,/^set -euo/{ /^set -euo/d; s/^# \{0,3\}//; p }' "$0"
            exit 0
            ;;
        -*)  echo "Unknown option: $1" >&2; exit 1 ;;
        *)
            # Treat bare argument as a file to analyze
            if [[ -z "$ANALYZE_FILE" && -f "$1" ]]; then
                ANALYZE_FILE="$1"
            else
                echo "Unexpected argument: $1" >&2; exit 1
            fi
            shift
            ;;
    esac
done

# ─── Resolve manager paths ──────────────────────────────────────────────────

MANAGER_SLUG=""
PROFILE_PATH=""
WORK_STATE_PATH=""

if [[ -n "$MANAGER_NAME" ]]; then
    MANAGER_SLUG="$(echo "$MANAGER_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')"
    PROFILE_PATH="$PROFILES_DIR/$MANAGER_SLUG.md"
    WORK_STATE_PATH="$WORK_STATE_DIR/$MANAGER_SLUG.md"
fi

# ─── Status display ─────────────────────────────────────────────────────────

if [[ "$SHOW_STATUS" == true ]]; then
    if [[ -z "$MANAGER_NAME" ]]; then
        echo "ERROR: --status requires --manager NAME" >&2
        exit 1
    fi
    if [[ -f "$WORK_STATE_PATH" ]]; then
        cat "$WORK_STATE_PATH"
    else
        echo "No Living Work State found for '$MANAGER_NAME'."
        echo "Start a session with: ./tools/kings-hand.sh --manager $MANAGER_SLUG"
    fi
    exit 0
fi

# ─── Verify skill files exist ───────────────────────────────────────────────

if [[ ! -f "$SKILL_FILE" ]]; then
    echo "ERROR: SKILL.md not found at $SKILL_FILE" >&2
    exit 1
fi

# ─── Assemble system prompt context ─────────────────────────────────────────

TMPDIR_WORK="$(mktemp -d)"
trap 'rm -rf "$TMPDIR_WORK"' EXIT

SYSTEM_CONTEXT="$TMPDIR_WORK/system_context.md"
{
    cat "$SKILL_FILE"
    echo ""

    # Append Manager Profile if available
    if [[ -n "$PROFILE_PATH" && -f "$PROFILE_PATH" ]]; then
        echo "════════════════════════════════════════════════════════════════════════════════"
        echo "MANAGER PROFILE (loaded from $PROFILE_PATH):"
        echo "════════════════════════════════════════════════════════════════════════════════"
        echo ""
        cat "$PROFILE_PATH"
        echo ""
    fi

    # Append Living Work State if available
    if [[ -n "$WORK_STATE_PATH" && -f "$WORK_STATE_PATH" ]]; then
        echo "════════════════════════════════════════════════════════════════════════════════"
        echo "LIVING WORK STATE (loaded from $WORK_STATE_PATH):"
        echo "════════════════════════════════════════════════════════════════════════════════"
        echo ""
        cat "$WORK_STATE_PATH"
        echo ""
    fi

    # Append domain pack references (list available packs)
    echo "════════════════════════════════════════════════════════════════════════════════"
    echo "AVAILABLE DOMAIN PACKS:"
    echo "════════════════════════════════════════════════════════════════════════════════"
    for pack_dir in "$SKILL_DIR/domain_packs"/*/; do
        pack_name="$(basename "$pack_dir")"
        [[ "$pack_name" == "_template" ]] && continue
        echo "  - $pack_name"
    done
    echo ""

    # Append repo context snapshots (if --repo specified)
    if [[ ${#REPO_PATHS[@]} -gt 0 ]]; then
        echo "════════════════════════════════════════════════════════════════════════════════"
        echo "REPOSITORY CONTEXT (auto-loaded — use tools to dig deeper):"
        echo "════════════════════════════════════════════════════════════════════════════════"
        echo ""
        for rp in "${REPO_PATHS[@]}"; do
            repo_name="$(basename "$rp")"
            echo "── Repository: $repo_name ($rp) ──"
            echo ""
            if [[ -d "$rp/.git" ]]; then
                echo "Recent commits (last 10):"
                git -C "$rp" log --oneline -10 2>/dev/null || echo "  (git log failed)"
                echo ""
                uncommitted="$(git -C "$rp" status --short 2>/dev/null)"
                if [[ -n "$uncommitted" ]]; then
                    echo "Uncommitted changes:"
                    echo "$uncommitted"
                    echo ""
                fi
                if command -v gh &>/dev/null; then
                    open_issues="$(gh issue list --repo "$rp" --limit 10 2>/dev/null)" || open_issues=""
                    if [[ -n "$open_issues" ]]; then
                        echo "Open issues (top 10):"
                        echo "$open_issues"
                        echo ""
                    fi
                    open_prs="$(gh pr list --repo "$rp" --limit 10 2>/dev/null)" || open_prs=""
                    if [[ -n "$open_prs" ]]; then
                        echo "Open PRs (top 10):"
                        echo "$open_prs"
                        echo ""
                    fi
                fi
            else
                echo "  (Not a git repository)"
                echo ""
            fi
            # Include ROADMAP or TODO if present
            for doc in ROADMAP.md TODO.md TODO.txt; do
                if [[ -f "$rp/$doc" ]]; then
                    echo "── $doc (first 50 lines) ──"
                    head -50 "$rp/$doc"
                    echo ""
                    echo "[... truncated — use Read tool for full content]"
                    echo ""
                fi
            done
        done
    fi

} > "$SYSTEM_CONTEXT"

# ─── Prepare initial message ────────────────────────────────────────────────

INITIAL_MESSAGE=""

if [[ -n "$ANALYZE_FILE" ]]; then
    # File analysis mode — extract text and submit
    if [[ ! -f "$ANALYZE_FILE" ]]; then
        echo "ERROR: File not found: $ANALYZE_FILE" >&2
        exit 1
    fi

    EXT="${ANALYZE_FILE##*.}"
    EXTRACTED_FILE="$TMPDIR_WORK/extracted.txt"

    echo "[kings-hand] Extracting text from: $(basename "$ANALYZE_FILE")" >&2

    case "$EXT" in
        pptx)
            if python3 -c "import markitdown" 2>/dev/null; then
                python3 -c "
from markitdown import MarkItDown
md = MarkItDown()
result = md.convert('$(realpath "$ANALYZE_FILE")')
print(result.text_content)
" > "$EXTRACTED_FILE"
            elif python3 -c "import pptx" 2>/dev/null; then
                python3 "$SCRIPT_DIR/pptx_to_text.py" "$(realpath "$ANALYZE_FILE")" > "$EXTRACTED_FILE"
            else
                echo "ERROR: No pptx extractor. Install: pip install markitdown" >&2
                exit 1
            fi
            ;;
        pdf|docx|xlsx|html|csv)
            if python3 -c "import markitdown" 2>/dev/null; then
                python3 -c "
from markitdown import MarkItDown
md = MarkItDown()
result = md.convert('$(realpath "$ANALYZE_FILE")')
print(result.text_content)
" > "$EXTRACTED_FILE"
            else
                echo "ERROR: markitdown required for .$EXT. Install: pip install markitdown" >&2
                exit 1
            fi
            ;;
        txt|md)
            cp "$(realpath "$ANALYZE_FILE")" "$EXTRACTED_FILE"
            ;;
        *)
            echo "ERROR: Unsupported file type: .$EXT" >&2
            exit 1
            ;;
    esac

    LINE_COUNT="$(wc -l < "$EXTRACTED_FILE")"
    echo "[kings-hand] Extracted $LINE_COUNT lines." >&2

    INITIAL_MESSAGE="請分析以下專案文件，直接開始產出五模組情報報告。

$(cat "$EXTRACTED_FILE")"

elif [[ -n "$ASK_QUESTION" ]]; then
    INITIAL_MESSAGE="$ASK_QUESTION"
fi

# ─── Launch Claude session ──────────────────────────────────────────────────

echo "[kings-hand] Launching The King's Hand..." >&2
if [[ -n "$MANAGER_NAME" ]]; then
    if [[ -f "$PROFILE_PATH" ]]; then
        echo "[kings-hand] Manager profile: $PROFILE_PATH" >&2
    else
        echo "[kings-hand] No profile for '$MANAGER_NAME' — calibration mode will activate." >&2
    fi
    if [[ -f "$WORK_STATE_PATH" ]]; then
        echo "[kings-hand] Work state: $WORK_STATE_PATH" >&2
    fi
fi
if [[ ${#REPO_PATHS[@]} -gt 0 ]]; then
    for rp in "${REPO_PATHS[@]}"; do
        echo "[kings-hand] Repo context: $rp" >&2
    done
fi
echo "" >&2

# Determine working directory: first --repo path, or current directory
WORK_DIR="$(pwd)"
if [[ ${#REPO_PATHS[@]} -gt 0 ]]; then
    WORK_DIR="${REPO_PATHS[0]}"
fi

CLAUDE_ARGS=(--system-prompt "$(cat "$SYSTEM_CONTEXT")")
if [[ -n "$INITIAL_MESSAGE" ]]; then
    CLAUDE_ARGS+=(--initial-prompt "$INITIAL_MESSAGE")
fi

cd "$WORK_DIR" && exec claude "${CLAUDE_ARGS[@]}"
