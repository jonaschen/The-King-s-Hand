# ROADMAP.md — The King's Hand

**Project Start:** 2026-03-16
**Specification Version:** v3.1 (see `THE_KING_S_HAND_DEV_PLAN.md`, `MAKE_EVERYBODY_KING_OR_QUEEN.md` v2.0)
**Current Status:** Original Phases 1–4 complete (2026-03-18). Evolution Phases 0–3 complete (2026-04-03). System ready for daily-driver deployment. Phase 4 (community) deferred until after real-world usage validation.

---

## Overview

### Original Delivery (Complete — 2026-03-18)

Four sequential phases delivered in March 2026. The King's Hand is deployed and operational for IC design domain analysis.

```
Phase 1 (Complete)  → Core prompt + knowledge base
Phase 2 (Complete)  → Question quality + tone calibration
Phase 3 (Complete)  → Edge case robustness
Phase 4 (Complete)  → Deployment packaging
Self-Adjustment     → Domain inference, manager profiles, calibration engine
```

### Generalization: Make Everybody King or Queen (Complete — 2026-04-03)

Five evolution phases to transform The King's Hand from an IC-design-specific analysis tool into a **persistent working partner** for any domain. See `MAKE_EVERYBODY_KING_OR_QUEEN.md` v2.0 for the full specification.

**Core identity pivot (v2.0):** The system's foundation is no longer "an analyst you consult occasionally" — it is "a persistent working partner who is always there."

```
Evo Phase 0  ✅ Persistent partner core: first-day dialogue + Living Work State + daily updates
Evo Phase 1  ✅ Analytical arsenal: adversarial analysis as skill + cross-domain validation
Evo Phase 2  ✅ Continuous evolution: preference learning + knowledge sedimentation + auto Domain Packs
Evo Phase 3  ✅ Proactive intelligence: stagnation detection + deadline alerts + auto weekly reports
Evo Phase 4  → Multi-user & community: knowledge sharing + collaboration (deferred)
```

---

## Original Phases 1–4 — Summary

All phases completed 2026-03-18. Full specifications in `THE_KING_S_HAND_DEV_PLAN.md`.

### Phase 1 — Core Prompt Engineering and Knowledge Base

**Deliverables:** SKILL.md (XML-structured system prompt), 4 reference docs (software_stack_map, workaround_taxonomy, rag_status_criteria, corporate_code_words), 4 test cases (TC-001 through TC-004), evaluation_rubric.md, output_rules.json.

| Check | Target | Result |
|-------|--------|--------|
| Status override accuracy | 100% correct Red on Red-override cases | ✅ Pass |
| Workaround detection | ≥2 per test case | ✅ Pass |
| PPA quantification | Every workaround has cost estimate | ✅ Pass |
| Tone compliance | 0 bullet lists in Module 3/4 | ✅ Pass |
| Question quality | All unanswerable with reassurance | ✅ Pass (after fixing TC-001 Ecosystem Moat question) |

### Phase 2 — Question Quality and Tone Calibration

**Deliverables:** question_patterns.md (15 templates), TC-005 through TC-010 added, SKILL.md updated.

| Check | Target | Result |
|-------|--------|--------|
| Question accountability | 100% require acknowledging specific risk | ✅ Pass — 30/30 questions |
| Softening language | 0 hedging in Module 3 | ✅ Pass |
| Module 1 commercial framing | 100% connect to commercial outcome | ✅ Pass |
| False positive control | TC-009 correct 🟢 | ✅ Pass |

### Phase 3 — Edge Case Handling and Robustness

**Deliverables:** TC-011 (incomplete input), TC-012 (technical-only), TC-013 (sanitized). SKILL.md updated with evidence inventory protocol, confidence levels, fallback language.

| Check | Target | Result |
|-------|--------|--------|
| False positive rate | 0 false Red on clean input | ✅ Pass |
| Incomplete input handling | Actionable output with evidence gaps noted | ✅ Pass |
| No hallucination | Zero uncited problems | ✅ Pass |
| Sanitized input detection | Meaningful findings despite stripped keywords | ✅ Pass |

### Phase 4 — Integration and Deployment Readiness

**Deliverables:** TC-014 (Jira CSV), TC-015 (PowerPoint), TC-016 (email thread). README.md bilingual operational guide. evaluation_rubric.md expanded to 12 categories.

| Check | Target | Result |
|-------|--------|--------|
| Raw Jira input | Useful output from CSV | ✅ Pass |
| PowerPoint input | Useful output from slide text | ✅ Pass |
| Email input | Useful output from thread | ✅ Pass |
| README clarity | Non-technical user can prepare docs | ✅ Pass |

### Self-Adjustment Addendum (post Phase 4)

**Deliverables:** SKILL.md Step 0 (domain inference + manager calibration), CALIBRATE.md meta-skill, manager_profiles/henry.md starter profile, tools/calibrate.sh, --manager flag for analyze_pptx.sh and markitdown_analyze.sh.

**Design Principles:**
- Zero-setup deployment — works without any manager profile via Step 0B-0D document inference
- Progressive enrichment — each calibrate.sh run makes the profile richer
- Domain-agnostic — six-element framework maps to any domain

---

## Original KPI Summary (Phases 1–4)

| Category | Metric | Target |
|----------|--------|--------|
| Status accuracy | Red override when evidence demands it | 100% on test cases |
| Status accuracy | No false Red on clean evidence | 0 false positives |
| Workaround detection | Identifies workaround when present | ≥2 per document |
| PPA quantification | Specific cost estimate on every workaround | 100% |
| Question quality | Unanswerable with reassurance | ≥3/3 per case |
| Tone compliance | No bullet lists in analytical sections | 0 violations |
| Tone compliance | No softening language in Module 3 | 0 instances |
| Domain accuracy | Corporate code word translation | ≥90% vs. ground truth |
| Empowerment quality | Module 1 connects to commercial outcome | 100% |
| Robustness | Useful output from incomplete input | Actionable even without Jira data |

---

## Evolution Phases — Summary

Full architectural design in `MAKE_EVERYBODY_KING_OR_QUEEN.md` v2.0. Detailed implementation in `skills/universal-kings-hand/SKILL.md`.

### Evolution Phase 0 — Persistent Partner Core ✅

**Completed:** 2026-04-03

**Deliverables:** `skills/universal-kings-hand/SKILL.md` (769 lines, 4 operating modes), framework_templates.md (6 domains), domain_inference_signals.md, IC design pack separated to `domain_packs/ic_design/`, blank templates, `work_state/` directory, Living Work State mechanism, first-day dialogue engine, four-layer memory architecture.

| Check | Target |
|:------|:-------|
| First-day dialogue | 3-5 questions → Manager Profile reflects user context |
| Daily update ingestion | ≥ 90% accuracy on 10 conversation segments |
| Living Work State consistency | Accurate after 5 simulated days |
| Quick Scan | Conversational response, no forced full report |
| Existing user zero friction | Henry → straight to Full Analysis, no calibration |
| IC design regression | 16/16 pass |
| Core/domain-pack separation | System runs in generic mode without IC design pack |

### Evolution Phase 1 — Analytical Arsenal & Cross-Domain Validation ✅

**Completed:** 2026-04-03

**Deliverables:** Full Analysis mode (complete 5-step CoT + 5-module report), Step 0.5 Knowledge Depth Assessment (L1/L2/L3), analysis → Living Work State writeback, software startup Domain Pack (4 files, 1,674 lines), medical device Domain Pack (4 files), 3 cross-domain test cases (SaaS, medical device, construction).

| Check | Target |
|:------|:-------|
| Analysis trigger accuracy | Daily conversation does NOT trigger analysis |
| Analysis → Living Work State | Findings written back to relevant task |
| Zero-config cross-domain | Useful reports for 3 domains without Profile/Pack |
| Domain inference accuracy | ≥ 90% on blind-test documents |
| Knowledge depth assessment | Correct L3/L2/L1 rating |
| Cross-domain soul questions | 3/3 unanswerable per case |
| IC design regression | 16/16 pass |

### Evolution Phase 2 — Continuous Evolution ✅

**Completed:** 2026-04-03

**Deliverables:** CALIBRATE.md v2 (487 lines — incremental update, conflict resolution, confidence decay, cross-domain migration, Domain Pack candidate generation), implicit preference learning in SKILL.md, knowledge sedimentation loop (L1→L2→L3).

| Check | Target |
|:------|:-------|
| Preference match | Report style improved after 5 interactions |
| Knowledge depth climbing | L1 → L2 after ≥ 8 interactions |
| Domain Pack auto-generation | Expert review accuracy ≥ 80% |
| Preference transparency | All inferences visible and editable |
| IC design regression | 16/16 pass |

### Evolution Phase 3 — Proactive Intelligence ✅

**Completed:** 2026-04-03

**Deliverables:** Stagnation detection engine, deadline alerts, auto weekly report generation, trend detection, cross-project pattern matching.

| Check | Target |
|:------|:-------|
| Weekly report quality | Covers all key progress and blockers |
| Stagnation alert accuracy | False positive < 20% |
| Deadline alerts | All explicit deadlines reminded |
| Trend detection | Correct identification across 3 simulated weeks |

### Evolution Phase 4 — Multi-User & Community (Deferred)

**Status:** Deferred pending real-world daily usage validation.

**Planned deliverables:** Domain Pack sharing (opt-in, auto-PII removal), pack rating & merge, privacy separation (Living Work State + Profile private; Domain Pack optionally shared).

---

## Generalization KPI Summary

| Category | Metric | Target |
|:---------|:-------|:-------|
| **Tier 1: Persistent Partner** | | |
| First-day dialogue | Manager Profile accuracy after 3-5 questions | Human-verified |
| Daily update ingestion | Task status extraction accuracy | ≥ 90% |
| Living Work State consistency | Accurate after 5 simulated days | Human-verified |
| Existing user zero friction | Straight to Full Analysis | Pass/fail |
| **Tier 2: Analytical Arsenal** | | |
| Analysis trigger accuracy | No false triggers on daily conversation | 100% |
| Cross-domain analysis | Useful reports from unknown-domain documents | 3+ test domains |
| Domain inference | Correct identification | ≥ 90% blind test |
| Knowledge depth assessment | Correct L1/L2/L3 rating | One test per level |
| Soul questions | Unanswerable with reassurance | 3/3 per case |
| IC design regression | No degradation | 16/16 pass |
| Preference learning | Style match improvement | Significant (human eval) |
| Domain Pack auto-generation | Expert accuracy | ≥ 80% |
| **Tier 3: Proactive Intelligence** | | |
| Weekly report quality | Covers all key progress and blockers | Human-verified |
| Stagnation alert precision | False positive rate | < 20% |
| Deadline alerts | All explicit deadlines reminded | 100% |
| Trend detection | Correct trend identification | 3-week simulated data |

---

## Security & Governance Principles

1. **User Data Sovereignty:** User Profiles and Living Work State belong entirely to the user. Never shared without consent. Domain Pack sharing is opt-in; auto-strip PII before sharing.
2. **Analysis Integrity:** Preference learning can change report style, never analytical objectivity. Core oath: *"Will not comfort you, will not cover for anyone, will not fabricate a red light without evidence."*
3. **Preference ≠ Bias:** If preferences create blind spots, the system flags it explicitly.
4. **Dynamic Expansion Safety:** Dynamically generated scripts must run in sandboxed environments.
5. **Progressive Trust Model:** All knowledge base changes require user confirmation initially. Low-risk changes auto-apply after stable history; high-risk changes always require confirmation.

---

## Revision History

| Version | Date | Summary |
|---------|------|---------|
| v1.0 | 2026-03-17 | Initial roadmap from `THE_KING_S_HAND_DEV_PLAN.md` v1.0. |
| v1.1 | 2026-03-16 | Phase 1 deliverables completed. |
| v1.2 | 2026-03-17 | Phase 1 acceptance testing complete. 39/40 Pass. One defect resolved (SKILL.md Step 5 ecosystem moat question). |
| v1.3 | 2026-03-18 | Phase 2 complete. question_patterns.md, TC-005–010. 100/100 Pass. |
| v1.4 | 2026-03-18 | Phase 3 complete. Edge case handling. TC-011–013. 40/40 Pass. |
| v1.5 | 2026-03-18 | Phase 4 complete. Real-format inputs (TC-014–016), bilingual README, expanded rubric. |
| v1.6 | 2026-03-18 | Self-adjustment addendum. Step 0, CALIBRATE.md, manager profiles, --manager flag. |
| v2.0 | 2026-03-31 | Generalization initiative. Evolution Phases 0–5, three-tier architecture, six-element domain framework. |
| v2.1 | 2026-03-31 | Step 0.5 Knowledge Depth Assessment (L1/L2/L3), knowledge sedimentation loop. |
| v2.2 | 2026-04-01 | Step 0 dual-mode design (passive + active), chief of staff narrative reframing. |
| v3.0 | 2026-04-02 | **System identity pivot.** Persistent working partner model. Four operating modes, four-layer memory. |
| v3.1 | 2026-04-03 | **Evolution Phases 0–3 complete.** SKILL.md 769 lines, 3 Domain Packs, CALIBRATE.md v2, proactive intelligence. Phase 4 deferred. |
