# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**The King's Hand** is a Claude Agent Skill Set (single-agent system) designed to give decision-makers adversarial intelligence about project health. Originally built for senior IC design executives, it is evolving into a **universal adversarial analysis system** for any domain. It analyzes raw project data (Jira logs, Git commits, meeting notes, status reports, email threads) and produces a five-module executive report in Traditional Chinese (繁體中文), culminating in "The Three Soul-Searching Questions."

**Core problem:** In matrix organizations, project status reports are systematically filtered upward. Projects appear "green" externally while being "red" internally (the "Watermelon Effect"). This is not unique to semiconductors — it is the fate of every organization with layered reporting structures. The system overrides official statuses with evidence-based assessments.

**Generalization initiative:** `MAKE_EVERYBODY_KING_OR_QUEEN.md` defines the plan to make the system work across any domain via automatic domain inference, a calibration conversation for new users, and progressive knowledge depth growth (L1 thin → L3 deep).

## Current Status

The project has completed all four original phases (accepted 2026-03-18) and is deployed for IC design analysis. The generalization initiative ("Make Everybody King or Queen") was launched 2026-03-31, entering Evolution Phase 0. All original deliverables:

```
the-kings-hand/
├── AGENTS.md                              # ✅ Entry point and system manifest
├── skills/the-kings-hand/
│   ├── SKILL.md                           # ✅ Core system prompt (XML-structured)
│   └── references/
│       ├── software_stack_map.md           # ✅ 5-layer stack knowledge base
│       ├── workaround_taxonomy.md          # ✅ 8 workaround patterns with PPA costs
│       ├── rag_status_criteria.md          # ✅ Green/Yellow/Red rules + override triggers
│       └── corporate_code_words.md         # ✅ 25 disguised language patterns
├── tests/
│   ├── test_cases/
│   │   ├── project_adas_x9.md             # ✅ Yellow-to-Red override (TC-001)
│   │   ├── project_smartlink_iot.md        # ✅ Green-to-Yellow override (TC-002)
│   │   ├── project_valkyrie_npu.md         # ✅ Multi-layer friction (TC-003)
│   │   ├── project_greenlight_trap.md      # ✅ Pure watermelon effect (TC-004)
│   │   ├── project_nova_ap.md             # ✅ Android AP thermal throttle (TC-005)
│   │   ├── project_titan_ev.md            # ✅ EV BMS ASIL-B violation (TC-006)
│   │   ├── project_helios_wifi7.md        # ✅ Wi-Fi 7 cert failure (TC-007)
│   │   ├── project_clearwater_pcie.md     # ✅ PCIe Gen5 race condition (TC-008)
│   │   ├── project_athena_true_green.md   # ✅ True Green control case (TC-009)
│   │   ├── project_mercury_codec.md       # ✅ Video codec HW constraint (TC-010)
│   │   ├── project_stratos_rf_incomplete.md # ✅ Incomplete input (TC-011)
│   │   ├── project_ironclad_ddr_technical.md # ✅ Technical-only input (TC-012)
│   │   ├── project_apex_ml_sanitized.md   # ✅ Adversarially sanitized (TC-013)
│   │   ├── project_crestline_hpc_jira.md  # ✅ Raw Jira CSV input (TC-014)
│   │   ├── project_eon_ai_slides.md       # ✅ PowerPoint-to-text input (TC-015)
│   │   └── project_typhoon_5g_email.md    # ✅ Email thread input (TC-016)
│   └── evaluation_rubric.md               # ✅ 10-category scoring criteria
└── compliance/
    └── output_rules.json                  # ✅ Machine-readable formatting constraints
```

## Key Specification Documents

- **`THE_KING_S_HAND_DEV_PLAN.md`** — Original master technical specification (671 lines). Read this before making any structural decisions about the IC design skill.
- **`MAKE_EVERYBODY_KING_OR_QUEEN.md`** — Generalization specification (v1.2). Defines the three-tier architecture, six-element domain framework, Step 0 dual-mode design, three operating modes, and six evolution phases. Read this before making any generalization decisions.
- **`ROADMAP.md`** — Unified roadmap (v2.2). Original phases 1-4 + evolution phases 0-5.
- **`GEMINI.md`** — Project status, completed work, and development guidelines.
- **`README.md`** — Bilingual (English/Chinese) concept overview.

## Architecture: Single Unified Agent

The system is a **single agent** (not multi-agent). All reasoning occurs internally in `<thinking>` tags. Value comes from domain knowledge depth + structured reasoning + strict output constraints.

**Internal Chain of Thought (Generalized):**
0. Domain Inference & Manager Calibration (dual-mode: passive reading + active conversation)
0.5. Knowledge Depth Assessment — L1/L2/L3 rating determines Top-Down vs Bottom-Up ratio
1. Deconstruction & Noise Reduction — extract project state, flag anomaly signals
2. Value Chain Positioning — locate project in domain value chain, connect to commercial/organizational goals
3. Contradiction Detection — claims vs. evidence gaps, hidden patch costs, blame transfer traces
4. Impact Extrapolation — translate internal issues to external consequences (Tier-1 relationships, irreversible milestones)
5. Strategic Question Synthesis — design three unanswerable questions

**Three Operating Modes:**
- **Calibration** — First meeting: 3-5 question conversation to understand user's world; builds initial Manager Profile
- **Quick Scan** — Day-to-day: targeted analysis of a document fragment or specific question; conversational, no full report
- **Full Report** — Deep trust: complete five-module analysis delivered as a pre-meeting weapon

**Five Output Modules (in Traditional Chinese):**
1. 專案定位與戰略價值 — Value chain positioning (Markdown table)
2. 穿透性摘要與狀態判定 — Status light + one-sentence verdict
3. 跨職能摩擦與隱性風險 — Cross-functional friction (narrative prose + table)
4. 外部連動效應 — External ripple effect (two paragraphs)
5. 靈魂三問 — The Three Soul Questions (three question types)

**Six-Element Domain Framework:**
1. Hard Constraint — inviolable limits in the domain
2. Patch Pattern — short-term fixes masking structural problems
3. Irreversible Milestone — points of no return
4. Trade-off Axes — core resource trade-off dimensions
5. Tier-1 Relationship — most critical external stakeholders
6. Blame Transfer Seam — organizational boundaries where responsibility shifts

## Critical Output Rules

- **No bullet lists** in analytical modules (3 and 4). Narrative prose only — this forces deeper synthesis.
- **Quantify everything:** every workaround must include estimated cost along the domain's trade-off axes (e.g., PPA in IC design).
- **Status override:** if official report says Yellow but technical evidence says Red → output Red. Override triggers defined by domain framework.
- **Adversarial tone:** questions must be unanswerable with executive reassurance.
- **Knowledge depth honesty:** At L1 (thin), use cautious tone ("evidence suggests" not "system determines"); include Analysis Foundation Statement. At L3 (deep), full assertive mode.
- **All output in 繁體中文** (Traditional Chinese).

## Status Light Criteria

| Status | Conditions |
|--------|-----------|
| 🟢 Green | On spec, budget clean, milestones met, no unresolved critical bugs |
| 🟡 Yellow | No tape-out slip yet, but emerging risk signals (resource contention, test coverage plateauing) |
| 🔴 Red | Tape-out delay confirmed, customer escalation, critical bug with no fix, PPA spec missed with no recovery plan |

**Override Rule:** Technical evidence always trumps official report status.

## Red Flag Keywords

Anomaly keywords that demand investigation: `workaround`, `patch`, `spinlock`, `race condition`, `silicon errata`, `metal spin`, `schedule slip`, `customer escalation`, `technical debt`

## Corporate Code Word Translation

Key translations that must be recognized:
- "Ongoing integration with minor delays" → HW/SW interface not frozen → 🔴 Red
- "Exploring alternative software approaches" → Hardware errata found; firmware forced to compensate → 🔴 Red
- "Optimization in progress" → Power budget exceeded; thermal test failing → 🔴 Red
- "Minor schedule adjustment" → Tape-out slipped 2–4 weeks → 🔴 Red

## Development Phases

### Original Phases (Complete)

| Phase | Key Deliverables | Status |
|-------|-----------------|--------|
| 1 | SKILL.md, 4 reference docs, 4 test cases | ✅ Complete |
| 2 | 10-case test suite, 15 question templates, adversarial tone calibration | ✅ Complete |
| 3 | Edge case handling for incomplete/messy inputs | ✅ Complete |
| 4 | Real-format inputs, final README, evaluation rubric, deployment cadence | ✅ Complete |

### Evolution Phases (Generalization — In Progress)

| Phase | Goal |
|-------|------|
| Evo 0 | Architecture refactor: separate core from IC design domain pack; Step 0 dual-mode + three operating modes |
| Evo 1 | Universal adversarial core: zero-config cross-domain analysis, calibration conversation, domain packs |
| Evo 2 | Cross-session memory & preference learning |
| Evo 3 | Dynamic skill expansion & multi-domain validation |
| Evo 4 | Trend detection & proactive early warning |
| Evo 5 | Community knowledge sharing & multi-user collaboration |

See `ROADMAP.md` for full details and acceptance criteria.

## Acceptance KPIs (Original)

- Status accuracy: 100% correct Red override on test cases, 0 false positives
- Workaround detection: ≥2 per document when present
- Question quality: 100% unanswerable with reassurance
- Tone compliance: 0 bullet lists in analysis modules, 0 softening language
