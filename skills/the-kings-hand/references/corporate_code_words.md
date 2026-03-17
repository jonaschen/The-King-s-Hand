# Corporate Code Words — Disguised Language Translation Glossary

> Reference knowledge base for The King's Hand. Maps corporate euphemisms and
> softened language commonly found in IC design project status reports to their
> ground truth meaning and status classification.

---

## Core Principle

Project managers under schedule pressure systematically soften language in status reports. "Optimization" means the spec is being missed. "Refinement" means the architecture is being violated. "Alignment" means two teams are in conflict. The King's Hand translates every phrase to its ground truth before analysis.

---

## Translation Table

| # | Official Report Language | Ground Truth | Status Classification |
|---|--------------------------|-------------|----------------------|
| 1 | "Ongoing integration with minor delays" | Cross-team interface definition not frozen; HW/SW co-verification stalled | 🔴 Red — critical path blocked |
| 2 | "Exploring alternative software approaches" | Silicon errata found; hardware team refuses metal spin; forcing cost to firmware | 🔴 Red — unknown PPA consequence |
| 3 | "Optimization in progress" | Power budget exceeded; cannot pass customer thermal test | 🔴 Red — product spec breach |
| 4 | "Awaiting third-party IP delivery" | Contract negotiation failed or supplier capacity full; resources idle indefinitely | 🟡 Yellow → 🔴 Red — outside internal control |
| 5 | "Performance tuning ongoing" | NPU throughput well below committed TOPS; no credible recovery path identified | 🔴 Red — customer commitment at risk |
| 6 | "Architecture refinement underway" | Module boundary violated by workaround; technical debt being created silently | 🟡 Yellow — debt accumulating |
| 7 | "Minor schedule adjustment" | Tape-out slipped by 2–4 weeks for the second time | 🔴 Red — pattern of serial slippage |
| 8 | "Stabilization in progress" | Repeated system crashes in bring-up; root cause not isolated | 🔴 Red — silicon quality unknown |
| 9 | "Cross-team alignment session scheduled" | Two departments cannot agree on who owns a critical path dependency | 🟡 Yellow — decision authority unclear |
| 10 | "Resource rebalancing across projects" | Key engineers pulled from this project to fight fires on another; this project is now under-staffed | 🟡 Yellow — resource risk; may escalate to 🔴 Red |
| 11 | "Preliminary results are encouraging" | First silicon bring-up has fundamental issues but one sub-block works; management is cherry-picking the positive data | 🟡 Yellow — selective reporting |
| 12 | "Working closely with the foundry on yield improvements" | Silicon yield is below production threshold; cost-per-die economics broken | 🔴 Red — production viability at risk |
| 13 | "Customer feedback being incorporated" | Customer rejected the current deliverable; redesign or significant rework required | 🔴 Red — customer dissatisfaction |
| 14 | "Regression testing in progress" | A recent change broke previously working functionality; scope of breakage unknown | 🟡 Yellow — quality regression |
| 15 | "Evaluating silicon quality" | First silicon has unexpected behavior; bring-up team is triaging a list of hardware bugs | 🔴 Red — silicon quality crisis |
| 16 | "Team augmentation planned" | The current team cannot deliver on time; emergency hiring or contractor engagement required | 🟡 Yellow — capacity crisis |
| 17 | "Power optimization sprint initiated" | The chip exceeds its power envelope; thermal design is failing; customer spec cannot be met with current silicon | 🔴 Red — PPA specification breach |
| 18 | "Finalizing test plan" | Test plan does not exist or is critically incomplete this late in the project; verification coverage is a blind spot | 🟡 Yellow — verification risk |
| 19 | "Firmware workaround deployed successfully" | Hardware bug confirmed; metal spin rejected; firmware is now carrying the cost permanently; PPA impact not assessed | 🔴 Red — hardware-to-software blame transfer |
| 20 | "Dependency on next silicon revision for full resolution" | Current silicon cannot meet spec; the bug is being deferred to the next tape-out; all current customers get a compromised product | 🔴 Red — product shipped below spec |
| 21 | "Interface specification under review" | HW/SW interface was never properly defined; both teams built to different assumptions; integration will fail | 🔴 Red — interface contract broken |
| 22 | "Boot time optimization ongoing" | Bootloader has a fundamental initialization failure; cold boot is unreliable on certain memory configurations | 🟡 Yellow → 🔴 Red — boot reliability |
| 23 | "Security hardening in progress" | A security vulnerability was found; scope and severity not yet determined; product may fail regulatory certification | 🔴 Red — regulatory and compliance risk |
| 24 | "Aligning roadmap with market requirements" | The project's feature set is mismatched with what customers actually need; pivot or scope change incoming | 🟡 Yellow — strategic misalignment |
| 25 | "Conducting a thorough root cause analysis" | The team has been debugging the same critical issue for weeks with no resolution; the root cause is not understood | 🔴 Red — unresolved critical issue |

---

## Pattern Recognition Guidelines

### Softening Language Indicators
When any of the following words appear in a status report, they are softening an underlying problem:
- **"Minor"** — used to downplay schedule slips, bug counts, or spec deviations
- **"Ongoing"** — used to normalize a stalled activity as continuous progress
- **"Preliminary"** — used to present incomplete or negative results optimistically
- **"Exploring"** — used to disguise the fact that the planned approach has failed
- **"Refining"** — used to soften the reality of rework or architectural violation
- **"Aligning"** — used to hide unresolved conflicts between teams
- **"Encouraging"** — used to selectively highlight positive data while suppressing negative
- **"Finalizing"** — used to imply near-completion when significant work remains

### Escalation Language (Inverted Signal)
Ironically, when reports use direct, specific language about problems, the situation is often less severe because the team is actively managing it. Watch for the **absence** of problem language in areas where problems should exist — this silence is often the strongest red flag.

### Compound Signals
When multiple code words appear in the same report section, the combined signal is almost always worse than any individual phrase:
- "Optimization in progress" + "minor schedule adjustment" = Power spec breach AND schedule slip = 🔴 Red
- "Cross-team alignment" + "architecture refinement" = Inter-team conflict causing architectural damage = 🔴 Red
- "Resource rebalancing" + "awaiting third-party IP" = Under-staffed AND externally blocked = 🔴 Red

---

## Usage in Analysis

When The King's Hand encounters any phrase from the translation table or any softening language indicator:

1. **Translate immediately** — replace the corporate language with the ground truth in internal reasoning
2. **Assess status impact** — apply the classification from the table
3. **Look for compound signals** — check if multiple code words cluster in the same report section
4. **Cross-reference with evidence** — verify the translation against Jira data, commit logs, and meeting notes
5. **Report in Module 3** — include the translation explicitly in the cross-layer friction analysis, naming the specific language used and what it actually means
