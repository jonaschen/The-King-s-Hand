# ROADMAP.md — The King's Hand

**Project Start:** 2026-03-16
**Specification Version:** v1.0 (see `THE_KING_S_HAND_DEV_PLAN.md`)
**Current Status:** Phase 1 — complete and accepted (2026-03-17). Phase 2 in progress.

---

## Overview

Four sequential phases over four months. Each phase gates the next: Phase 2 quality calibration work is meaningless without Phase 1's prompt foundation; Phase 3 robustness testing requires Phase 2's tone calibration to be stable first.

```
Phase 1 (Apr)  → Core prompt + knowledge base
Phase 2 (May)  → Question quality + tone calibration
Phase 3 (Jun)  → Edge case robustness
Phase 4 (Jul)  → Deployment packaging
```

---

## Phase 1 — Core Prompt Engineering and Knowledge Base
**Target:** April 2026
**Goal:** The system reliably detects hardware-to-software blame transfer and correctly overrides official status lights.

### Deliverables

**Directory Structure**
- [x] Create full directory tree: `AGENTS.md`, `skills/the-kings-hand/`, `tests/`, `compliance/`
- [x] Write `AGENTS.md` (system manifest and entry point — template in dev plan §6)

**SKILL.md (Core System Prompt)**
- [x] Write the full XML-structured system prompt (complete spec in dev plan §5)
  - Role definition (15-year IC design veteran persona)
  - Five-step Chain of Thought logic (`<thinking>` block, never shown in output)
  - Five output module specifications
  - Formatting rules (Traditional Chinese, narrative prose, no bullet lists)

**Reference Knowledge Base** (`skills/the-kings-hand/references/`)
- [x] `software_stack_map.md` — five stack layers (Bootloader → AI SDK) with failure modes and business value translation
- [x] `workaround_taxonomy.md` — 8 workaround patterns with PPA cost estimates (polling spinlock, NOP insertion, data throttling, retry logic, software PLL, GPIO polling, header padding, watchdog disable)
- [x] `rag_status_criteria.md` — explicit Green/Yellow/Red assignment rules with override triggers
- [x] `corporate_code_words.md` — ≥20 disguised language patterns mapped to ground truth and status classification

**Test Suite**
- [x] `tests/test_cases/project_adas_x9.md` — Yellow-to-Red override (AXI bandwidth contention, ASIL-D compliance risk)
- [x] `tests/test_cases/project_smartlink_iot.md` — Green-to-Yellow override (hidden polling workaround, 25% standby power increase)
- [x] `tests/test_cases/project_valkyrie_npu.md` — Multi-layer friction (NPU performance model divergence)
- [x] `tests/test_cases/project_greenlight_trap.md` — Pure watermelon effect (all-green report concealing crisis)
- [x] `tests/evaluation_rubric.md` — Scoring criteria for all KPI categories

**Compliance**
- [x] `compliance/output_rules.json` — machine-readable formatting constraints

### Acceptance Criteria
| Check | Target | Result |
|-------|--------|--------|
| Status override accuracy | 100% correct Red on both Red-override test cases | ✅ Pass — TC-001 🔴, TC-003 🔴, TC-004 🔴, TC-002 🟡 all correct |
| Workaround detection | ≥2 identified per test case when present | ✅ Pass — all 4 test cases ≥2 named workarounds |
| PPA quantification | Every workaround has a specific cost estimate | ✅ Pass — all workarounds carry numeric PPA cost |
| Tone compliance | 0 bullet lists in Module 3 or 4 | ✅ Pass — all 4 outputs narrative prose only |
| Question quality | All three questions unanswerable with reassuring generalities | ✅ Pass after fixing TC-001 Ecosystem Moat question (SKILL.md updated to require worst-case failure scenario framing) |

**Acceptance test run:** 2026-03-17. One defect found and resolved: TC-001 Ecosystem Moat question was initially deflectable; fix applied to SKILL.md Step 5 instruction and TC-001 calibration reference.

---

## Phase 2 — Question Quality and Tone Calibration
**Target:** May 2026
**Goal:** The three questions function as executive weapons, not suggestions. Module 3 names teams and decisions, never "alignment issues."

### Deliverables
- [x] `skills/the-kings-hand/references/question_patterns.md` — 15 high-impact question templates across the three question types (Defensive/Accountability, Scale-Out Strategic, Ecosystem Moat Strategic)
- [x] 10-case test suite — TC-001 through TC-010 covering ADAS, IoT, mobile SoC, datacenter inference, 5G modem, Android AP, EV BMS, Wi-Fi 7, PCIe storage, audio DSP (true Green), video codec
- [x] SKILL.md updated: question_patterns.md added to reference_knowledge; ecosystem moat question instruction tightened (Phase 1 fix carried forward)
- [ ] Run all 10 test cases and score against evaluation rubric — calibration focus areas below

### Calibration Focus Areas
1. **Question sharpness:** Does each question contain a worst-case financial or timeline implication that cannot be deflected with vague reassurance?
2. **Softening language audit:** Is Module 3 prose cold and specific, or does it hedge?
3. **Module 1 empowerment framing:** Connected to a specific commercial outcome (market position, customer retention, TAM expansion, regulatory access) — not a technical description.

### Acceptance Criteria
| Check | Target |
|-------|--------|
| Question accountability | 100% of questions on 10-case set require acknowledging a specific risk |
| Softening language | 0 instances of hedging language in Module 3 (automated scan) |
| Module 1 commercial framing | 100% connect to a specific commercial outcome |

---

## Phase 3 — Edge Case Handling and Robustness
**Target:** June 2026
**Goal:** Handle messy, incomplete, or politically sanitized inputs reliably without hallucinating risks.

### Test Scenarios to Build and Pass
- [ ] **Incomplete input:** Only a weekly report, no Jira data — system must still produce useful output and explicitly flag missing evidence
- [ ] **Highly technical input:** Pure hardware verification log with no business context
- [ ] **Genuinely clean input:** No red flags in document — system must correctly assign Green, no false positives
- [ ] **Adversarially sanitized input:** Project manager has learned to strip all anomaly keywords — system must still extract signal from structural patterns and business language

### Deliverables
- [ ] Fallback language guidelines in SKILL.md: what to write when evidence is insufficient to make a strong claim
- [ ] Additional test cases covering the four edge case scenarios above

### Acceptance Criteria
| Check | Target |
|-------|--------|
| False positive rate | 0 false Red assignments on genuinely clean input set |
| Incomplete input handling | Produces actionable output; explicitly states what is missing |
| No hallucination | Zero specific technical problems cited that are not evidenced in the document |
| Sanitized input | Generates meaningful questions (pivots to Scale-Out and Ecosystem Moat angles) |

---

## Phase 4 — Integration and Deployment Readiness
**Target:** July 2026
**Goal:** Package for weekly use in Henry's pre-review-meeting workflow with real-format documents.

### Deliverables
- [ ] Test with real-format inputs: PowerPoint-to-text, Jira CSV exports, email threads — no preprocessing required
- [ ] Update `README.md` for Henry's team: how to prepare and submit documents, what to expect in the output
- [ ] Finalize `tests/evaluation_rubric.md` — specific enough for a junior analyst to score outputs consistently without domain expertise
- [ ] Document cadence recommendation: weekly cadence, submitted the day before cross-functional review meetings

### Acceptance Criteria
| Check | Target |
|-------|--------|
| Raw Jira input | Produces useful output from unprocessed Jira CSV export |
| README clarity | A non-technical executive assistant can prepare documents correctly |
| Rubric specificity | Junior analyst can score outputs consistently (inter-rater reliability test) |

---

## Full KPI Summary

| Category | Metric | Target |
|----------|--------|--------|
| Status accuracy | Red override when evidence demands it | 100% on test cases with clear red indicators |
| Status accuracy | No false Red on clean evidence | 0 false positives (5-case clean set) |
| Workaround detection | Identifies workaround when present | ≥2 per document |
| PPA quantification | Specific cost estimate on every workaround | 100% |
| Question quality | Unanswerable with reassurance | ≥3/3 per case |
| Tone compliance | No bullet lists in analytical sections | 0 violations |
| Tone compliance | No softening language in Module 3 | 0 instances |
| Domain accuracy | Corporate code word translation | ≥90% vs. ground truth |
| Empowerment quality | Module 1 connects to commercial outcome | 100% |
| Robustness | Useful output from incomplete input | Actionable even without Jira data |

---

## Revision History

| Version | Date | Summary |
|---------|------|---------|
| v1.0 | 2026-03-17 | Initial roadmap. Derived from `THE_KING_S_HAND_DEV_PLAN.md` v1.0 four-phase plan with added task granularity and explicit completion checkboxes. |
| v1.1 | 2026-03-16 | Phase 1 deliverables completed: directory structure, AGENTS.md, SKILL.md, 4 reference docs, 4 test cases, evaluation rubric, compliance rules. |
| v1.2 | 2026-03-17 | Phase 1 acceptance testing complete. 39/40 Pass on first run. One defect resolved: SKILL.md Step 5 ecosystem moat question instruction tightened to require worst-case failure scenario framing; TC-001 calibration reference question updated accordingly. Phase 1 closed. |
