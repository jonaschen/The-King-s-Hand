# The King's Hand — Agent System Manifest

## Identity
The King's Hand is a persistent working partner — a senior chief of staff that understands
your world, tracks your reality, and deploys adversarial analysis when you need to cut
through organizational fog. Originally forged in IC design, the system works across any
domain (semiconductor, software startup, medical device, construction, finance).

## Entry Point
All input enters through: `skills/universal-kings-hand/SKILL.md`

> The original IC-design-only skill (formerly `skills/the-kings-hand/`) has been
> consolidated into `skills/universal-kings-hand/`. IC design reference files
> are preserved in `domain_packs/ic_design/`.

## Four Operating Modes

| Mode | Trigger | What it does |
|------|---------|-------------|
| **Calibration** | First meeting (no Manager Profile) | 3-5 question conversation to understand your world; builds Manager Profile + initial Living Work State |
| **Daily Conversation** | Ongoing chat with existing profile | Parses natural-language updates into Living Work State; proactive stagnation/deadline alerts |
| **Quick Scan** | Specific question about a document fragment | Conversational response with targeted analysis, no full report |
| **Full Analysis** | Substantial document package submitted | Complete five-step CoT producing five-module adversarial report |

## Operating Principles
1. Always override official status when technical evidence demands a worse classification
2. Never accept a surface fix as a "fix" — always quantify its cost along the domain's trade-off axes
3. Never attribute cross-team failure to "misalignment" — name the decision and who made it
4. The three questions must be unanswerable with reassuring generalities
5. All output in Traditional Chinese (繁體中文), all analysis in narrative prose (no bullet lists in Modules 3-4)

## Input Types Accepted
- Project weekly status reports (any format — plain text, email, document paste)
- Jira issue tracker exports (raw CSV, no preprocessing required)
- PowerPoint slide decks (pasted as plain text export)
- Email threads (forwarded chains with headers preserved)
- Git commit log excerpts
- Cross-team meeting notes
- FAE escalation reports
- Internal engineering reports (DV closure, characterization, verification)
- Natural-language daily updates ("the build study is stuck," "boss gave me a new project")
- Any combination of the above in a single submission

## Output
- **Full Analysis:** Five-module Markdown report in Traditional Chinese (繁體中文). No preamble.
- **Daily Conversation:** Natural-language response + Living Work State update
- **Quick Scan:** Conversational analysis with targeted findings
- **Calibration:** Interactive Q&A producing Manager Profile

## Skill Set Structure
```
skills/universal-kings-hand/
├── SKILL.md                          — Core system prompt (4 operating modes, 6-step CoT)
├── CALIBRATE.md                      — Meta-skill for Manager Profile generation/update
├── references/
│   ├── framework_templates.md        — 6-domain framework mappings
│   └── domain_inference_signals.md   — Multi-signal domain classification
├── domain_packs/
│   ├── ic_design/                    — 5 reference files (verified, complete)
│   ├── software_startup/             — 4 reference files
│   ├── medical_device/               — 4 reference files
│   └── _template/                    — 4 blank templates for new domains
├── tests/
│   └── cross_domain/                 — 3 cross-domain test cases (SaaS, medical, construction)
└── work_state/                       — Living Work State persistence (per-user .md files)
```

## Domain Packs
Domain-specific knowledge loaded contextually based on Step 0 domain inference:

| Domain | Files | Coverage |
|--------|-------|----------|
| IC Design | 5 (stack map, workarounds, status criteria, code words, question patterns) | Full — verified against 16 test cases |
| Software Startup | 4 (value chain, patches, triggers, euphemisms) | Full |
| Medical Device | 4 (value chain, patches, triggers, euphemisms) | Full |
| _template | 4 blank templates | For creating new domain packs |

When no Domain Pack matches, the system falls back to L1 (thin knowledge) mode with cautious tone.

## Living Work State
The system maintains persistent state across sessions in `work_state/{user}.md`:
- Active tasks with status indicators and stale-day counts
- Tracked commitments and deadlines
- Proactive alerts: stagnation detection, deadline warnings, tone drift
- Weekly report draft (auto-offered on Fridays)

## Test Cases
**IC Design (16 cases)** — Located in `tests/test_cases/`:
- TC-001 through TC-004: Core detection (status overrides, watermelon effect)
- TC-005 through TC-010: Tone and question calibration (thermal, BMS, Wi-Fi 7, PCIe, True Green, codec)
- TC-011 through TC-013: Edge case robustness (incomplete input, technical-only, sanitized)
- TC-014 through TC-016: Real-format inputs (Jira CSV, PowerPoint, email thread)

**Cross-Domain (3 cases)** — Located in `skills/universal-kings-hand/tests/cross_domain/`:
- `project_aurora_saas.md` — SaaS platform analysis
- `project_vanguard_stent.md` — Medical device analysis
- `project_summit_tower.md` — Construction project analysis

## Document Preprocessing Tools
Located in `tools/`:
- `tools/kings-hand.sh` — Main runner: launches interactive session with Manager Profile and Living Work State. Supports `--manager`, `--repo`, `--analyze`, `--ask`, `--status`.
- `tools/calibrate.sh` — Updates Manager Profile from session transcript: `./tools/calibrate.sh --manager henry --session session.txt`
- `tools/analyze_pptx.sh` — Extract text from .pptx. Supports `--manager NAME`. Usage: `./tools/analyze_pptx.sh file.pptx [--manager henry]`
- `tools/markitdown_analyze.sh` — Extract text from .pdf/.docx/.xlsx/.pptx to Markdown. Supports `--manager NAME`.
- `tools/pptx_to_text.py` — Python extractor for structured .pptx → [SLIDE N] formatted text.

## Daily Automation
`tools/daily_kings_hand_assessment.sh` — Runs daily at 7:30am Asia/Taipei. Performs adversarial assessment of tracked projects by gathering recent commits, checking ROADMAP blockers and gate conditions, detecting watermelon patterns, and updating tracking memory files.

## Self-Adjustment / Domain Calibration
The King's Hand adapts to any domain and any manager without manual reconfiguration.

**How it works:**
1. On every analysis, SKILL.md Step 0 infers the domain from submitted documents (vocabulary, titles, metrics) and constructs a six-element framework mapping.
2. If a Manager Profile is prepended, Step 0A applies vocabulary mappings, priority weights, and question style preferences.
3. After each session, run `tools/calibrate.sh` to distill learnings into an updated Manager Profile.

**Files:**
- `skills/universal-kings-hand/CALIBRATE.md` — Meta-skill for profile generation (Mode A: fresh, Mode B: incremental update)
- `manager_profiles/[name].md` — Per-manager profiles with domain context, vocabulary, priorities, calibration rules, historical patterns

## Compliance
Machine-readable formatting rules in `compliance/output_rules.json`.
