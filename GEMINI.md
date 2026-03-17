# GEMINI.md

## Project Overview
**The King's Hand (國王之手)** is an adversarial intelligence system designed for senior executives in IC design companies (e.g., VPs of Engineering, CEOs). It aims to detect "Watermelon Projects"—projects that appear "green" (on track) in official reports but are "red" (in crisis) due to hidden technical risks, hardware-to-software blame transfers, and accumulating technical debt.

The system functions as a **Claude Agent Skill Set** that analyzes unstructured technical data (Jira logs, Git commits, weekly reports, FAE escalations) and produces a brutally honest 5-module executive report, culminating in "The King's Three Soul-Searching Questions" for use in review meetings.

## Core Technologies & Methodology
- **Framework:** Claude Agent Skill Set (Unified intelligence engine).
- **Reasoning Engine:** A 5-step Chain of Thought (Internal)
  1. Deconstruction & Noise Reduction
  2. Spectrum Positioning & Empowerment Assessment
  3. Contradiction Detection & Root Cause Tracing
  4. Market Ripple Extrapolation
  5. Strategic Question Synthesis
- **Domain Knowledge:** Semiconductor software stack (Bootloader to AI SDK), PPA (Power, Performance, Area) trade-offs, and matrix organization dynamics.
- **Output Format:** 5-module report in **Traditional Chinese (繁體中文)** using Markdown tables and narrative prose.

## Project Structure (Targeted)
Based on `THE_KING_S_HAND_DEV_PLAN.md`, the intended structure is:
- `skills/the-kings-hand/`: Contains `SKILL.md` (System Prompt) and reference knowledge bases.
- `skills/the-kings-hand/references/`: Domain-specific guides (e.g., `workaround_taxonomy.md`, `corporate_code_words.md`).
- `tests/test_cases/`: Scenarios to validate the agent's detection capabilities.
- `AGENTS.md`: System manifest and entry point.

## Development Status
The project has completed all four phases (2026-03-18). The system is ready for deployment in Henry's weekly review workflow.
- [x] Conceptual README and Strategy Definition.
- [x] Detailed Development Plan (`THE_KING_S_HAND_DEV_PLAN.md`).
- [x] Roadmap (`ROADMAP.md`).
- [x] Directory structure implementation.
- [x] `AGENTS.md` — System manifest and entry point.
- [x] `skills/the-kings-hand/SKILL.md` — Core system prompt (XML-structured).
- [x] Reference knowledge base creation:
  - [x] `software_stack_map.md` — 5-layer stack with failure modes and business value
  - [x] `workaround_taxonomy.md` — 8 workaround patterns with PPA cost estimates
  - [x] `rag_status_criteria.md` — Red/Yellow/Green rules with override triggers
  - [x] `corporate_code_words.md` — 25 disguised language patterns (≥20 required)
- [x] Test suite (4 test cases):
  - [x] `project_adas_x9.md` — Yellow-to-Red override (TC-001)
  - [x] `project_smartlink_iot.md` — Green-to-Yellow override (TC-002)
  - [x] `project_valkyrie_npu.md` — Multi-layer friction (TC-003)
  - [x] `project_greenlight_trap.md` — Pure watermelon effect (TC-004)
- [x] `tests/evaluation_rubric.md` — 10-category scoring criteria.
- [x] `compliance/output_rules.json` — Machine-readable formatting constraints.
- [x] Phase 1 acceptance testing — completed 2026-03-17. 39/40 Pass on first run. One defect found and resolved: SKILL.md ecosystem moat question instruction tightened; TC-001 calibration reference updated. Phase 1 closed.

## Phase 2 Status
- [x] `question_patterns.md` — 15 question templates (5 per type: D/A, Scale-Out, Ecosystem Moat)
- [x] 10-case test suite — TC-005 through TC-010 added (Android AP, EV BMS, Wi-Fi 7, PCIe storage, true Green audio DSP, video codec)
- [x] SKILL.md updated to reference question_patterns.md
- [x] Phase 2 acceptance testing — completed 2026-03-18. 100/100 Pass across all 10 test cases. Phase 2 closed.

## Phase 3 Status
- [x] SKILL.md updated: structural anomaly signal list, evidence inventory protocol, incomplete input handling (confidence levels: Confirmed/Suspected/Undetectable), fallback language guidelines
- [x] `tests/test_cases/project_stratos_rf_incomplete.md` — TC-011: incomplete input (weekly report only, RF transceiver)
- [x] `tests/test_cases/project_ironclad_ddr_technical.md` — TC-012: highly technical input (DV closure report only, DDR5 PHY IP)
- [x] `tests/test_cases/project_apex_ml_sanitized.md` — TC-013: adversarially sanitized input (ML inference accelerator)
- [x] Phase 3 acceptance testing — completed 2026-03-18. 40/40 Pass across all edge case scenarios. Phase 3 closed.

## Phase 4 Status
- [x] `tests/test_cases/project_crestline_hpc_jira.md` — TC-014: raw Jira CSV input (PCIe Gen5 DMA engine IP, 15 issues, Jira metadata signal extraction)
- [x] `tests/test_cases/project_eon_ai_slides.md` — TC-015: PowerPoint-to-text input (edge AI inference SoC, cross-slide signal correlation)
- [x] `tests/test_cases/project_typhoon_5g_email.md` — TC-016: email thread input (5G modem, internal/external narrative split detection)
- [x] `README.md` — rewritten as bilingual operational guide: cadence recommendation, document collection guide, format-specific preparation instructions, submission template, output module guide
- [x] `tests/evaluation_rubric.md` — expanded to 12 categories; added "Scoring Without Domain Expertise" preamble, deflection test protocol for Category 5, inter-rater reliability guidance
- [x] Phase 4 acceptance testing — completed 2026-03-18. All three format test cases passed structural validation (format realism, signal verifiability, question quality, override trigger accuracy). Phase 4 closed.

## Key Files
- `README.md`: High-level conceptual and strategic metaphors for the system.
- `THE_KING_S_HAND_DEV_PLAN.md`: **Crucial.** Contains the complete specification, architecture, and roadmap for building the system. Read this before any implementation.
- `ROADMAP.md`: Four-phase roadmap with deliverable checklists and acceptance criteria.
- `AGENTS.md`: System manifest and entry point for the skill set.
- `skills/the-kings-hand/SKILL.md`: The core system prompt loaded when analyzing project documents.

## Operational Guidelines
- **Always be adversarial:** Don't trust official "green" statuses; look for evidence of hardware bugs masked by software workarounds.
- **PPA Focus:** Quantify the cost of every workaround in terms of Power, Performance, and Area.
- **Language:** Final executive output must be in **Traditional Chinese (繁體中文)**.
- **No Bullets in Analysis:** Use narrative prose for analytical modules (Module 3 & 4) to ensure deep synthesis.
