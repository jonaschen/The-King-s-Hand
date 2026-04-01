# ROADMAP.md — The King's Hand

**Project Start:** 2026-03-16
**Specification Version:** v2.2 (see `THE_KING_S_HAND_DEV_PLAN.md`, `MAKE_EVERYBODY_KING_OR_QUEEN.md` v1.2)
**Current Status:** Original Phases 1–4 complete (2026-03-18). Generalization initiative launched (2026-03-31). Entering Evolution Phase 0.

---

## Overview

### Original Delivery (Complete)

Four sequential phases delivered in March 2026. The King's Hand is deployed and operational for IC design domain analysis.

```
Phase 1 (Complete)  → Core prompt + knowledge base
Phase 2 (Complete)  → Question quality + tone calibration
Phase 3 (Complete)  → Edge case robustness
Phase 4 (Complete)  → Deployment packaging
Self-Adjustment     → Domain inference, manager profiles, calibration engine
```

### Generalization: Make Everybody King or Queen

Six evolution phases to transform The King's Hand from an IC-design-specific tool into a universal adversarial analysis system. See `MAKE_EVERYBODY_KING_OR_QUEEN.md` for the full specification. Each phase produces independently usable value, layered across three tiers:

```
┌─────────────────────────────────────────────────────────────┐
│  Tier 3: Proactive Intelligence (Phase 4–5)                 │
│  — Trend detection, scheduled analysis, cross-project       │
│    pattern matching, community knowledge sharing             │
├─────────────────────────────────────────────────────────────┤
│  Tier 2: Continuous Evolution Engine (Phase 2–3)            │
│  — Cross-session memory, implicit preference learning,      │
│    dynamic skill expansion, multi-domain validation          │
├─────────────────────────────────────────────────────────────┤
│  Tier 1: Universal Adversarial Core (Phase 0–1)             │
│  — Architecture refactor, domain inference, dynamic          │
│    framework construction, zero-config startup               │
└─────────────────────────────────────────────────────────────┘
```

```
Evo Phase 0  → Architecture refactor & core abstraction
Evo Phase 1  → Universal adversarial analysis core
Evo Phase 2  → Cross-session memory & preference learning
Evo Phase 3  → Dynamic skill expansion & multi-domain validation
Evo Phase 4  → Trend detection & proactive early warning
Evo Phase 5  → Community knowledge sharing & multi-user collaboration
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
**Target:** May 2026 — **Complete (2026-03-18)**
**Goal:** The three questions function as executive weapons, not suggestions. Module 3 names teams and decisions, never "alignment issues."

### Deliverables
- [x] `skills/the-kings-hand/references/question_patterns.md` — 15 high-impact question templates across the three question types (Defensive/Accountability, Scale-Out Strategic, Ecosystem Moat Strategic)
- [x] 10-case test suite — TC-001 through TC-010 covering ADAS, IoT, mobile SoC, datacenter inference, 5G modem, Android AP, EV BMS, Wi-Fi 7, PCIe storage, audio DSP (true Green), video codec
- [x] SKILL.md updated: question_patterns.md added to reference_knowledge; ecosystem moat question instruction tightened (Phase 1 fix carried forward)
- [x] Run all 10 test cases and score against evaluation rubric — 100/100 Pass, 0 Partial, 0 Fail

### Calibration Focus Areas
1. **Question sharpness:** Does each question contain a worst-case financial or timeline implication that cannot be deflected with vague reassurance?
2. **Softening language audit:** Is Module 3 prose cold and specific, or does it hedge?
3. **Module 1 empowerment framing:** Connected to a specific commercial outcome (market position, customer retention, TAM expansion, regulatory access) — not a technical description.

### Acceptance Criteria
| Check | Target | Result |
|-------|--------|--------|
| Question accountability | 100% of questions on 10-case set require acknowledging a specific risk | ✅ Pass — 30/30 questions across all 10 cases |
| Softening language | 0 instances of hedging language in Module 3 | ✅ Pass — all 10 outputs cold and specific |
| Module 1 commercial framing | 100% connect to a specific commercial outcome | ✅ Pass — all 10 outputs name a specific commercial consequence |
| False positive control | TC-009 correctly assigned 🟢, no fabricated risks | ✅ Pass — TC-009 Green with no invented findings |

**Acceptance test run:** 2026-03-18. 100/100 Pass across all 10 test cases. Phase 2 closed.

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
| Check | Target | Result |
|-------|--------|--------|
| False positive rate | 0 false Red assignments on genuinely clean input set | ✅ Pass — TC-009 re-verified 🟢, no fabricated risks |
| Incomplete input handling | Produces actionable output; explicitly states what is missing | ✅ Pass — TC-011 opens Module 3 with evidence inventory paragraph; confidence levels applied throughout |
| No hallucination | Zero specific technical problems cited that are not evidenced in the document | ✅ Pass — TC-011 cites no specific dB values, bug IDs, or measurements absent from the document |
| Sanitized input | Generates meaningful questions (pivots to Scale-Out and Ecosystem Moat angles) | ✅ Pass — TC-013 correctly assigns 🔴 Red from structural signals; all 3 questions unanswerable with reassurance |

**Acceptance test run:** 2026-03-18. 40/40 Pass across all four edge case scenarios (TC-011, TC-012, TC-013, TC-009 re-verify). Phase 3 closed.

---

## Phase 4 — Integration and Deployment Readiness
**Target:** July 2026 — **Complete (2026-03-18)**
**Goal:** Package for weekly use in the executive's pre-review-meeting workflow with real-format documents.

### Deliverables
- [x] Test with real-format inputs: Jira CSV (TC-014), PowerPoint-to-text (TC-015), email threads (TC-016) — no preprocessing required
- [x] Update `README.md` for the executive team: cadence recommendation, document collection guide, submission instructions, output module guide, bilingual (English + 繁體中文)
- [x] Finalize `tests/evaluation_rubric.md` — expanded to 12 categories, scoring-without-domain-expertise preamble, inter-rater reliability guidance
- [x] Document cadence recommendation: weekly cadence, submitted the day before cross-functional review meetings (in README.md)

### Acceptance Criteria
| Check | Target | Result |
|-------|--------|--------|
| Raw Jira input | Produces useful output from unprocessed Jira CSV export | ✅ Pass — TC-014 validates Jira CSV signal extraction (CRST labels, resolutions, comment-embedded engineer disclosures) |
| PowerPoint input | Produces useful output from pasted slide-deck text | ✅ Pass — TC-015 validates cross-slide signal correlation (NPU TOPS Slide 4 vs. Velox criterion Slide 6) |
| Email input | Produces useful output from forwarded email thread | ✅ Pass — TC-016 validates internal/external narrative split detection within a single email chain |
| README clarity | A non-technical executive assistant can prepare documents correctly | ✅ Pass — README updated with step-by-step document collection guide, format-specific preparation instructions, and submission template |
| Rubric specificity | Junior analyst can score outputs consistently (inter-rater reliability test) | ✅ Pass — rubric expanded to 12 categories; "Scoring Without Domain Expertise" preamble added; anti-examples and deflection test protocol specified for each category |

**Acceptance test run:** 2026-03-18. All three format test cases passed structural validation (input format realism, signal verifiability, question quality, override trigger accuracy). Phase 4 closed.

---

## Original KPI Summary (Phases 1–4)

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

## Addendum — Self-Adjustment and Domain Portability
**Added:** 2026-03-18 (post Phase 4)
**Goal:** Make The King's Hand deployable for any domain and any manager without manual reconfiguration.

### Deliverables
- [x] `SKILL.md` updated: role definition expanded to cross-domain analyst; Step 0 (Domain Inference and Manager Calibration) added before Step 1
  - Sub-step 0A: Manager Profile consumption — reads prepended `[MANAGER PROFILE]` block, applies domain vocabulary mappings, priority order, question style preferences, historical patterns
  - Sub-step 0B: Domain identification — infers industry from document vocabulary, job titles, metrics
  - Sub-step 0C: Domain framework construction — maps Hard Constraint, Patch Pattern, Irreversible Milestone, Trade-Off Axes, Tier-1 Relationship, Blame Transfer Seam for the identified domain
  - Sub-step 0D: Anomaly signal extension — extends red-flag keyword list with domain-specific equivalents
  - Sub-step 0E: Output calibration note — records domain inference result in `<thinking>` block
- [x] `skills/the-kings-hand/CALIBRATE.md` — Meta-skill (XML-structured) that distills a session transcript into a Manager Profile; invoked by calibrate.sh, runs in CALIBRATION MODE separate from analysis mode
- [x] `manager_profiles/henry.md` — Starter profile for Henry: IC design domain context, 24-row corporate vocabulary table, priority ordering, calibration rules from Phase 1–4 defect findings, historical patterns from test suite
- [x] `tools/calibrate.sh` — Wrapper that assembles CALIBRATE.md + existing profile + session transcript, runs gemini-cli from `/tmp` (to avoid GEMINI.md King's Hand context), validates output, backs up previous profile before overwriting
- [x] `tools/analyze_pptx.sh` updated with `--manager NAME` flag — injects Manager Profile as a prefix before running analysis
- [x] `tools/markitdown_analyze.sh` updated with `--manager NAME` flag — same profile injection logic

### Design Principles
- **Zero-setup deployment:** Works without any manager profile; Step 0B–0D provide domain inference from the document itself
- **Progressive enrichment:** Each calibrate.sh run makes the profile richer; by session 4–5 the profile should cover all recurring vocabulary and question preferences
- **Domain-agnostic:** The Hard Constraint / Patch Pattern / Irreversible Milestone / Trade-Off Axes framework maps to any hardware-software, manufacturing, regulatory, or financial domain — not only IC design

---

---

# Generalization: Make Everybody King or Queen

**Initiative Start:** 2026-03-31
**Specification:** `MAKE_EVERYBODY_KING_OR_QUEEN.md` v1.0
**Core Thesis:** The Watermelon Effect is not unique to semiconductors — it is the fate of every matrix organization with layered reporting structures. The King's Hand's analytical architecture (contradiction detection, implicit cost quantification, euphemism translation, unanswerable questions) is domain-agnostic and can be generalized.

**Verified Reusable Assets from Original Phases:**
- Five-step Chain of Thought reasoning engine
- Five-module report structure with narrative prose rules
- Status light override mechanism ("technical evidence always trumps official status")
- Three-type soul question taxonomy (Defensive/Accountability, Scale-Out, Ecosystem Moat)
- Step 0 self-adaptive reasoning (domain inference + manager calibration)
- CALIBRATE.md meta-skill for progressive profile enrichment

**Six-Element Domain Framework** (established in Self-Adjustment Addendum, now the generalization cornerstone):
1. Hard Constraint — inviolable limits in the domain
2. Patch Pattern — short-term fixes masking structural problems
3. Irreversible Milestone — points of no return
4. Trade-off Axes — core resource trade-off dimensions
5. Tier-1 Relationship — most critical external stakeholders
6. Blame Transfer Seam — organizational boundaries where responsibility shifts

---

## Evolution Phase 0 — Architecture Refactor & Core Abstraction
**Target:** TBD
**Goal:** Separate The King's Hand into a domain-agnostic core and an IC design domain pack, without breaking existing functionality. Establish Step 0's dual-mode (passive inference + active interview) skeleton and three operating mode routing logic.

### Deliverables

| Item | Description |
|:-----|:------------|
| `skills/universal-kings-hand/SKILL.md` | Generalized system prompt. CoT parameterized (Steps 0 dual-mode → 0.5 → 1–5 depth-controlled); specific instructions populated by domain framework |
| Step 0 dual-mode logic | SKILL.md defines Step 0 switching: passive inference → self-assessment → if L1 with no Profile, enter active interview → re-assess. Includes calibration interview question design templates (5 directions × example questions) |
| Three operating mode routing | SKILL.md defines Calibration, Quick Scan, and Full Report modes with trigger conditions and execution scope |
| `skills/universal-kings-hand/references/framework_templates.md` | Six-element framework example mappings for ≥ 5 domains |
| `skills/universal-kings-hand/references/domain_inference_signals.md` | Multi-signal domain inference rules (terminology density, job titles, KPI types, document structure) |
| `skills/universal-kings-hand/domain_packs/ic_design/` | Original four reference files relocated into domain pack directory (no content changes) |
| `skills/universal-kings-hand/domain_packs/_template/` | Blank domain pack template: `value_chain_map.md`, `patch_patterns.md`, `override_triggers.md`, `euphemism_dictionary.md` |
| IC design 16-case regression | All original test cases pass at 100% on the refactored system |

### Generalized Chain of Thought (with Knowledge Depth Assessment)

**Structural Design Principle: Top-Down / Bottom-Up Dynamic Ratio**

The King's Hand in IC design uses near-pure Top-Down reasoning — the system hunts for known anomaly patterns using mature frameworks built over 16 test cases. But in generalized mode, dynamically constructed frameworks lack this depth. A just-inferred six-element framework and a battle-tested one are fundamentally different. If the system ignores this gap, it will hallucinate patterns that don't exist in unfamiliar domains and miss critical signals the framework doesn't define.

The solution: **Step 0.5 (Knowledge Depth Assessment)** runs immediately after Step 0 and before Step 1. Its result determines the Top-Down vs Bottom-Up ratio for all subsequent steps — and whether to activate the calibration conversation.

| Step | Name | Core Task |
|:-----|:-----|:----------|
| Step 0 | Domain inference & manager calibration (passive mode) | Read documents, read Manager Profile (if exists), infer domain, construct six-element framework |
| **Step 0.5** | **Knowledge Depth Assessment** | Assess framework knowledge depth, determine Top-Down / Bottom-Up ratio, record in `<thinking>` |
| **Step 0.5→0 backflow** | **Calibration Conversation (conditional)** | If L1 + no Manager Profile: conduct 3-5 natural-language questions to understand the user's world, map answers to six-element framework in `<thinking>`, build initial Profile, re-assess → typically L1.5–L2 |
| Step 1 | Deconstruction & noise reduction | Per depth level: "keyword hunting" (L3) or "full-text anomaly detection" (L1) |
| Step 2 | Value chain positioning | Per depth level: "precise positioning" (L3) or "inductive construction" (L1) |
| Step 3 | Contradiction detection | Per depth level: "framework-driven search" (L3) or "contradiction surfacing" (L1) |
| Step 4 | Impact extrapolation | Per depth level: "precise translation" (L3) or "conservative extrapolation" (L1) |
| Step 5 | The Three Soul Questions | Per depth level: "precision strikes" (L3) or "exploratory questioning" (L1) |

**Step 0 Dual-Mode Design: A Chief of Staff's First Day**

Imagine a highly capable chief of staff walking into the office on day one. A stack of project reports sits on his desk. He doesn't pick them up and start writing analysis. He flips through them to get a sense of the industry, organization, and project type. Then he walks into the executive's office, sits down, and says: "Before I dive into these, I'd like to hear from you."

- **Passive mode** (always runs): Read documents, read existing Profile, infer domain and context from the text. The chief of staff flipping through the stack.
- **Active mode** (conditional): Sit down and talk with the user — understand their world, anxieties, judgment criteria. The chief of staff's first conversation.

Active mode triggers only when Step 0.5 yields L1 *and* no Manager Profile exists. As the Profile grows thicker, the system no longer needs to ask — it reads the documents and already knows what to focus on. **The more mature the system, the quieter it becomes.**

**Two Questioning Capabilities — Two Sides of the Same Coin:**

| Dimension | Step 5: Soul Questions | Step 0: Calibration Conversation |
|:----------|:----------------------|:---------------------------------|
| Metaphor | The sword sharpened for the king | The chief of staff's first dinner |
| Purpose | Force the reviewed party to face reality | Understand the user's world, anxieties, judgment criteria |
| Posture | Adversarial — you cannot evade | Collaborative — I'm seriously getting to know you |
| Question design | Contains worst-case scenarios, blocks escape routes | Open, curious, follows the conversation |
| Pacing | Three questions fired together, no breathing room | Progressive — each answer shapes the next question |
| User experience | "This question cuts to the heart of it" | "This person is genuinely trying to understand my situation" |

**Three Operating Modes — Trust Evolution, Not Feature Toggles:**

| Stage | System Mode | What Happens |
|:------|:------------|:-------------|
| **First meeting** | **Calibration** | Chief of staff just arrived — sit down and talk. Understand user's role, anxieties, judgment criteria. Build initial Manager Profile. May also do a preliminary analysis of one document, or just finish the conversation |
| **Day-to-day** | **Quick Scan** | User stops chief of staff in the hallway: "Look at this email — is this person hiding something?" No full report needed — quick read, share observations, ask 1-2 follow-ups. Five-minute interaction |
| **Deep trust** | **Full Report** | User hands over a full document stack: "Before next week's review, go through all of this and tell me the truth." Chief of staff closes the door, runs complete five-module analysis, delivers a weapon for the meeting room |

Quick Scan is the **trust accelerator** — each one is an opportunity for the system to demonstrate judgment. Simultaneously, the user's follow-ups, corrections, and additions build domain knowledge invisibly. Quick Scan isn't just a lightweight service — it's the optimal context for learning and trust-building.

**Knowledge Depth Assessment Dimensions:**

| Dimension | Assessment Question | Depth Indicator |
|:----------|:-------------------|:----------------|
| Framework source | Six-element framework loaded from verified Domain Pack, or inferred on-the-fly? | Pack = thick; inferred = thin |
| Patch pattern library completeness | How many concrete patch pattern instances for this domain? | ≥ 5 named patterns = thick; abstract only = thin |
| Euphemism dictionary coverage | How many "corporate speak → ground truth" mappings? | ≥ 10 = thick; < 3 = thin |
| Override trigger rule specificity | Are override conditions quantified and verifiable? | Quantified thresholds = thick; qualitative only = thin |
| Historical calibration depth | Has domain been calibrated through user feedback? | ≥ 3 calibrations = thick; first contact = thin |

**Knowledge Depth Levels:**

| Level | Condition | TD:BU Ratio | System Behavior |
|:------|:----------|:------------|:----------------|
| **L3 — Deep** | Complete Domain Pack + ≥ 3 calibrations | 70:30 | Full framework-driven hunting. High confidence. Assertive tone. |
| **L2 — Moderate** | Partial Domain Pack or ≥ 5 same-domain interactions | 50:50 | Framework hunting and data surfacing in parallel. Conclusions annotated with confidence. Report distinguishes "framework-driven findings" from "data-surfaced findings." |
| **L1 — Thin** | Only inferred framework, no Pack, no calibration history | 20:80 | Data-led analysis. Primary task: let the document speak — flag all anomaly patterns, contradictions, tone shifts, even if meaning is uncertain. Framework serves as output skeleton only, not hunting guide. Cautious tone ("evidence suggests" not "system determines"). Soul questions favor open-ended exploration over precision strikes. |

**Per-Step Behavior at L3 (Deep) vs L1 (Thin):**

| Step | L3 Deep (IC design current state) | L1 Thin (unfamiliar domain, first contact) |
|:-----|:-----------------------------------|:--------------------------------------------|
| Step 1 | Scan with known anomaly keyword library | **No presuppositions.** Full-text anomaly detection: flag all tone shifts (optimistic→vague), all number-vs-qualifier contradictions, all passive voice hiding actors ("was resolved"→by whom?), all timeline gaps |
| Step 2 | Precise positioning via known value chain map | **Infer value chain from document.** Identify all stakeholders, deliverables, dependencies; construct draft value chain |
| Step 3 | Systematic search for known patterns via framework | **Target contradictions themselves, not contradiction types.** Paragraph-by-paragraph claim-vs-evidence comparison. Execute "absence signal analysis": what is deliberately not mentioned? Which stakeholders are never referenced? Which time periods have no updates? |
| Step 4 | Precise translation to known commercial consequences | **Conservative extrapolation.** Only infer from stakeholders and time pressures explicitly present in document; introduce no external assumptions |
| Step 5 | All three questions are precision strikes with specific numbers and worst-case scenarios | Defensive/Accountability question fires normally (directly sourced from document contradictions). Scale-Out and Ecosystem Moat questions shift to **exploratory mode** — help user clarify these dimensions rather than accuse |

### Generalized Five-Module Report

| Module | Original Title | Generalized Title | Adjustment |
|:-------|:---------------|:-------------------|:-----------|
| M1 | 專案光譜定位與賦能價值 | **專案定位與戰略價值** | Value chain positioning table, linked to domain-specific commercial/organizational goals |
| M2 | 專案穿透性摘要與紅綠燈 | **穿透性摘要與狀態判定** | Override triggers defined by domain framework |
| M3 | 跨層級協作摩擦力與風險 | **跨職能摩擦與隱性風險** | Friction identified via Blame Transfer Seam from six-element framework |
| M4 | 客戶/市場連動效應 | **外部連動效應** | Impact targets = Tier-1 Relationships; timeline = Irreversible Milestones |
| M5 | 國王的靈魂三問 | **靈魂三問** | Three-type structure unchanged; question content populated by domain knowledge |

**Knowledge Depth Impact on Report Confidence:**

| Module | L3 Deep | L1 Thin |
|:-------|:--------|:--------|
| M2 Status | Direct override, assertive: "System determines 🔴 Red" | Evidence presented with judgment space: "Based on the following contradictions, official status may be overestimated. System leans 🟡 Yellow, but this judgment is based on limited domain knowledge — recommend self-assessment using evidence below" |
| M3 Friction | Precisely names patch patterns and responsibility attribution, quantifies hidden costs | Lists all detected anomaly signals and contradictions, labeled as "data-surfaced patterns" not "confirmed risks." Does not force-fit into specific patch patterns |
| M5 Questions | All three are precision strikes with specific numbers and worst-case scenarios | Q1 (Defensive/Accountability) fires normally based on clearest contradiction; Q2–Q3 shift to open-ended exploration guiding user to clarify these dimensions |
| Report tail | No additional notes | **"Analysis Foundation Statement"** appended: explicitly states knowledge depth level, framework source, which conclusions are high-confidence vs exploratory, and what additional information would improve next analysis |

### Target Directory Structure

```
skills/universal-kings-hand/
├── SKILL.md                              # Generalized core system prompt
├── CALIBRATE.md                          # Calibration meta-skill (extended)
├── references/
│   ├── domain_inference_signals.md        # Domain inference signal library
│   └── framework_templates.md             # Six-element framework example templates
├── domain_packs/
│   ├── ic_design/                         # Semiconductor IC design (complete, verified)
│   │   ├── software_stack_map.md
│   │   ├── workaround_taxonomy.md
│   │   ├── rag_status_criteria.md
│   │   └── corporate_code_words.md
│   ├── software_startup/                  # Software startup (Phase 1 deliverable)
│   │   ├── value_chain_map.md
│   │   ├── patch_patterns.md
│   │   ├── override_triggers.md
│   │   └── euphemism_dictionary.md
│   └── _template/                         # Blank domain pack template
│       ├── value_chain_map.md
│       ├── patch_patterns.md
│       ├── override_triggers.md
│       └── euphemism_dictionary.md
├── manager_profiles/
│   └── henry.md                           # Existing (IC design)
└── tests/
    ├── ic_design/                          # Original 16 test cases
    └── cross_domain/                       # Cross-domain test cases
```

### Acceptance Criteria

| Check | Target | Result |
|:------|:-------|:-------|
| IC design regression | 16/16 test cases pass, output quality no degradation | |
| Core/domain-pack separation | System runs in generic mode when `domain_packs/ic_design/` is removed (lower quality but no errors) | |
| Framework template coverage | ≥ 5 domains with six-element framework examples | |
| Step 0.5 implementation | Knowledge Depth Assessment produces correct L1/L2/L3 rating in `<thinking>` block | |

---

## Evolution Phase 1 — Universal Adversarial Analysis Core
**Target:** TBD
**Goal:** Zero-config analysis of project documents from any domain. Calibration conversation can lift an unfamiliar domain from L1 to L1.5/L2 within 3-5 questions. All three operating modes functional.

### Deliverables

| Item | Description |
|:-----|:------------|
| Domain inference engine | Full SKILL.md Step 0 implementation with multi-signal fusion (user statement > profile > terminology density > job titles > KPI types > document structure) |
| Knowledge Depth Assessment (Step 0.5) | Self-assessment producing L1/L2/L3 rating; controls Top-Down vs Bottom-Up ratio across Steps 1–5 |
| Calibration interview engine | Step 0 active-mode implementation: question generation logic (5 directions × templates + dynamic follow-up based on previous answer), answer→framework mapping in `<thinking>`, stop condition (framework key elements filled to L2 threshold) |
| Three operating modes | Calibration, Quick Scan, and Full Report — complete implementation with routing logic |
| Dynamic framework constructor | Real-time six-element framework construction in `<thinking>` block |
| Generalized five-module report | Module titles, content guidelines, and confidence calibration dynamically adjusted per domain and knowledge depth level |
| Analysis Foundation Statement | L1-mode reports include explicit declaration of knowledge depth, framework source, confidence distinctions, and recommendations for improving next analysis |
| Cross-domain test suite | ≥ 3 non-IC-design domains with complete test cases and expected output baselines |
| Cold-start experience test | Simulate new user's complete path: Calibration conversation → Quick Scan → Full Report; verify experience quality at each step |
| Software startup domain pack | First non-IC-design complete domain knowledge pack (example + validation) |
| Medical device domain pack | Second high-quality Domain Pack (enables more users to start at L2/L3, mitigating cold-start risk) |

### Domain Inference Classification

| Result | Condition | Behavior |
|:-------|:----------|:---------|
| **Recognized Domain** | Built-in domain pack exists | Load full domain-specific references |
| **Inferable Domain** | System can construct six-element framework from document | Dynamic framework construction, confidence levels noted |
| **Unknown Domain** | Insufficient signals | Generic framework analysis; if no Profile, activate calibration conversation |

### Test Domain Recommendations

| Domain | Rationale |
|:-------|:----------|
| Software startup | High-frequency use case, Agile report formats widely available |
| Medical device / Pharma | Regulation-driven organization, structurally similar "hard constraints" to IC design but entirely different domain |
| Construction engineering | Traditional industry, validates applicability beyond tech sector (no pre-built Domain Pack — pure L1 → calibration conversation test) |

### Acceptance Criteria

| Check | Target | Result |
|:------|:-------|:-------|
| Zero-config usability | Useful reports produced for 3 test domains with no Manager Profile and no Domain Pack | |
| Domain inference accuracy | ≥ 90% on 10 blind-test documents across domains | |
| Six-element framework completeness | All 6 elements populated and domain-plausible (expert review) | |
| Knowledge depth self-assessment accuracy | IC design documents → L3; unfamiliar domain first contact → L1; partial Domain Pack → L2 (at least one test case per level) | |
| Calibration interview effectiveness | Post-interview Step 0.5 re-assessment rises from L1 to ≥ L1.5; interview ≤ 5 questions; user does not feel interrogated (human experience evaluation) | |
| Quick Scan usability | When user submits a text fragment + specific question, system provides targeted conversational analysis without forcing a full five-module report | |
| Cold-start experience | Complete path from calibration conversation to first full report — no step makes user feel "this is just a generic tool" | |
| L1 mode behavioral correctness | In L1 thin mode: system does not force-fit frameworks; report includes "Analysis Foundation Statement"; Q2–Q3 of soul questions are exploratory not precision strikes | |
| L3-vs-L1 output quality difference is reasonable | L3 output assertive and precise; L1 output cautious but still valuable — difference reflects knowledge depth, not system capability | |
| Soul questions cross-domain validity | All three questions pass "unanswerable with reassurance" test in non-IC domains | |
| IC design zero regression | 16/16 regression pass | |

---

## Evolution Phase 2 — Cross-Session Memory & Preference Learning
**Target:** TBD
**Goal:** The system learns from every interaction — remembers user preferences, communication style, focus areas — and gets more accurate over time.

### Deliverables

| Item | Description |
|:-----|:------------|
| Extended CALIBRATE.md | Incremental update mode, conflict resolution logic, confidence decay mechanism, cross-domain preference migration |
| User Profile v2 structure | New sections: `style_preferences`, `priority_order`, `question_preferences`, `analysis_history` |
| Implicit preference extraction | SKILL.md instructions for detecting preferences when user modifies output or follows up on specific areas |
| Preference learning test suite | Simulated 5-interaction sequence verifying preference convergence |

### Preference Extraction Triggers

| Trigger Event | Extraction | Storage |
|:-------------|:-----------|:--------|
| User modifies report wording | Original vs. modified → style preference | Profile `style_preferences` |
| User follows up on a specific module/direction | Follow-up direction → priority inference | Profile `priority_order` |
| User rejects an analysis conclusion | Rejection reason → domain knowledge correction | Domain Pack |
| User provides unknown document type | Document structure → new input format rules | Domain Pack `input_formats` |
| User indicates a question type is particularly useful | Question type preference | Profile `question_preferences` |

### Design Principles

- **White-Box Preferences:** All inferred preferences stored as natural language in the User Profile. Users can inspect, edit, or delete any preference at any time.
- **Recency over Seniority:** `recent behavior > early behavior`, `explicit statement > inferred preference`
- **Confidence Decay:** Preferences not re-validated after N interactions have their confidence level gradually reduced

### Knowledge Sedimentation Loop (Tier 1 ↔ Tier 2 Structural Relationship)

All Tier 2 mechanisms — preference learning, memory maintenance, skill expansion — serve a single purpose: **deposit Bottom-Up surfaced knowledge into Top-Down usable frameworks, driving knowledge depth from L1 toward L3.**

```
Interactions 1-3 (L1 Thin)
  ├─ Bottom-Up dominant: data surfaces anomaly patterns
  ├─ System produces exploratory reports
  └─ CALIBRATE.md extracts: domain terms, user focus areas, anomaly signals

Interactions 4-8 (L2 Moderate)
  ├─ Candidate knowledge passes quality gates, upgrades to confirmed
  ├─ Patch pattern library gains concrete instances (not just abstractions)
  ├─ Euphemism dictionary coverage rises
  └─ Top-Down : Bottom-Up ratio approaches 50:50

Interactions 9+ (toward L3 Deep)
  ├─ Domain Pack accumulates sufficient verified knowledge
  ├─ Override trigger rules gain quantified thresholds
  ├─ Top-Down ratio increases; analysis precision and efficiency improve together
  └─ System behavior converges on King's Hand IC design performance
```

**The generalized system is not a weakened King's Hand — it is the King's Hand in its youth.** Given sufficient interactions and calibration, it grows equally sharp in any domain. Step 0.5 ensures honesty throughout growth — the system never pretends maturity it hasn't earned.

### Acceptance Criteria

| Check | Target | Result |
|:------|:-------|:-------|
| Preference match after 5 interactions | Report style significantly better aligned with user preferences (human evaluation) | |
| Knowledge depth climbing | An L1 domain upgrades to L2 after ≥ 8 interactions; Step 0.5 self-assessment correctly reflects the upgrade | |
| Cross-session memory consistency | Session N+1 correctly references knowledge from session N | |
| Preference transparency | User can find all inferred preferences in Profile, descriptions are understandable | |
| Knowledge expansion quality | Dynamically expanded knowledge introduces no errors or contradictions | |
| No regression | Preference learning does not degrade analysis quality (IC design 16-case regression) | |

---

## Evolution Phase 3 — Dynamic Skill Expansion & Multi-Domain Validation
**Target:** TBD
**Goal:** The system solidifies interaction-learned domain knowledge into reusable Domain Packs and proves stability across multiple real-world domains.

### Deliverables

| Item | Description |
|:-----|:------------|
| Domain Pack auto-generation | From ≥ 5 same-domain interactions, auto-generate candidate Domain Pack and request user confirmation |
| Quality gate mechanism | Three-layer gate: consistency check, minimum usage count (≥ 3 interactions), user confirmation |
| 5 complete Domain Packs | IC design (existing) + 4 new domains, each with all four reference files |
| Cross-domain stress test | Switch between 3 different domain documents within one Profile; verify no cross-contamination |

### Quality Gate Rules

1. **Consistency check:** New knowledge must not contradict existing knowledge base (unless user explicitly overrides)
2. **Minimum usage count:** An inferred preference or new knowledge point must be used in ≥ 3 interactions without being rejected to upgrade from "candidate" to "confirmed"
3. **User confirmation:** Major knowledge base changes (e.g., new complete Domain Pack) notify user and request confirmation

### Acceptance Criteria

| Check | Target | Result |
|:------|:-------|:-------|
| Auto-generated Domain Pack quality | Expert review accuracy ≥ 80% | |
| Cross-domain switching stability | Analysis quality for each domain unaffected by other domains in Profile | |
| Community contribution feasibility | Domain Pack format clear enough for a domain expert to complete in 2 hours | |

---

## Evolution Phase 4 — Trend Detection & Proactive Early Warning
**Target:** TBD
**Goal:** Evolve from single-shot analysis to longitudinal tracking — detect risk trends across repeated analyses and proactively warn before crises emerge.

### Deliverables

| Item | Description |
|:-----|:------------|
| Analysis history summary | After each analysis, auto-write key findings to project history table |
| Trend comparison section | Reports include "comparison with previous analysis" paragraph |
| Cross-project pattern matching | New project signals compared against historical project crisis precursors |
| Scheduled analysis reminder | Environment-appropriate scheduling support (Claude.ai reminder / Claude Code cron / MCP webhook) |

### Deployment-Dependent Scheduling

| Environment | Implementation | Limitation |
|:------------|:---------------|:-----------|
| Claude.ai conversation | Profile records "last analysis date" and "suggested next date"; remind on new conversation | No true background execution |
| Claude Code + Cron | `crontab` schedules `analyze_pptx.sh --manager {user}`, output to designated path | Requires local environment |
| MCP Server integration | Long-running service receives webhooks (Jira events, Git push), triggers analysis and push notification | Requires MCP infrastructure |

### Acceptance Criteria

| Check | Target | Result |
|:------|:-------|:-------|
| Trend detection | Correctly identify worsening/improving trends across 3 consecutive weeks of simulated data | |
| Proactive alert false positive rate | < 20% | |
| Cross-project pattern match hit rate | ≥ 80% on known crisis precursors | |

---

## Evolution Phase 5 — Community Knowledge Sharing & Multi-User Collaboration
**Target:** TBD
**Goal:** Enable different users to share, rate, and merge Domain Packs, creating network effects in domain knowledge accumulation.

### Deliverables

| Item | Description |
|:-----|:------------|
| Domain Pack rating mechanism | Users can rate community-contributed Domain Packs |
| Pack merge tool | Merge multiple users' Packs for the same domain into a more complete version |
| Privacy separation | Strict separation: User Profile (private) vs. Domain Pack (opt-in sharing) |
| Domain leaderboard | Display most active and highest-quality domain Packs |

### Acceptance Criteria

| Check | Target | Result |
|:------|:-------|:-------|
| Privacy enforcement | No personally identifiable information leaks from Profile to shared Packs | |
| Merge quality | Merged Pack is more complete than any single contributor's Pack (expert review) | |
| Contributor experience | Domain expert can contribute a Pack via a clear, documented process | |

---

## Generalization KPI Summary

| Category | Metric | Target |
|:---------|:-------|:-------|
| Zero-config usability | Useful report from unknown-domain document | Actionable output with no prior setup |
| Domain inference | Correct domain identification | ≥ 90% on blind test set |
| Framework completeness | Six elements populated and plausible | 100% expert-verified |
| Knowledge depth self-assessment | Correct L1/L2/L3 rating | At least one test case per level |
| Calibration interview | Post-interview depth upgrade from L1 | ≥ L1.5, within ≤ 5 questions, user not interrogated |
| Quick Scan usability | Targeted conversational analysis without full report | Fragment + question → useful response |
| Cold-start experience | Full path feels personalized, not generic | Human experience evaluation |
| L1 mode honesty | System does not force-fit frameworks; includes Analysis Foundation Statement | 100% on L1 test cases |
| L3-vs-L1 quality gap | L3 assertive and precise, L1 cautious but valuable | Reasonable difference (expert review) |
| Cross-domain question quality | Unanswerable with reassurance | 3/3 per case across domains |
| IC design regression | No quality degradation | 16/16 test cases pass |
| Knowledge depth climbing | L1 → L2 after ≥ 8 interactions | Step 0.5 correctly reflects upgrade |
| Preference learning | Style match improvement over 5 interactions | Significant (human evaluation) |
| Preference transparency | All inferences visible and editable | 100% |
| Domain Pack auto-generation | Expert-reviewed accuracy | ≥ 80% |
| Trend detection | Correct trend identification | 3-week simulated data |
| Proactive alert precision | False positive rate | < 20% |
| Cross-project pattern matching | Known precursor hit rate | ≥ 80% |

---

## Security & Governance Principles

1. **User Data Sovereignty:** User Profiles belong entirely to the user. Never shared without consent. Domain Pack sharing is opt-in; auto-strip PII before sharing.
2. **Analysis Integrity:** No matter how the system evolves, the core oath stands — *"Will not comfort you, will not cover for anyone, will not fabricate a red light without evidence."* Preference learning can change report style, never analytical objectivity.
3. **Preference ≠ Bias:** If a user's preferences create blind spots (e.g., preferring to ignore certain risk signals), the system follows the preference but explicitly flags: "This analysis has omitted the following signal types per your preference settings. Periodic unfiltered analysis recommended."
4. **Dynamic Expansion Safety:** When deployment involves code execution (e.g., Claude Code automation scripts), all dynamically generated scripts must run in sandboxed environments.
5. **Progressive Trust Model:** System autonomy grows with established trust. Initial state: all knowledge base changes require user confirmation. After stable interaction history: low-risk changes (new euphemism translations) auto-apply; high-risk changes (override trigger modifications) always require human confirmation.

---

## Revision History

| Version | Date | Summary |
|---------|------|---------|
| v1.0 | 2026-03-17 | Initial roadmap. Derived from `THE_KING_S_HAND_DEV_PLAN.md` v1.0 four-phase plan with added task granularity and explicit completion checkboxes. |
| v1.1 | 2026-03-16 | Phase 1 deliverables completed: directory structure, AGENTS.md, SKILL.md, 4 reference docs, 4 test cases, evaluation rubric, compliance rules. |
| v1.2 | 2026-03-17 | Phase 1 acceptance testing complete. 39/40 Pass on first run. One defect resolved: SKILL.md Step 5 ecosystem moat question instruction tightened to require worst-case failure scenario framing; TC-001 calibration reference question updated accordingly. Phase 1 closed. |
| v1.3 | 2026-03-18 | Phase 2 complete. question_patterns.md (15 templates) created. TC-005 through TC-010 added (Android AP, EV BMS, Wi-Fi 7, PCIe Gen5, true Green audio DSP, video codec). 10-case acceptance test: 100/100 Pass, 0 Partial, 0 Fail. Phase 2 closed. |
| v1.4 | 2026-03-18 | Phase 3 complete. SKILL.md updated with structural anomaly signal list, evidence inventory protocol, incomplete input handling rules, and confidence-level classification. TC-011 (incomplete input — Stratos-RF), TC-012 (technical-only — Ironclad-DDR), TC-013 (adversarially sanitized — Apex-ML) added. 40/40 Pass across all edge case scenarios. Phase 3 closed. |
| v1.5 | 2026-03-18 | Phase 4 complete. TC-014 (Jira CSV — Crestline-HPC), TC-015 (PowerPoint-to-text — Eon-AI), TC-016 (email thread — Typhoon-5G) added. README.md rewritten as bilingual operational guide for Henry's team (cadence, document collection, submission instructions, output module guide). evaluation_rubric.md expanded to 12 categories with scoring-without-domain-expertise preamble and inter-rater reliability guidance. All three format test cases passed structural validation. Phase 4 closed. |
| v1.6 | 2026-03-18 | Self-adjustment addendum. SKILL.md Step 0 (Domain Inference and Manager Calibration) added. CALIBRATE.md meta-skill created. manager_profiles/henry.md starter profile created. tools/calibrate.sh created. tools/analyze_pptx.sh and tools/markitdown_analyze.sh updated with --manager flag and profile injection. AGENTS.md and ROADMAP.md updated to document the self-adjustment system. |
| v2.0 | 2026-03-31 | Generalization initiative: "Make Everybody King or Queen." Added Evolution Phases 0–5 covering three tiers (Universal Adversarial Core, Continuous Evolution Engine, Proactive Intelligence). Defined generalized five-step CoT, five-module report, six-element domain framework, directory structure for `skills/universal-kings-hand/`, cross-domain test strategy, security & governance principles. Derived from `MAKE_EVERYBODY_KING_OR_QUEEN.md` v1.0. |
| v2.1 | 2026-03-31 | Incorporated `MAKE_EVERYBODY_KING_OR_QUEEN.md` v1.1 updates: Step 0.5 Knowledge Depth Assessment (L1/L2/L3 levels controlling Top-Down vs Bottom-Up ratio), per-step behavior differences at each depth level, report confidence calibration (Analysis Foundation Statement at L1), knowledge sedimentation loop (Tier 1 ↔ Tier 2 structural relationship showing L1→L2→L3 progression), updated acceptance criteria for Evo Phases 0/1/2 and Generalization KPI Summary. |
| v2.2 | 2026-04-01 | Incorporated `MAKE_EVERYBODY_KING_OR_QUEEN.md` v1.2 (chief of staff narrative reframing). Step 0 dual-mode design (passive inference + active calibration conversation). Three operating modes as trust evolution (Calibration → Quick Scan → Full Report). Two questioning capabilities distinguished (soul questions as sword vs. calibration conversation as first dinner). Updated Evo Phase 0 deliverables (dual-mode logic, three-mode routing). Updated Evo Phase 1 deliverables (calibration interview engine, cold-start experience test, medical device Domain Pack) and acceptance criteria. Updated Generalization KPI Summary. |
