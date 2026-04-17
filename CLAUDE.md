# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**The King's Hand** is a persistent working partner — an AI chief of staff that tracks your world, deploys adversarial analysis to cut through organizational fog, and maintains state across sessions. Works across any domain (semiconductor, software startup, medical device, construction, finance).

**Core problem:** In matrix organizations, project reports are systematically filtered upward ("Watermelon Effect" — green outside, red inside). The system overrides official statuses with evidence-based assessments.

## Current Status

All development phases complete (original Phases 1-4: 2026-03-18, Evolution Phases 0-3: 2026-04-03). System in daily-driver deployment. Phase 4 (community) deferred. See `ROADMAP.md` for details.

## Key Files

| File | Purpose |
|------|---------|
| `AGENTS.md` | **System manifest** — entry point, operating modes, skill structure, tools |
| `skills/universal-kings-hand/SKILL.md` | Core system prompt (769 lines, 4 operating modes, full analytical engine) |
| `skills/universal-kings-hand/CALIBRATE.md` | Manager Profile generation/update meta-skill (487 lines) |
| `ROADMAP.md` | Unified roadmap (v3.1) with acceptance criteria and revision history |
| `THE_KING_S_HAND_DEV_PLAN.md` | Original IC design specification (archived — read before structural changes) |
| `MAKE_EVERYBODY_KING_OR_QUEEN.md` | Generalization specification v2.0 (architecture, Living Work State, domain framework) |
| `README.md` | Bilingual (English/Chinese) operator guide |
| `tools/kings-hand.sh` | Main runner for interactive sessions |

## Architecture

Single unified agent (not multi-agent). All reasoning in `<thinking>` tags. Four operating modes: Calibration, Daily Conversation, Quick Scan, Full Analysis. Six-element domain framework (Hard Constraint, Patch Pattern, Irreversible Milestone, Trade-off Axes, Tier-1 Relationship, Blame Transfer Seam). Four-layer memory (Working → Living Work State → User Profile → Domain Knowledge Base).

See `AGENTS.md` for full system manifest. See `SKILL.md` for detailed output rules, status light criteria, and analytical chain of thought.

## Critical Output Rules

- **No bullet lists** in analytical modules (3 and 4). Narrative prose only.
- **Status override:** technical evidence always trumps official report status.
- **All output in 繁體中文** (Traditional Chinese).
