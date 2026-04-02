# ROADMAP.md — The King's Hand

**Project Start:** 2026-03-16
**Specification Version:** v3.0 (see `THE_KING_S_HAND_DEV_PLAN.md`, `MAKE_EVERYBODY_KING_OR_QUEEN.md` v2.0)
**Current Status:** Original Phases 1–4 complete (2026-03-18). Generalization initiative launched (2026-03-31). System identity pivot (2026-04-02): from occasional analyst to persistent working partner. Entering Evolution Phase 0.

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

Five evolution phases to transform The King's Hand from an IC-design-specific analysis tool into a **persistent working partner** for any domain. See `MAKE_EVERYBODY_KING_OR_QUEEN.md` v2.0 for the full specification.

**Core identity pivot (v2.0):** The system's foundation is no longer "an analyst you consult occasionally" — it is "a persistent working partner who is always there." Adversarial analysis becomes one skill the partner deploys when needed, not its entire identity.

```
┌─────────────────────────────────────────────────────────────┐
│  Tier 3: Proactive Intelligence (Phase 3–4)                 │
│  — Stagnation detection, deadline alerts, auto-generated     │
│    weekly reports, trend detection, cross-project matching    │
├─────────────────────────────────────────────────────────────┤
│  Tier 2: Analytical Arsenal & Continuous Evolution (Phase 1–2)│
│  — King's Hand adversarial analysis as a skill, preference   │
│    learning, knowledge sedimentation, Domain Pack generation  │
├─────────────────────────────────────────────────────────────┤
│  Tier 1: Persistent Partner Foundation (Phase 0)             │
│  — First-day dialogue, Living Work State, daily update       │
│    ingestion, natural-language task tracking                  │
└─────────────────────────────────────────────────────────────┘
```

```
Evo Phase 0  → Persistent partner core: first-day dialogue + Living Work State + daily updates
Evo Phase 1  → Analytical arsenal: adversarial analysis as skill + cross-domain validation
Evo Phase 2  → Continuous evolution: preference learning + knowledge sedimentation + auto Domain Packs
Evo Phase 3  → Proactive intelligence: stagnation detection + deadline alerts + auto weekly reports
Evo Phase 4  → Multi-user & community: knowledge sharing + collaboration
```

**Four Operating Modes:**
| Mode | When | What Happens |
|:-----|:-----|:-------------|
| Calibration | First meeting (L1, no Profile) | 3-5 question conversation to understand user's world; builds Manager Profile + initial Living Work State |
| Daily Conversation | Everyday interactions | User shares updates naturally; system maintains Living Work State (tasks, events, commitments) |
| Quick Scan | User asks about a specific document/email | Targeted Step 1 + Step 3 analysis, conversational response, no full report |
| Full Analysis | User requests deep analysis or system detects crisis signals | Complete five-step CoT → five-module report (The King's Hand) |

**Four-Layer Memory Architecture:**
| Layer | Content | Persistence | Update Frequency |
|:------|:--------|:------------|:-----------------|
| Working Memory | Current conversation context | Session-only | Continuous |
| Living Work State | Tasks, project status, commitments, events | Cross-session | Daily (from conversation) |
| User Profile | Domain, role, priorities, style preferences, terminology | Cross-session | Low (calibration-driven) |
| Domain Knowledge Base | Frameworks, patch patterns, euphemism dictionaries | Cross-user | Rare (pack updates) |

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
- [x] `tools/calibrate.sh` — Wrapper that assembles CALIBRATE.md + existing profile + session transcript into calibration input for pasting into an agent session
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
**Specification:** `MAKE_EVERYBODY_KING_OR_QUEEN.md` v2.0
**Core Thesis:** The system's value is not in occasional analysis — it is in persistent presence. A truly useful chief of staff is someone who is there every day, understands your world, tracks your reality, and pulls out adversarial analysis when you need it. The King's Hand's analytical capability becomes one skill of a persistent working partner.

**System Identity:**
> **Old:** "Give me a document, I'll tell you what's hidden."
> **New:** "Be your persistent working partner. Know your world. Track your reality. When you need to cut through the fog, draw the blade."

**Verified Reusable Assets from Original Phases:**
- Five-step Chain of Thought reasoning engine (becomes Tier 2 analytical skill)
- Five-module report structure with narrative prose rules
- Status light override mechanism ("technical evidence always trumps official status")
- Three-type soul question taxonomy (Defensive/Accountability, Scale-Out, Ecosystem Moat)
- Step 0 self-adaptive reasoning (domain inference + manager calibration)
- CALIBRATE.md meta-skill for progressive profile enrichment

**Six-Element Domain Framework** (established in Self-Adjustment Addendum, used across all tiers):
1. Hard Constraint — inviolable limits in the domain
2. Patch Pattern — short-term fixes masking structural problems
3. Irreversible Milestone — points of no return
4. Trade-off Axes — core resource trade-off dimensions
5. Tier-1 Relationship — most critical external stakeholders
6. Blame Transfer Seam — organizational boundaries where responsibility shifts

**Core Data Flow Change (v2.0):**

| Dimension | Previous (Analyst Model) | New (Partner Model) |
|:----------|:------------------------|:--------------------|
| Primary input | Document packages (weekly reports, Jira, meeting notes) | Daily conversation flow ("boss gave me a new project", "build study is stuck") |
| Primary output | Five-module analysis report | Living Work State + on-demand analysis + auto-generated weekly reports |
| Interaction frequency | Weekly (pre-meeting analysis) | Daily (continuous updates) |
| Core state | Stateless (each analysis independent) | **Stateful** (maintains live TODO, project status, commitment tracking) |
| Analysis trigger | User submits documents | Partner detects crisis signals from daily conversation, or user explicitly requests |

---

## Evolution Phase 0 — Persistent Partner Core
**Target:** TBD
**Goal:** Establish the system's foundation identity as a persistent working partner. Users can conduct a first-day dialogue, share daily updates in natural language, and have the system maintain a Living Work State. Quick Scan and Full Analysis modes are available. Existing IC design users (e.g., Henry) experience zero friction — document-in, report-out works exactly as before.

### Deliverables

| Item | Description |
|:-----|:------------|
| `skills/universal-kings-hand/SKILL.md` | Generalized system prompt defining four operating modes (Calibration / Daily / Quick Scan / Full Analysis) with trigger conditions and execution logic. CoT parameterized (Steps 0 dual-mode → 0.5 → 1–5 depth-controlled) |
| First-day dialogue engine | Step 0 active-mode: 3-5 natural-language questions mapping to six-element framework in `<thinking>`, Manager Profile initialization, initial Living Work State seeding |
| Living Work State mechanism | Data structure (task table + event log + commitment tracker). Natural-language input → structured state update parsing in `<thinking>`. Persistence via `work_state/{user}.md` |
| Daily conversation mode | User shares updates in natural language; system parses to state updates, maintains Living Work State. No analysis triggered unless explicitly requested |
| Quick Scan mode | User submits fragment + specific question; system runs Step 1 + Step 3 subset, responds conversationally |
| Four-layer memory architecture | Working Memory / Living Work State (high-frequency) / User Profile (low-frequency) / Domain Knowledge Base. Persistence mechanisms for each layer |
| `skills/universal-kings-hand/references/framework_templates.md` | Six-element framework example mappings for ≥ 5 domains |
| `skills/universal-kings-hand/references/domain_inference_signals.md` | Multi-signal domain inference rules |
| `skills/universal-kings-hand/domain_packs/ic_design/` | Original reference files relocated into domain pack directory (no content changes) |
| `skills/universal-kings-hand/domain_packs/_template/` | Blank domain pack templates for new domains |
| IC design 16-case regression | Triggered via Full Analysis mode, maintains 100% pass rate |

### Living Work State — Core Data Structure

The Living Work State is the heart of the persistent partner. It is a structured, continuously updated representation of the user's work reality, maintained from natural daily conversation.

```markdown
## Work State: {user}
Last updated: 2026-03-22 14:30

### Active Projects & Tasks
| ID | Item | Status | Last Update | Stale Days | Notes |
|:---|:-----|:-------|:------------|:-----------|:------|
| T-001 | Android build study | 🔴 Stuck | 03-20 | 2 | root cause verification failed |
| T-002 | Q2 HC planning (25%) | 🟡 In Progress | 03-22 | 0 | waiting for HR headcount ceiling |
| T-003 | NPU compiler benchmark | 🟢 On Track | 03-21 | 1 | results match expectations |

### Recent Key Events
- 2026-03-22: Boss asked about build study in weekly meeting, committed to update by Monday
- 2026-03-20: Build study root cause verification failed

### Tracked Commitments
- Monday update to boss on build study → 3 days away
- HR headcount ceiling response → waiting
```

**Maintenance triggers:**

| User Says | System Does |
|:----------|:-----------|
| "Boss gave me a new task" | Create task entry, infer priority and deadline |
| "Build study made progress" | Update task status, reset stale days |
| "The API proposal can wait" | Change status to ⚪ Waiting |
| "Benchmark is done, results OK" | Mark ✅ Complete, move to history |
| "Here, analyze this report" | Trigger Tier 2 Full Analysis; link findings to relevant task |
| Task stale > threshold | Mention naturally in next conversation |

### Generalized Chain of Thought (Tier 2 — Analytical Arsenal)

The King's Hand's five-step CoT + Step 0.5 Knowledge Depth Assessment operates as the Full Analysis mode. It is triggered on-demand, not on every interaction.

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
| First-day dialogue | 3-5 questions → Manager Profile accurately reflects user's work context | |
| Daily update ingestion | ≥ 90% accuracy extracting task status updates from 10 natural conversation segments | |
| Living Work State consistency | After 5 simulated days, work state table accurately reflects all task statuses | |
| Quick Scan | Targeted conversational response to fragment + question, no forced full report | |
| **Existing user zero friction** | User with complete Profile + Domain Pack (e.g., Henry) submits documents → system does NOT trigger calibration dialogue, goes straight to Full Analysis, experience identical to original King's Hand | |
| IC design regression | 16/16 test cases pass via Full Analysis mode | |
| Core/domain-pack separation | System runs in generic mode when `domain_packs/ic_design/` is removed | |
| Framework template coverage | ≥ 5 domains with six-element framework examples | |
| Step 0.5 implementation | Knowledge Depth Assessment produces correct L1/L2/L3 rating in `<thinking>` block | |

---

## Evolution Phase 1 — Analytical Arsenal & Cross-Domain Validation
**Target:** TBD
**Goal:** Equip the persistent partner with The King's Hand's full adversarial analysis capability as an on-demand skill. Validate across multiple domains. Analysis results feed back into Living Work State.

### Deliverables

| Item | Description |
|:-----|:------------|
| Full Analysis mode | Complete five-step CoT + five-module report, triggered on-demand from within the partner context |
| Step 0.5 Knowledge Depth Assessment | L1/L2/L3 self-assessment controlling Top-Down vs Bottom-Up ratio |
| Analysis → Living Work State writeback | Key findings auto-summarized into the relevant task's history in Living Work State |
| Domain inference engine | Multi-signal fusion: user statement > profile > terminology density > job titles > KPI types > document structure |
| Dynamic framework constructor | Real-time six-element framework construction in `<thinking>` |
| Analysis Foundation Statement | L1-mode reports include explicit depth declaration and improvement recommendations |
| Software startup Domain Pack | First non-IC-design complete domain knowledge pack |
| Medical device Domain Pack | Second high-quality Domain Pack (mitigates cold-start risk) |
| Cross-domain test suite | ≥ 3 non-IC-design domains with test cases and expected output baselines |
| Cold-start end-to-end test | Calibration → daily updates → quick scan → full analysis — complete path verified |

### Analysis Trigger Logic

| Trigger | What Happens |
|:--------|:-------------|
| User explicitly requests ("analyze this report") | Full five-module analysis |
| User asks about a specific document/email | Quick Scan (Step 1 + Step 3 subset) |
| Partner detects crisis signals from daily conversation | Suggest analysis: "Your recent updates on X suggest something may be hidden. Want me to look deeper?" |
| Weekly report generation finds inconsistency | Flag contradiction in weekly report, recommend full analysis |

### Acceptance Criteria

| Check | Target | Result |
|:------|:-------|:-------|
| Analysis trigger accuracy | Daily conversation does NOT trigger analysis; explicit requests DO; system never analyzes without consent | |
| Analysis → Living Work State | Key findings correctly written back to relevant task | |
| Zero-config cross-domain | Useful reports for 3 test domains with no Manager Profile and no Domain Pack | |
| Domain inference accuracy | ≥ 90% on 10 blind-test documents | |
| Knowledge depth assessment | L3 for IC design, L1 for first contact, L2 for partial Pack | |
| L1 behavioral correctness | No force-fit; Analysis Foundation Statement present; Q2-Q3 exploratory | |
| Cross-domain soul questions | 3/3 unanswerable with reassurance per test case | |
| Cold-start experience | No step in the full path feels "this is just a generic tool" | |
| IC design regression | 16/16 pass | |

---

## Evolution Phase 2 — Continuous Evolution
**Target:** TBD
**Goal:** The partner gets smarter with every interaction. Preference learning, knowledge sedimentation (L1→L2→L3), auto-generated Domain Packs.

### Deliverables

| Item | Description |
|:-----|:------------|
| Implicit preference learning | CIPHER-inspired: compare original output vs. user modifications, infer descriptive preferences |
| Extended CALIBRATE.md | Incremental update, conflict resolution, confidence decay, cross-domain migration |
| Domain Pack auto-generation | From ≥ 5 same-domain interactions, produce candidate Pack, request user confirmation |
| Quality gate mechanism | Consistency check + minimum usage count (≥ 3) + user confirmation |
| Knowledge sedimentation validation | Full L1→L2→L3 longitudinal test |

### Knowledge Sedimentation Loop

```
Interactions 1-3 (L1 Thin)
  ├─ Bottom-Up dominant: data surfaces anomaly patterns
  ├─ System produces exploratory reports
  └─ CALIBRATE.md extracts: domain terms, user focus areas, anomaly signals

Interactions 4-8 (L2 Moderate)
  ├─ Candidate knowledge passes quality gates → confirmed
  ├─ Patch pattern library gains concrete instances
  ├─ Euphemism dictionary coverage rises
  └─ Top-Down : Bottom-Up approaches 50:50

Interactions 9+ (toward L3 Deep)
  ├─ Domain Pack accumulates verified knowledge
  ├─ Override triggers gain quantified thresholds
  └─ System converges on King's Hand IC design performance
```

**The generalized system is not a weakened King's Hand — it is the King's Hand in its youth.**

### Acceptance Criteria

| Check | Target | Result |
|:------|:-------|:-------|
| Preference match | 5 interactions → report style significantly improved (human eval) | |
| Knowledge depth climbing | L1 → L2 after ≥ 8 interactions; Step 0.5 reflects upgrade | |
| Domain Pack auto-generation | Expert review accuracy ≥ 80% | |
| Preference transparency | All inferences visible and editable in Profile | |
| No regression | IC design 16-case regression pass | |

---

## Evolution Phase 3 — Proactive Intelligence
**Target:** TBD
**Goal:** The partner starts speaking up. Stagnation detection, deadline alerts, auto-generated weekly reports, trend detection.

### Deliverables

| Item | Description |
|:-----|:------------|
| Stagnation detection engine | Living Work State stale-day thresholds → natural conversational reminders |
| Deadline alert | Track commitments, remind before deadlines |
| Auto weekly report | From week's daily conversations + Living Work State change history, generate structured weekly report |
| Trend detection | Same task/project status compared across weeks; worsening/improving flagged |
| Cross-project pattern matching | New project signals compared against historical crisis precursors |

### Stagnation Alert Tone

| Situation | Partner Says |
|:----------|:-------------|
| General task stale > 7 days | "By the way, the API proposal hasn't been updated in a week. Still waiting on the architecture committee, or is something else going on?" |
| Deadline approaching | "You told the client you'd have the spec by Wednesday — that's tomorrow. Want me to help organize what we have so far?" |
| Critical task deteriorating | "Build study is in its third week. Each time you mention it, the language gets vaguer. This might be the moment to raise it in the weekly meeting." |

### Acceptance Criteria

| Check | Target | Result |
|:------|:-------|:-------|
| Weekly report quality | Auto-generated report covers all key progress and blockers (human eval) | |
| Stagnation alert accuracy | Alerted tasks genuinely need attention (false positive < 20%) | |
| Deadline alerts | All commitments with explicit deadlines are reminded before due | |
| Trend detection | Correctly identify worsening/improving across 3 simulated weeks | |

---

## Evolution Phase 4 — Multi-User & Community
**Target:** TBD
**Goal:** Domain Pack sharing, community ratings, multi-user collaboration.

### Deliverables

| Item | Description |
|:-----|:------------|
| Domain Pack sharing | Opt-in sharing with auto-PII removal |
| Pack rating & merge | Community scores, multi-contributor merge |
| Privacy separation | Living Work State + User Profile strictly private; Domain Pack optionally shared |

### Acceptance Criteria

| Check | Target | Result |
|:------|:-------|:-------|
| Privacy enforcement | No PII leaks from Profile or Living Work State to shared Packs | |
| Merge quality | Merged Pack more complete than any single contributor (expert review) | |

---

## Generalization KPI Summary

| Category | Metric | Target |
|:---------|:-------|:-------|
| **Tier 1: Persistent Partner** | | |
| First-day dialogue | Manager Profile accuracy after 3-5 questions | Human-verified |
| Daily update ingestion | Task status extraction accuracy from natural conversation | ≥ 90% |
| Living Work State consistency | Accurate after 5 simulated days | Human-verified |
| Existing user zero friction | Henry-class user → straight to Full Analysis, no calibration | Pass/fail |
| **Tier 2: Analytical Arsenal** | | |
| Analysis trigger accuracy | No false triggers on daily conversation | 100% |
| Cross-domain analysis | Useful reports from unknown-domain documents | 3+ test domains |
| Domain inference | Correct identification | ≥ 90% blind test |
| Knowledge depth assessment | Correct L1/L2/L3 rating | One test per level |
| Soul questions | Unanswerable with reassurance | 3/3 per case |
| IC design regression | No degradation | 16/16 pass |
| Knowledge depth climbing | L1 → L2 after ≥ 8 interactions | Step 0.5 reflects upgrade |
| Preference learning | Style match improvement over 5 interactions | Significant (human eval) |
| Domain Pack auto-generation | Expert accuracy | ≥ 80% |
| **Tier 3: Proactive Intelligence** | | |
| Weekly report quality | Covers all key progress and blockers | Human-verified |
| Stagnation alert precision | False positive rate | < 20% |
| Deadline alerts | All explicit deadlines reminded | 100% |
| Trend detection | Correct trend identification | 3-week simulated data |

---

## Security & Governance Principles

1. **User Data Sovereignty:** User Profiles and Living Work State belong entirely to the user. Living Work State contains tasks, commitments, and work progress — highly sensitive. Never shared without consent. Domain Pack sharing is opt-in; auto-strip PII before sharing.
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
| v3.0 | 2026-04-02 | **System identity pivot.** Incorporated `MAKE_EVERYBODY_KING_OR_QUEEN.md` v2.0. System foundation flipped from "analyst you consult" to "persistent working partner who is always there." Three-tier architecture restructured: Tier 1 = Persistent Partner Foundation (Living Work State, daily updates, first-day dialogue); Tier 2 = Analytical Arsenal & Continuous Evolution (King's Hand analysis as on-demand skill, preference learning); Tier 3 = Proactive Intelligence (stagnation detection, deadline alerts, auto weekly reports). Four operating modes (Calibration / Daily / Quick Scan / Full Analysis). Four-layer memory (Working / Living Work State / User Profile / Domain Knowledge). Development phases reduced from 6 to 5. Living Work State data structure defined. Analysis trigger logic defined. Generalization KPI Summary restructured by tier. |
