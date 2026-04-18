#!/usr/bin/env bash
# compliance_check.sh — Validate structural compliance of The King's Hand
#
# Checks:
#   1. output_rules.json is valid JSON
#   2. Required file structure exists
#   3. SKILL.md contains no bullet lists in analytical output examples
#   4. Domain pack completeness
#   5. Test case count matches expected
#
# Exit code: 0 if all checks pass, 1 if any fail.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILL_DIR="$ROOT/skills/universal-kings-hand"

PASS=0
FAIL=0
WARN=0

pass() { PASS=$((PASS + 1)); echo "  ✓ $1"; }
fail() { FAIL=$((FAIL + 1)); echo "  ✗ $1" >&2; }
warn() { WARN=$((WARN + 1)); echo "  ⚠ $1"; }

echo "=== The King's Hand — Compliance Check ==="
echo ""

# --- 1. output_rules.json ---
echo "[1/5] Validating output_rules.json"
RULES_FILE="$ROOT/compliance/output_rules.json"
if [ ! -f "$RULES_FILE" ]; then
    fail "compliance/output_rules.json not found"
else
    if python3 -c "import json; json.load(open('$RULES_FILE'))" 2>/dev/null; then
        pass "output_rules.json is valid JSON"
    else
        fail "output_rules.json is invalid JSON"
    fi

    # Check required top-level keys
    for key in structure formatting_rules tone_rules status_light_rules ppa_quantification_rules question_rules workaround_detection_rules; do
        if python3 -c "
import json, sys
rules = json.load(open('$RULES_FILE'))
sys.exit(0 if '$key' in rules else 1)
" 2>/dev/null; then
            pass "output_rules.json contains '$key'"
        else
            fail "output_rules.json missing key '$key'"
        fi
    done
fi
echo ""

# --- 2. Required file structure ---
echo "[2/5] Checking required files"
REQUIRED_FILES=(
    "CLAUDE.md"
    "AGENTS.md"
    "ROADMAP.md"
    "README.md"
    "THE_KING_S_HAND_DEV_PLAN.md"
    "MAKE_EVERYBODY_KING_OR_QUEEN.md"
    "skills/universal-kings-hand/SKILL.md"
    "skills/universal-kings-hand/CALIBRATE.md"
    "skills/universal-kings-hand/references/framework_templates.md"
    "skills/universal-kings-hand/references/domain_inference_signals.md"
    "tests/evaluation_rubric.md"
    "tools/kings-hand.sh"
    "tools/daily_kings_hand_assessment.sh"
)

for f in "${REQUIRED_FILES[@]}"; do
    if [ -f "$ROOT/$f" ]; then
        pass "$f exists"
    else
        fail "$f missing"
    fi
done
echo ""

# --- 3. SKILL.md content checks ---
echo "[3/5] Checking SKILL.md content"
SKILL_FILE="$SKILL_DIR/SKILL.md"
if [ -f "$SKILL_FILE" ]; then
    LINE_COUNT=$(wc -l < "$SKILL_FILE")
    if [ "$LINE_COUNT" -ge 500 ]; then
        pass "SKILL.md has $LINE_COUNT lines (≥500)"
    else
        fail "SKILL.md only has $LINE_COUNT lines (expected ≥500)"
    fi

    for keyword in "operating_modes" "role_definition" "Living Work State" "six-element" "Calibration" "Full Analysis"; do
        if grep -qi "$keyword" "$SKILL_FILE" 2>/dev/null; then
            pass "SKILL.md contains '$keyword'"
        else
            fail "SKILL.md missing keyword '$keyword'"
        fi
    done
else
    fail "SKILL.md not found"
fi
echo ""

# --- 4. Domain pack completeness ---
echo "[4/5] Checking domain packs"
declare -A PACK_COUNTS
PACK_COUNTS[ic_design]=5
PACK_COUNTS[software_startup]=4
PACK_COUNTS[medical_device]=4
PACK_COUNTS[_template]=4

for domain in ic_design software_startup medical_device _template; do
    PACK_DIR="$SKILL_DIR/domain_packs/$domain"
    if [ -d "$PACK_DIR" ]; then
        COUNT=$(find "$PACK_DIR" -name '*.md' -type f | wc -l)
        EXPECTED="${PACK_COUNTS[$domain]}"
        if [ "$COUNT" -eq "$EXPECTED" ]; then
            pass "$domain: $COUNT/$EXPECTED files"
        else
            fail "$domain: $COUNT/$EXPECTED files"
        fi
    else
        fail "$domain: directory missing"
    fi
done
echo ""

# --- 5. Test case counts ---
echo "[5/5] Checking test cases"
IC_COUNT=$(find "$ROOT/tests/test_cases" -name '*.md' -type f 2>/dev/null | wc -l)
if [ "$IC_COUNT" -eq 16 ]; then
    pass "IC test cases: $IC_COUNT/16"
else
    fail "IC test cases: $IC_COUNT/16"
fi

CROSS_COUNT=$(find "$SKILL_DIR/tests/cross_domain" -name '*.md' -type f 2>/dev/null | wc -l)
if [ "$CROSS_COUNT" -eq 3 ]; then
    pass "Cross-domain test cases: $CROSS_COUNT/3"
else
    fail "Cross-domain test cases: $CROSS_COUNT/3"
fi
echo ""

# --- Summary ---
echo "=== Summary ==="
echo "  Pass: $PASS"
echo "  Fail: $FAIL"
echo "  Warn: $WARN"
echo ""

if [ "$FAIL" -gt 0 ]; then
    echo "RESULT: FAIL ($FAIL issues found)"
    exit 1
else
    echo "RESULT: PASS (all checks passed)"
    exit 0
fi
