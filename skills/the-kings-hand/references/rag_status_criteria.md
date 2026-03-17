# RAG Status Criteria — Red/Yellow/Green Assignment Rules

> Reference knowledge base for The King's Hand. Defines strict criteria for
> status light assignment with explicit override triggers that supersede
> official project status reports.

---

## Core Principle

**Technical evidence always trumps official report status.**

When a project manager reports Yellow but the Jira data, commit history, or meeting notes reveal Red-level conditions, The King's Hand overrides to Red and explains exactly why. The system exists precisely because official status reports are systematically optimistic.

---

## Status Definitions

### 🟢 Green — On Track

**Definition:** The project is genuinely healthy. All major technical and schedule indicators are positive. No material risks have been identified that lack a credible mitigation plan.

**All of the following must be true:**
| Criterion | Requirement |
|-----------|-------------|
| PPA compliance | All power, performance, and area metrics within committed specification |
| Budget | Engineering budget on track; no unplanned resource requests |
| Milestones | All phase-gate milestones met within ±1 week of plan |
| Critical bugs | Zero open critical hardware bugs without a defined fix path |
| Customer status | No customer escalations; design-in/design-win feedback positive |
| Test coverage | Test coverage increasing sprint-over-sprint; no plateaus |
| Interface stability | All HW/SW interface definitions frozen and agreed |
| Workaround count | Zero workarounds in production code, OR all workarounds have been stress-tested across full PVT range and PPA impact is documented and within spec |

**If any single criterion above fails, the project cannot be Green.**

---

### 🟡 Yellow — Latent Risk / Resource Bottleneck

**Definition:** No catastrophic failure has occurred yet, but internal signals indicate that risk is accumulating. The project could slip to Red without intervention.

**One or more of the following conditions exist:**
| Criterion | Signal |
|-----------|--------|
| Resource contention | Key engineers shared across multiple projects; no dedicated allocation |
| Interface instability | HW/SW interface definitions not yet frozen; changes still occurring |
| Test plateau | Test coverage has not increased in ≥2 consecutive sprints |
| Workaround accepted | Software workaround deployed but only stress-tested under nominal conditions |
| Integration gap | Algorithm team and BSP team have not run integration tests against the same silicon revision |
| Schedule buffer consumed | ≥50% of schedule buffer consumed with ≥50% of work remaining |
| Dependency risk | Third-party IP delivery delayed but alternative path exists |
| Performance model gap | Algorithm team's performance assumptions not validated against real silicon measurements |

---

### 🔴 Red — Critical Blockage / Customer Escalation

**Definition:** The project has a material problem that threatens tape-out schedule, customer commitments, or product specifications. Immediate executive intervention is required.

**Any one of the following conditions triggers Red:**
| Criterion | Trigger |
|-----------|---------|
| Tape-out delay | Tape-out date has slipped from the committed schedule |
| Customer escalation | A Tier-1 customer has formally escalated a concern about this project |
| Critical hardware bug | An open critical hardware bug exists with no viable hardware fix path; cost has been transferred to software |
| PPA breach | A customer-committed PPA specification cannot be met, and no credible recovery plan exists |
| Watermelon detection | Project manager reports Green or Yellow, but technical evidence (Jira, commits, meeting notes) contradicts the classification |
| Safety violation | A safety mechanism has been disabled or compromised (e.g., watchdog disable) |
| Supply chain block | Foundry capacity, advanced packaging, or critical IP delivery has failed with no alternative |

---

## Override Rules

### Override-to-Red Triggers

These conditions **automatically override any official status to Red**, regardless of what the project manager reports:

| # | Override Trigger | Rationale |
|---|-----------------|-----------|
| R1 | Any open hardware bug classified as "critical" with no hardware fix path defined | The cost is being silently transferred to software; PPA impact is unknown and unquantified |
| R2 | Two or more tape-out date slips within any 60-day period | Serial slippage indicates systemic scheduling failure, not a one-time event |
| R3 | Any software workaround that provably violates a customer-committed PPA specification | The product cannot meet its contractual obligations; customer relationship at risk |
| R4 | Any confirmed customer escalation from a Tier-1 account | The external relationship is already damaged; internal reporting has failed |
| R5 | Third-party IP delivery failure on critical path with no alternative sourced | The project is blocked by a dependency outside internal control with no mitigation |
| R6 | Project manager reporting Green/Yellow while ≥3 Red-level signals exist in technical data | Watermelon effect confirmed; the reporting chain is corrupted |
| R7 | Safety mechanism disabled (watchdog, ECC, lockstep) as a workaround | Product cannot pass safety certification; shipping is impossible |
| R8 | NPU/GPU/ISP performance ≥15% below committed specification with no recovery plan | Customer benchmark commitments will be breached |

### Override-to-Yellow Triggers

These conditions **automatically override Green status to Yellow**:

| # | Override Trigger | Rationale |
|---|-----------------|-----------|
| Y1 | Workaround accepted but stress-tested only in nominal conditions, not corner cases | The workaround may fail under production PVT conditions |
| Y2 | Module interface definitions between hardware and software teams not yet frozen | Any work built on unfrozen interfaces will need rework |
| Y3 | Test coverage has not increased in two consecutive sprints despite active development | Testing is being deprioritized; defect escape risk is increasing |
| Y4 | Algorithm team and BSP team have not run integration tests against the same silicon | Performance assumptions are unvalidated; integration test failure risk |
| Y5 | Schedule buffer ≥50% consumed with ≥50% of work remaining | Schedule risk is accumulating faster than work is being completed |
| Y6 | Key technical lead on this project is also allocated to ≥2 other projects | Resource contention will cause delays; no single project gets full attention |
| Y7 | A software workaround exists but its PPA cost has not been quantified | The true cost is unknown; the project may be operating on a false performance model |

---

## Status Assessment Process

When analyzing a project document, The King's Hand follows this sequence:

1. **Collect all evidence** from the input document (weekly report, Jira data, commit logs, meeting notes, escalation reports)
2. **Check Override-to-Red triggers first** — if any R1–R8 condition is present, the status is Red regardless of all other factors
3. **Check Override-to-Yellow triggers** — if no Red triggers but any Y1–Y7 condition is present, the status is at least Yellow
4. **Assess base status** — only if no override triggers are present, evaluate against the Green criteria table
5. **Compare with official status** — if the assessed status is worse than the official report, override and explain the specific evidence that contradicts the official classification
6. **Never upgrade** — The King's Hand never assigns a better status than the official report. If official says Yellow and evidence supports Yellow, keep Yellow. The system only overrides in the direction of worse status.

---

## Evidence Quality Requirements

The King's Hand must distinguish between evidence-based assessment and speculation:

| Evidence Level | Description | Action |
|----------------|-------------|--------|
| **Direct evidence** | Specific data in the document (bug ID, commit hash, meeting minute quote, customer email excerpt) | State the finding with confidence; cite the evidence |
| **Strong inference** | Multiple indirect signals pointing to the same conclusion (e.g., 3 workaround keywords + schedule slip language + team conflict reference) | State the finding and explicitly list the signals that support it |
| **Weak signal** | A single indirect indicator that could have innocent explanations | Flag as a risk to investigate; do not assign Red based solely on weak signals |
| **No evidence** | The topic is not addressed in the document | State that this area was not covered in the provided documents; recommend that Henry request this data |
