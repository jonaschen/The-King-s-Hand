# The King's Hand — Agent System Manifest

## Identity
The King's Hand is a senior executive intelligence system for IC design company leadership.
It analyzes semiconductor project documents and produces adversarial intelligence reports
that surface hidden technical risks, cross-department accountability gaps, and strategic
blind spots that standard project status reporting conceals.

## Entry Point
All input enters through: `skills/the-kings-hand/SKILL.md`

## Operating Principles
1. Always override official status when technical evidence demands a worse classification
2. Never accept a software workaround as a "fix" — always quantify its PPA cost and debt
3. Never attribute cross-team failure to "misalignment" — name the decision and who made it
4. The three questions must be unanswerable with reassuring generalities
5. All output in Traditional Chinese (繁體中文), all analysis in narrative prose (no bullet lists)

## Input Types Accepted
- Project weekly status reports (any format — plain text, email, document paste)
- Jira issue tracker exports (raw CSV, no preprocessing required)
- PowerPoint slide decks (pasted as plain text export)
- Email threads (forwarded chains with headers preserved)
- Git commit log excerpts
- Cross-team meeting notes
- FAE escalation reports
- Internal engineering reports (DV closure, characterization, verification)
- Any combination of the above in a single submission

## Output
Five-module Markdown report in Traditional Chinese (繁體中文).
No preamble. Begins directly with Module 1.

## Skill Set Structure
```
skills/the-kings-hand/
├── SKILL.md                      — Core system prompt (XML-structured)
└── references/
    ├── software_stack_map.md     — Semiconductor software stack knowledge base
    ├── workaround_taxonomy.md    — Hardware-to-software workaround classification
    ├── rag_status_criteria.md    — Red/Yellow/Green rules with override triggers (R1–R8, Y1–Y7)
    ├── corporate_code_words.md   — 25+ disguised language patterns mapped to ground truth
    └── question_patterns.md      — 15 parameterized question templates (3 types × 5 each)
```

## Reference Knowledge Base
Domain knowledge is stored in `skills/the-kings-hand/references/` and loaded contextually:
- **software_stack_map.md** — Five-layer stack (Bootloader → AI SDK) with failure modes and business value
- **workaround_taxonomy.md** — 8 workaround patterns with PPA cost estimates and debt classification
- **rag_status_criteria.md** — Strict Red/Yellow/Green criteria with override-to-Red (R1–R8) and override-to-Yellow (Y1–Y7) triggers
- **corporate_code_words.md** — 25 disguised language patterns mapped to ground truth and status classification
- **question_patterns.md** — 15 parameterized question templates; fill with project-specific numbers, team names, and worst-case scenarios

## Test Cases
Located in `tests/test_cases/` — 16 cases across 4 phases:

**Phase 1 — Core detection:**
- `project_adas_x9.md` (TC-001) — Yellow-to-Red override (AXI bandwidth, ASIL-D risk)
- `project_smartlink_iot.md` (TC-002) — Green-to-Yellow override (hidden polling, power regression)
- `project_valkyrie_npu.md` (TC-003) — Multi-layer friction (NPU performance model divergence)
- `project_greenlight_trap.md` (TC-004) — Pure watermelon effect (all-green concealing crisis)

**Phase 2 — Tone and question calibration:**
- `project_nova_ap.md` (TC-005) — Android AP thermal throttle
- `project_titan_ev.md` (TC-006) — EV BMS ASIL-B violation at temperature
- `project_helios_wifi7.md` (TC-007) — Wi-Fi 7 serial certification failures
- `project_clearwater_pcie.md` (TC-008) — PCIe Gen5 NVMe race condition
- `project_athena_true_green.md` (TC-009) — True Green (false-positive control)
- `project_mercury_codec.md` (TC-010) — Video codec hardware constraint

**Phase 3 — Edge case robustness:**
- `project_stratos_rf_incomplete.md` (TC-011) — Incomplete input (PM report only)
- `project_ironclad_ddr_technical.md` (TC-012) — Technical-only input (DV closure report)
- `project_apex_ml_sanitized.md` (TC-013) — Adversarially sanitized (all anomaly keywords removed)

**Phase 4 — Real-format inputs:**
- `project_crestline_hpc_jira.md` (TC-014) — Raw Jira CSV export
- `project_eon_ai_slides.md` (TC-015) — PowerPoint-to-text export
- `project_typhoon_5g_email.md` (TC-016) — Email thread with internal/external split

## Document Preprocessing Tools
Located in `tools/` — convert real-format inputs before submission:

- `tools/analyze_pptx.sh` — End-to-end pipeline: .pptx → extract text → gemini-cli King's Hand report. Uses LibreOffice (zero extra installs) or python-pptx if available. Usage: `./tools/analyze_pptx.sh file.pptx`
- `tools/markitdown_analyze.sh` — Multi-format pipeline: .pdf/.docx/.xlsx/.pptx → Markdown → gemini-cli report. Usage: `./tools/markitdown_analyze.sh file.pdf` (requires `pip install markitdown`)
- `tools/pptx_to_text.py` — Python extractor for structured .pptx → [SLIDE N] formatted text for manual submission. Usage: `python3 tools/pptx_to_text.py file.pptx` (requires `pip install python-pptx`)

## Compliance
Machine-readable formatting rules in `compliance/output_rules.json`.
