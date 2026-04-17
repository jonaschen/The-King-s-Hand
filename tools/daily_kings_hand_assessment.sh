#!/bin/bash
# daily_kings_hand_assessment.sh — King's Hand daily assessment of tracked projects
#
# Runs a King's Hand adversarial analysis on the two highest-priority side projects:
#   1. long-term-care-expert (花菜/Hanana)
#   2. agent-skill-automation
#
# Checks recent commits, ROADMAP blockers, gate conditions, and updates
# the tracking memory files in The King's Hand repo.
#
# Schedule: Daily at 7:30am Asia/Taipei (after stewards finish, before LTC steward starts)
#
# Usage: Called by cron, or manually: ./tools/daily_kings_hand_assessment.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
LOG_DIR="$REPO_ROOT/logs"
DATE=$(date +"%Y-%m-%d")
LOG_FILE="$LOG_DIR/kings-hand-assessment-${DATE}.log"

# Resolve claude CLI dynamically — works across NVM version changes
if command -v claude &>/dev/null; then
  CLAUDE="$(command -v claude)"
elif [ -n "${NVM_DIR:-}" ] && [ -x "$(find "$NVM_DIR/versions/node" -name claude -type f 2>/dev/null | head -1)" ]; then
  CLAUDE="$(find "$NVM_DIR/versions/node" -name claude -type f 2>/dev/null | head -1)"
else
  echo "ERROR: claude CLI not found. Install with: npm i -g @anthropic-ai/claude-code" >&2
  exit 1
fi

# Tracked project repos
LTC_REPO="/home/jonas/gemini-home/long-term-care-expert"
ASA_REPO="/home/jonas/gemini-home/agent-skill-automation"

# Derive memory dir from repo root path (matches Claude Code's project path convention)
REPO_PATH_SLUG="$(echo "$REPO_ROOT" | sed 's|/|-|g; s|^-||')"
MEMORY_DIR="$HOME/.claude/projects/-${REPO_PATH_SLUG}/memory"

mkdir -p "$LOG_DIR"

# CVE-2026-35020 mitigation
unset TERMINAL

echo "=== King's Hand Daily Assessment — $DATE ===" | tee "$LOG_FILE"
echo "Start: $(date '+%Y-%m-%d %H:%M:%S')" | tee -a "$LOG_FILE"

# Pre-flight checks — verify repos exist before gathering data
SKIP_LTC=false
SKIP_ASA=false

if [ ! -d "$LTC_REPO/.git" ]; then
  echo "WARNING: LTC repo not found at $LTC_REPO — skipping" | tee -a "$LOG_FILE"
  SKIP_LTC=true
fi

if [ ! -d "$ASA_REPO/.git" ]; then
  echo "WARNING: ASA repo not found at $ASA_REPO — skipping" | tee -a "$LOG_FILE"
  SKIP_ASA=true
fi

if [ "$SKIP_LTC" = true ] && [ "$SKIP_ASA" = true ]; then
  echo "ERROR: No tracked repos available. Nothing to assess." | tee -a "$LOG_FILE"
  exit 1
fi

# Gather context for the prompt
if [ "$SKIP_LTC" = false ]; then
  LTC_COMMITS=$(cd "$LTC_REPO" && git log --oneline -10 2>/dev/null)
  LTC_TRACKING=$(cat "$MEMORY_DIR/tracked_project_ltc.md" 2>/dev/null || echo "No tracking file found")
else
  LTC_COMMITS=""
  LTC_TRACKING=""
fi

if [ "$SKIP_ASA" = false ]; then
  ASA_COMMITS=$(cd "$ASA_REPO" && git log --oneline -10 2>/dev/null)
  ASA_TRACKING=$(cat "$MEMORY_DIR/tracked_project_asa.md" 2>/dev/null || echo "No tracking file found")
else
  ASA_COMMITS=""
  ASA_TRACKING=""
fi

START_TIME=$(date +%s)

# Build --add-dir flags conditionally
ADD_DIR_FLAGS=()
[ "$SKIP_LTC" = false ] && ADD_DIR_FLAGS+=(--add-dir "$LTC_REPO")
[ "$SKIP_ASA" = false ] && ADD_DIR_FLAGS+=(--add-dir "$ASA_REPO")
ADD_DIR_FLAGS+=(--add-dir "$MEMORY_DIR")

(cd "$REPO_ROOT" && timeout 1800 "$CLAUDE" \
  --dangerously-skip-permissions \
  --model claude-sonnet-4-20250514 \
  "${ADD_DIR_FLAGS[@]}" \
  -p "$(cat <<PROMPT
You are The King's Hand — a persistent working partner performing a daily adversarial assessment of two tracked projects. Today is ${DATE}.

## Your Task

Assess both projects below. For each project:
1. Compare the RECENT COMMITS against the PREVIOUS TRACKING STATE to identify what changed
2. Read the project's ROADMAP.md to check gate conditions and blockers
3. Detect watermelon patterns (green outside, red inside): busy commits that don't advance gate conditions
4. Identify new risks or resolved blockers
5. Update the tracking memory file with today's findings

## Project 1: long-term-care-expert (花菜/Hanana)
**Repo:** ${LTC_REPO}
**Recent commits:**
${LTC_COMMITS}

**Previous tracking state:**
${LTC_TRACKING}

## Project 2: agent-skill-automation
**Repo:** ${ASA_REPO}
**Recent commits:**
${ASA_COMMITS}

**Previous tracking state:**
${ASA_TRACKING}

## Instructions

1. Read each project's ROADMAP.md (focus on in-progress phases, gate conditions, blockers)
2. For agent-skill-automation, also check logs/performance/ for latest agent run results
3. Write your assessment to STDOUT in this format:

---
## 每日專案評估 — ${DATE}

### LTC Expert (花菜): [GREEN/YELLOW/RED]
- 進展：...
- 風險：...
- Action items：...

### Agent Skill Automation: [GREEN/YELLOW/RED]
- 進展：...
- 風險：...
- Action items：...

### 跨專案觀察
...
---

4. Update the tracking files:
   - Write updated content to: ${MEMORY_DIR}/tracked_project_ltc.md
   - Write updated content to: ${MEMORY_DIR}/tracked_project_asa.md
   Keep the same frontmatter format. Update the "Last assessed" date, status, blockers, and add a dated note for today's findings.

5. Be concise. No filler. Lead with what changed since last assessment.
PROMPT
)") 2>&1 | tee -a "$LOG_FILE"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "" | tee -a "$LOG_FILE"
echo "Duration: ${DURATION}s" | tee -a "$LOG_FILE"
echo "End: $(date '+%Y-%m-%d %H:%M:%S')" | tee -a "$LOG_FILE"
