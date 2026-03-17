# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**The King's Hand** is a Claude Agent Skill Set (single-agent system) designed to give senior IC design executives adversarial intelligence about project health. It analyzes raw project data (Jira logs, Git commits, meeting notes, FAE escalations) and produces a five-module executive report in Traditional Chinese (繁體中文), culminating in "The King's Three Soul-Searching Questions."

**Core problem:** In matrix-organization semiconductor companies, project status reports are systematically filtered upward. Projects appear "green" externally while being "red" internally (the "Watermelon Effect"). The system overrides official statuses with evidence-based assessments.

## Current Status

The project has completed **Phase 2** (accepted 2026-03-18) and is ready for **Phase 3**. All Phase 1 deliverables have been created:

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
│   │   └── project_greenlight_trap.md      # ✅ Pure watermelon effect (TC-004)
│   └── evaluation_rubric.md               # ✅ 10-category scoring criteria
└── compliance/
    └── output_rules.json                  # ✅ Machine-readable formatting constraints
```

## Key Specification Documents

- **`THE_KING_S_HAND_DEV_PLAN.md`** — Master technical specification (671 lines). Read this before making any structural decisions.
- **`GEMINI.md`** — Project status, completed work, and development guidelines.
- **`README.md`** — Bilingual (English/Chinese) concept overview.

## Architecture: Single Unified Agent

The system is a **single agent** (not multi-agent). All reasoning occurs internally in `<thinking>` tags. Value comes from domain knowledge depth + structured reasoning + strict output constraints.

**Five-Step Internal Chain of Thought:**
1. Deconstruction & Noise Reduction — extract project state, flag anomaly keywords
2. Spectrum Positioning & Empowerment Assessment — classify technical layer and commercial value
3. Contradiction Detection & Root Cause Tracing — find discrepancies between claims and evidence
4. Market Ripple Extrapolation — translate technical findings to commercial risk
5. Strategic Question Synthesis — design three unanswerable questions

**Five Output Modules (in Traditional Chinese):**
1. 專案光譜定位與賦能價值 — Spectrum positioning (Markdown table)
2. 專案穿透性摘要與紅綠燈 — Status light + one-sentence verdict
3. 跨層級協作摩擦力與風險 — Cross-layer friction (narrative prose + table)
4. 客戶/市場連動效應 — Customer & market ripple (two paragraphs)
5. 國王的靈魂三問 — The King's Three Questions (three question types)

## Critical Output Rules

- **No bullet lists** in analytical modules (3 and 4). Narrative prose only — this forces deeper synthesis.
- **Quantify everything:** every workaround must include estimated PPA (Power/Performance/Area) cost.
- **Status override:** if official report says Yellow but technical evidence says Red → output Red.
- **Adversarial tone:** questions must be unanswerable with executive reassurance.
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

| Phase | Month | Key Deliverables |
|-------|-------|-----------------|
| 1 | 1 | SKILL.md, 4 reference docs, 4 test cases |
| 2 | 2 | 10-case test suite, 15 question templates, adversarial tone calibration |
| 3 | 3 | Edge case handling for incomplete/messy inputs |
| 4 | 4 | Real-format inputs, final README, evaluation rubric, deployment cadence |

## Acceptance KPIs (Phase 1)

- Status accuracy: 100% correct Red override on test cases, 0 false positives
- Workaround detection: ≥2 per document when present
- Question quality: 100% unanswerable with reassurance
- Tone compliance: 0 bullet lists in analysis modules, 0 softening language
