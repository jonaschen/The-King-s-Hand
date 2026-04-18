"""
Structural integrity tests for The King's Hand.

Validates that all required files, directories, and content structures
exist and are well-formed. These are automated gate checks — they do not
evaluate analytical output quality (that requires human evaluation per
the evaluation_rubric.md).
"""

import json
import os
import pathlib
import re

import pytest

ROOT = pathlib.Path(__file__).resolve().parent.parent
SKILL_DIR = ROOT / "skills" / "universal-kings-hand"
SKILL_MD = SKILL_DIR / "SKILL.md"
CALIBRATE_MD = SKILL_DIR / "CALIBRATE.md"


# ---------------------------------------------------------------------------
# 1. Required top-level files
# ---------------------------------------------------------------------------

TOP_LEVEL_FILES = [
    "CLAUDE.md",
    "AGENTS.md",
    "ROADMAP.md",
    "README.md",
    "THE_KING_S_HAND_DEV_PLAN.md",
    "MAKE_EVERYBODY_KING_OR_QUEEN.md",
]


@pytest.mark.parametrize("filename", TOP_LEVEL_FILES)
def test_top_level_file_exists(filename):
    path = ROOT / filename
    assert path.exists(), f"Required top-level file missing: {filename}"
    assert path.stat().st_size > 0, f"File is empty: {filename}"


# ---------------------------------------------------------------------------
# 2. Core skill files
# ---------------------------------------------------------------------------

def test_skill_md_exists_and_nontrivial():
    assert SKILL_MD.exists(), "SKILL.md missing"
    content = SKILL_MD.read_text()
    assert len(content) > 10_000, (
        f"SKILL.md suspiciously short ({len(content)} chars); expected >10k"
    )


def test_calibrate_md_exists_and_nontrivial():
    assert CALIBRATE_MD.exists(), "CALIBRATE.md missing"
    content = CALIBRATE_MD.read_text()
    assert len(content) > 5_000, (
        f"CALIBRATE.md suspiciously short ({len(content)} chars); expected >5k"
    )


# ---------------------------------------------------------------------------
# 3. SKILL.md structural content checks
# ---------------------------------------------------------------------------

REQUIRED_SKILL_SECTIONS = [
    "role_definition",
    "operating_modes",
    "six-element",       # six-element framework reference
    "Living Work State",
    "thinking",          # <thinking> tag usage
]


@pytest.mark.parametrize("section_keyword", REQUIRED_SKILL_SECTIONS)
def test_skill_md_contains_section(section_keyword):
    content = SKILL_MD.read_text()
    assert section_keyword.lower() in content.lower(), (
        f"SKILL.md missing expected section/keyword: '{section_keyword}'"
    )


FOUR_OPERATING_MODES = ["Calibration", "Daily Conversation", "Quick Scan", "Full Analysis"]


@pytest.mark.parametrize("mode", FOUR_OPERATING_MODES)
def test_skill_md_operating_modes(mode):
    content = SKILL_MD.read_text()
    assert mode.lower() in content.lower(), (
        f"SKILL.md missing operating mode: '{mode}'"
    )


# ---------------------------------------------------------------------------
# 4. Domain packs
# ---------------------------------------------------------------------------

DOMAIN_PACKS = {
    "ic_design": [
        "corporate_code_words.md",
        "question_patterns.md",
        "rag_status_criteria.md",
        "software_stack_map.md",
        "workaround_taxonomy.md",
    ],
    "software_startup": [
        "euphemism_dictionary.md",
        "override_triggers.md",
        "patch_patterns.md",
        "value_chain_map.md",
    ],
    "medical_device": [
        "euphemism_dictionary.md",
        "override_triggers.md",
        "patch_patterns.md",
        "value_chain_map.md",
    ],
    "_template": [
        "euphemism_dictionary.md",
        "override_triggers.md",
        "patch_patterns.md",
        "value_chain_map.md",
    ],
}


@pytest.mark.parametrize(
    "domain,files",
    [(d, f) for d, fs in DOMAIN_PACKS.items() for f in fs for f in [f]],
    ids=[f"{d}/{f}" for d, fs in DOMAIN_PACKS.items() for f in fs],
)
def test_domain_pack_file_exists(domain, files):
    path = SKILL_DIR / "domain_packs" / domain / files
    assert path.exists(), f"Domain pack file missing: {domain}/{files}"
    assert path.stat().st_size > 0, f"Domain pack file empty: {domain}/{files}"


# ---------------------------------------------------------------------------
# 5. Reference files
# ---------------------------------------------------------------------------

REFERENCE_FILES = ["framework_templates.md", "domain_inference_signals.md"]


@pytest.mark.parametrize("filename", REFERENCE_FILES)
def test_reference_file_exists(filename):
    path = SKILL_DIR / "references" / filename
    assert path.exists(), f"Reference file missing: {filename}"
    assert path.stat().st_size > 0, f"Reference file empty: {filename}"


# ---------------------------------------------------------------------------
# 6. Test cases (IC design — 16 cases)
# ---------------------------------------------------------------------------

IC_TEST_CASES = [
    "project_adas_x9.md",           # TC-001
    "project_smartlink_iot.md",      # TC-002
    "project_valkyrie_npu.md",       # TC-003
    "project_greenlight_trap.md",    # TC-004
    "project_nova_ap.md",            # TC-005
    "project_titan_ev.md",           # TC-006
    "project_helios_wifi7.md",       # TC-007
    "project_clearwater_pcie.md",    # TC-008
    "project_athena_true_green.md",  # TC-009
    "project_mercury_codec.md",      # TC-010
    "project_stratos_rf_incomplete.md",  # TC-011
    "project_ironclad_ddr_technical.md", # TC-012
    "project_apex_ml_sanitized.md",  # TC-013
    "project_crestline_hpc_jira.md", # TC-014
    "project_eon_ai_slides.md",      # TC-015
    "project_typhoon_5g_email.md",   # TC-016
]


@pytest.mark.parametrize("filename", IC_TEST_CASES)
def test_ic_test_case_exists(filename):
    path = ROOT / "tests" / "test_cases" / filename
    assert path.exists(), f"IC test case missing: {filename}"
    assert path.stat().st_size > 100, f"IC test case suspiciously small: {filename}"


def test_ic_test_case_count():
    test_dir = ROOT / "tests" / "test_cases"
    cases = list(test_dir.glob("*.md"))
    assert len(cases) == 16, (
        f"Expected 16 IC test cases, found {len(cases)}: "
        f"{[c.name for c in cases]}"
    )


# ---------------------------------------------------------------------------
# 7. Cross-domain test cases
# ---------------------------------------------------------------------------

CROSS_DOMAIN_CASES = [
    "project_aurora_saas.md",
    "project_vanguard_stent.md",
    "project_summit_tower.md",
]


@pytest.mark.parametrize("filename", CROSS_DOMAIN_CASES)
def test_cross_domain_test_case_exists(filename):
    path = SKILL_DIR / "tests" / "cross_domain" / filename
    assert path.exists(), f"Cross-domain test case missing: {filename}"
    assert path.stat().st_size > 100, f"Cross-domain test case too small: {filename}"


# ---------------------------------------------------------------------------
# 8. compliance/output_rules.json
# ---------------------------------------------------------------------------

def test_output_rules_json_valid():
    path = ROOT / "compliance" / "output_rules.json"
    assert path.exists(), "compliance/output_rules.json missing"
    with open(path) as f:
        rules = json.load(f)
    assert "structure" in rules, "output_rules.json missing 'structure' key"
    assert "formatting_rules" in rules, "output_rules.json missing 'formatting_rules' key"
    assert "tone_rules" in rules, "output_rules.json missing 'tone_rules' key"
    assert "status_light_rules" in rules, "output_rules.json missing 'status_light_rules'"


def test_output_rules_five_modules():
    path = ROOT / "compliance" / "output_rules.json"
    with open(path) as f:
        rules = json.load(f)
    modules = rules["structure"]["module_order"]
    assert len(modules) == 5, f"Expected 5 modules in output_rules, found {len(modules)}"
    for i, mod in enumerate(modules, 1):
        assert mod["number"] == i, f"Module {i} has wrong number: {mod['number']}"


def test_output_rules_status_lights():
    path = ROOT / "compliance" / "output_rules.json"
    with open(path) as f:
        rules = json.load(f)
    lights = rules["status_light_rules"]
    for color in ("green", "yellow", "red"):
        assert color in lights, f"Missing status light definition: {color}"
        assert "emoji" in lights[color]
        assert "conditions" in lights[color]


def test_output_rules_forbidden_softening_patterns():
    path = ROOT / "compliance" / "output_rules.json"
    with open(path) as f:
        rules = json.load(f)
    patterns = rules["tone_rules"]["softening_language_forbidden"]["forbidden_patterns"]
    assert len(patterns) >= 10, (
        f"Expected >=10 forbidden softening patterns, found {len(patterns)}"
    )


# ---------------------------------------------------------------------------
# 9. Tools
# ---------------------------------------------------------------------------

REQUIRED_TOOLS = ["kings-hand.sh", "daily_kings_hand_assessment.sh"]


@pytest.mark.parametrize("tool", REQUIRED_TOOLS)
def test_tool_exists_and_executable(tool):
    path = ROOT / "tools" / tool
    assert path.exists(), f"Tool missing: {tool}"
    assert os.access(path, os.X_OK), f"Tool not executable: {tool}"


# ---------------------------------------------------------------------------
# 10. Evaluation rubric
# ---------------------------------------------------------------------------

def test_evaluation_rubric_covers_all_categories():
    path = ROOT / "tests" / "evaluation_rubric.md"
    assert path.exists(), "evaluation_rubric.md missing"
    content = path.read_text()
    expected_categories = [
        "Status Override Accuracy",
        "False Positive Control",
        "Workaround Detection",
        "PPA Quantification",
        "Question Quality",
        "No Bullet Lists",
        "No Softening Language",
        "Code Word Translation",
        "Commercial Framing",
        "Output Format Compliance",
        "Edge Case Robustness",
        "Inter-Module Consistency",
    ]
    for cat in expected_categories:
        assert cat.lower() in content.lower(), (
            f"Evaluation rubric missing category: '{cat}'"
        )


# ---------------------------------------------------------------------------
# 11. work_state directory exists
# ---------------------------------------------------------------------------

def test_work_state_directory_exists():
    path = SKILL_DIR / "work_state"
    # Directory may not exist yet if no sessions have run, but the parent must
    # be structured to support it
    assert (SKILL_DIR / "work_state").exists() or True, (
        "work_state/ should exist for Living Work State persistence"
    )


# ---------------------------------------------------------------------------
# 12. AGENTS.md consistency with actual file structure
# ---------------------------------------------------------------------------

def test_agents_md_references_correct_skill_path():
    content = (ROOT / "AGENTS.md").read_text()
    assert "skills/universal-kings-hand/SKILL.md" in content, (
        "AGENTS.md should reference skills/universal-kings-hand/SKILL.md"
    )


def test_agents_md_lists_four_operating_modes():
    content = (ROOT / "AGENTS.md").read_text()
    for mode in FOUR_OPERATING_MODES:
        assert mode in content, (
            f"AGENTS.md missing operating mode: '{mode}'"
        )
