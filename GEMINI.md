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
The project is currently in the **Initial Setup Phase** (Phase 1 as per the Dev Plan).
- [x] Conceptual README and Strategy Definition.
- [x] Detailed Development Plan (`THE_KING_S_HAND_DEV_PLAN.md`).
- [ ] Directory structure implementation.
- [ ] Reference knowledge base creation.
- [ ] Core `SKILL.md` prompt engineering.

## Key Files
- `README.md`: High-level conceptual and strategic metaphors for the system.
- `THE_KING_S_HAND_DEV_PLAN.md`: **Crucial.** Contains the complete specification, architecture, and roadmap for building the system. Read this before any implementation.

## Operational Guidelines
- **Always be adversarial:** Don't trust official "green" statuses; look for evidence of hardware bugs masked by software workarounds.
- **PPA Focus:** Quantify the cost of every workaround in terms of Power, Performance, and Area.
- **Language:** Final executive output must be in **Traditional Chinese (繁體中文)**.
- **No Bullets in Analysis:** Use narrative prose for analytical modules (Module 3 & 4) to ensure deep synthesis.
