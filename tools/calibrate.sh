#!/usr/bin/env bash
# calibrate.sh — Assemble calibration input from a King's Hand session transcript
#
# Reads a session transcript (project documents + King's Hand output + manager
# questions/feedback), assembles it with the CALIBRATE.md meta-skill prompt
# and any existing Manager Profile, and outputs the combined calibration input.
#
# Paste the output into your AI agent session (Claude, etc.) to generate an
# updated Manager Profile. Save the agent's output to manager_profiles/[name].md.
#
# Run this after each weekly review session to keep the profile current.
# The richer the profile becomes, the more calibrated future analyses will be.
#
# USAGE:
#   ./tools/calibrate.sh --manager NAME --session session.txt
#   ./tools/calibrate.sh --manager NAME --session session.txt --output calibration_input.txt
#   ./tools/calibrate.sh --manager NAME  (reads session transcript from stdin)
#
# SESSION TRANSCRIPT FORMAT:
#   The session transcript should contain:
#   1. The project documents that were submitted for analysis
#   2. The King's Hand output that was produced (copy from the session)
#   3. The manager's follow-up questions and your responses
#   4. Any corrections the manager made ("actually, that's not quite right...")
#   5. [Optional] Notes on what the manager found most/least useful
#
#   There is no required format — paste the raw conversation. The more context
#   you include, the better the calibration.
#
# FIRST-TIME SETUP:
#   For a new manager with no existing profile, the tool creates a profile
#   from scratch based on the session transcript alone.
#
#   For Henry (the default user), a starter profile already exists at
#   manager_profiles/henry.md based on the test suite calibration.
#
# EXAMPLES:
#   # After a session, save the transcript and assemble calibration input
#   ./tools/calibrate.sh --manager henry --session weekly_session_2026-03-25.txt
#
#   # For a new manager in a different domain
#   ./tools/calibrate.sh --manager sarah_vp_supply_chain --session session.txt
#
#   # Read from stdin (pipe from a file or heredoc)
#   cat session_transcript.txt | ./tools/calibrate.sh --manager henry
#
# DEPENDENCIES:
#   None (text assembly only)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CALIBRATE_SKILL="$REPO_ROOT/skills/the-kings-hand/CALIBRATE.md"
PROFILES_DIR="$REPO_ROOT/manager_profiles"

# ─── Argument parsing ─────────────────────────────────────────────────────────

MANAGER_NAME=""
SESSION_FILE=""
OUTPUT_FILE=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --manager|-m) MANAGER_NAME="$2"; shift 2 ;;
        --session|-s) SESSION_FILE="$2"; shift 2 ;;
        --output|-o)  OUTPUT_FILE="$2"; shift 2 ;;
        --help|-h)
            sed -n '3,/^# DEPENDENCIES/{ /^# DEPENDENCIES/d; s/^# \{0,3\}//; p }' "$0"
            exit 0
            ;;
        *) echo "Unknown option: $1" >&2; exit 1 ;;
    esac
done

if [[ -z "$MANAGER_NAME" ]]; then
    echo "ERROR: --manager NAME is required." >&2
    echo "Usage: ./tools/calibrate.sh --manager NAME [--session FILE]" >&2
    exit 1
fi

# Normalize manager name to lowercase with underscores for filename
MANAGER_SLUG="$(echo "$MANAGER_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')"
PROFILE_PATH="$PROFILES_DIR/$MANAGER_SLUG.md"

# ─── Build session input ──────────────────────────────────────────────────────

TMPDIR_WORK="$(mktemp -d)"
trap 'rm -rf "$TMPDIR_WORK"' EXIT

SESSION_CONTENT_FILE="$TMPDIR_WORK/session.txt"

if [[ -n "$SESSION_FILE" ]]; then
    if [[ ! -f "$SESSION_FILE" ]]; then
        echo "ERROR: Session file not found: $SESSION_FILE" >&2
        exit 1
    fi
    cp "$SESSION_FILE" "$SESSION_CONTENT_FILE"
elif ! [ -t 0 ]; then
    # Stdin is being piped
    cat > "$SESSION_CONTENT_FILE"
else
    # Interactive: prompt for paste
    echo "Paste the session transcript below."
    echo "Include: project documents analyzed, King's Hand output, manager questions/feedback."
    echo "Press Ctrl+D on a new line when done."
    echo "────────────────────────────────────────────────────────────────────────────────"
    cat > "$SESSION_CONTENT_FILE"
    echo ""
fi

LINE_COUNT="$(wc -l < "$SESSION_CONTENT_FILE")"
echo "[calibrate] Session transcript: $LINE_COUNT lines" >&2

if [[ "$LINE_COUNT" -lt 5 ]]; then
    echo "ERROR: Session transcript appears too short (< 5 lines). Did you forget to paste it?" >&2
    exit 1
fi

# ─── Assemble calibration input ───────────────────────────────────────────────

CALIBRATION_INPUT="$TMPDIR_WORK/calibration_input.txt"

# Structure: CALIBRATE.md instructions + existing profile (if any) + session
{
    # Extract the instructions from CALIBRATE.md (everything except the XML wrapper comments)
    cat "$CALIBRATE_SKILL"
    echo ""
    echo "════════════════════════════════════════════════════════════════════════════════"
    echo "EXISTING MANAGER PROFILE (update this based on the session below):"
    echo "════════════════════════════════════════════════════════════════════════════════"
    echo ""
    if [[ -f "$PROFILE_PATH" ]]; then
        cat "$PROFILE_PATH"
        echo "[calibrate] Existing profile found at $PROFILE_PATH — will update." >&2
    else
        echo "(No existing profile for manager '$MANAGER_NAME'. Create a new profile from scratch.)"
        echo "[calibrate] No existing profile — creating new profile for '$MANAGER_NAME'." >&2
    fi
    echo ""
    echo "════════════════════════════════════════════════════════════════════════════════"
    echo "SESSION TRANSCRIPT (analyze this to update the profile):"
    echo "════════════════════════════════════════════════════════════════════════════════"
    echo ""
    cat "$SESSION_CONTENT_FILE"
} > "$CALIBRATION_INPUT"

# ─── Output calibration input ────────────────────────────────────────────────

if [[ -n "$OUTPUT_FILE" ]]; then
    cp "$CALIBRATION_INPUT" "$OUTPUT_FILE"
    echo "[calibrate] Calibration input written to: $OUTPUT_FILE" >&2
else
    cat "$CALIBRATION_INPUT"
fi

echo "" >&2
echo "[calibrate] Paste the output above into your AI agent session." >&2
echo "[calibrate] Save the agent's [MANAGER PROFILE] output to: $PROFILE_PATH" >&2
