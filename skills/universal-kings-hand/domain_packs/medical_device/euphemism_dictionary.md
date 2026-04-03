# Euphemism Dictionary — Medical Device / Pharmaceutical

> Reference knowledge base for The King's Hand. Maps corporate euphemisms and
> softened language commonly found in medical device program status reports to
> their ground truth meaning and status classification.

---

## Core Principle

Medical device program managers face a unique pressure environment: regulatory deadlines are often externally imposed (FDA review clocks, notified body audit schedules, clinical trial enrollment windows), commercial expectations are set years in advance, and the consequences of acknowledged failure are severe (program cancellation, layoffs, career impact). This creates systematic incentive to soften bad news, especially in cross-functional status reports where regulatory, clinical, quality, and engineering teams each have their own dialect of avoidance.

The most dangerous euphemisms in medical device development are those that obscure patient safety risks behind regulatory procedural language. When a program manager says "risk-benefit analysis supports current approach," the listener hears confidence. The ground truth may be: the risk is high, but we have crafted a document that rationalizes proceeding.

---

## Translation Table

| # | Official Report Language | Ground Truth | Status Impact |
|:--|:------------------------|:-------------|:-------------|
| 1 | "Design optimization in progress" | V&V testing has failed; the device does not meet specifications; redesign is underway but not being called a redesign | 🟡 Yellow → 🔴 Red — design deficiency confirmed |
| 2 | "Regulatory strategy alignment" | FDA or notified body has pushed back on the approach; the current regulatory pathway may not be viable; team is scrambling for alternatives | 🔴 Red — regulatory pathway at risk |
| 3 | "Enhanced post-market monitoring plan" | A known issue is being deferred to post-market instead of being fixed before release; the company is accepting residual risk that should be eliminated by design | 🔴 Red — known safety issue deferred |
| 4 | "Predicate device landscape analysis" | Cannot find a valid predicate for 510(k); the substantial equivalence argument is weak or non-existent; may need to pivot to De Novo or PMA | 🟡 Yellow → 🔴 Red — regulatory pathway uncertain |
| 5 | "Clinical protocol refinement" | Clinical endpoints are not being met; the team is adjusting success criteria, patient population, or assessment timing to salvage the study | 🔴 Red — clinical efficacy in question |
| 6 | "Supplier development program" | A critical supplier is failing quality requirements; incoming material is not meeting specifications; no qualified alternative exists | 🟡 Yellow — supply chain risk |
| 7 | "Risk-benefit analysis supports current approach" | Risk is high and the team knows it, but a justification document has been crafted to rationalize proceeding; the risk-benefit conclusion may not survive regulatory scrutiny | 🔴 Red — patient safety concern rationalized |
| 8 | "Design history file remediation" | The DHF was not maintained during development; the team is retroactively documenting design decisions, creating design reviews after the fact, and backfilling traceability | 🔴 Red — design control violation |
| 9 | "Process validation optimization" | The manufacturing process is not capable; OQ or PQ has failed; yield is below acceptable levels; production cannot begin | 🟡 Yellow → 🔴 Red — manufacturing readiness blocked |
| 10 | "Biocompatibility testing scope refinement" | A biocompatibility test has failed; the team is narrowing the scope of required testing to exclude the failed endpoint rather than changing the material | 🔴 Red — patient contact safety uncharacterized |
| 11 | "Software verification activities being streamlined" | Full software V&V per IEC 62304 is being reduced in scope to save time; change classifications are being used to justify reduced testing | 🟡 Yellow — software quality risk |
| 12 | "Cross-functional alignment on design inputs" | Requirements are not frozen; engineering, regulatory, marketing, and clinical cannot agree on what the device should do; everything downstream is building on a moving target | 🟡 Yellow → 🔴 Red — requirements instability |
| 13 | "Usability findings being incorporated into next iteration" | Summative (human factors validation) testing revealed critical use errors; the user interface needs fundamental redesign before the study can be repeated | 🔴 Red — usability validation failure |
| 14 | "Sterilization validation parameters under review" | The sterilization process is either not achieving the required SAL or is damaging the device; process parameters need to be changed, triggering revalidation | 🟡 Yellow — sterilization process not validated |
| 15 | "Regulatory submission timeline being refined" | The submission date has slipped; the team does not have the evidence needed to file; "refined" means "delayed indefinitely" | 🟡 Yellow → 🔴 Red — submission not ready |
| 16 | "Clinical enrollment pace being monitored" | Enrollment is behind plan; sites are not recruiting; the study may not complete on time; "monitored" means "we are watching it fail" | 🟡 Yellow — clinical timeline at risk |
| 17 | "Quality system documentation update in progress" | QMS procedures are not adequate; an audit finding (internal or external) has identified gaps; remediation is underway | 🟡 Yellow → 🔴 Red — QMS deficiency |
| 18 | "CAPA effectiveness verification pending" | A CAPA was implemented but there is no evidence it actually solved the problem; the issue may recur; the CAPA system is generating paperwork without results | 🟡 Yellow — quality system ineffective |
| 19 | "Engaging with FDA on classification question" | The device classification is uncertain; the team does not know what regulatory pathway applies; all planning is provisional | 🟡 Yellow — regulatory foundation undefined |
| 20 | "Design transfer activities progressing" | Manufacturing cannot reproduce what R&D built; process specifications are inadequate; the gap between prototype and production is wider than expected | 🟡 Yellow — manufacturing readiness gap |
| 21 | "Conducting thorough root cause analysis" | The team has been investigating a quality issue for weeks without identifying the root cause; "thorough" is a euphemism for "we do not know what is wrong" | 🔴 Red — unresolved critical quality issue |
| 22 | "Post-market clinical follow-up study being designed" | EU MDR requires PMCF but the company has not done it; the study design is starting now for a device that is already on the market; regulatory compliance is overdue | 🟡 Yellow — EU MDR compliance gap |
| 23 | "Labeling updates to enhance clarity" | Use errors or misuse events have occurred in the field; the label is being changed instead of the device; this is an IFU fix masking a design problem | 🟡 Yellow → 🔴 Red — use-related safety signal |
| 24 | "Exploring strategic partnership for clinical evidence" | The company cannot generate the clinical data needed on its own; it lacks clinical trial infrastructure, sites, or funding; this is a capability gap disguised as a strategy | 🟡 Yellow — clinical evidence gap |
| 25 | "Notified body audit preparation activities" | The team is not confident the QMS, technical documentation, or manufacturing site will pass a notified body audit; preparation is remediation in disguise | 🟡 Yellow → 🔴 Red — audit readiness concern |

---

## Pattern Recognition Guidelines

### Softening Language Indicators

When any of the following words appear in a medical device program status report, they are softening an underlying problem:

- **"Refinement"** — used to disguise scope reduction, endpoint changes, or scope narrowing that results from failure. When a protocol, test scope, or design is being "refined," something has failed and the team is working around the failure.
- **"Optimization"** — used to normalize redesign or re-engineering as routine improvement. When a process, design, or parameter is being "optimized," it currently does not work.
- **"Alignment"** — used to hide unresolved conflicts between functions. When teams are "aligning," they disagree on something fundamental and no one has the authority or will to make a decision.
- **"Enhanced"** — used to make risk acceptance sound like proactive improvement. When monitoring is "enhanced," a problem has been identified and the organization is watching it instead of fixing it.
- **"Streamlined"** — used to disguise scope reduction in testing or documentation. When V&V or lifecycle activities are "streamlined," required work is being skipped.
- **"Progressing"** — used to imply forward movement when progress is actually stalled. When activities are "progressing," check for specific deliverables and dates; absence of specifics confirms the stall.
- **"Pending"** — used to normalize indefinite delays. When an action is "pending," no one is working on it and no one has committed to a date.
- **"Under review"** — used to create the appearance of active management while decisions are deferred. When a result, strategy, or finding is "under review," the team does not know what to do about it.

### Escalation Language (Inverted Signals)

In medical device development, direct language about problems is often a positive signal — it means the organization is functional enough to name problems and work on them:

- **Explicit risk identification with named owner and mitigation date:** This is healthy risk management. The risk is acknowledged, owned, and scheduled for resolution. Actually positive.
- **Specific test failure cited with root cause and corrective action plan:** This is normal V&V execution. Failures are expected; what matters is the response. Direct language about failures indicates a functional quality system.
- **CAPA opened with specific scope and timeline:** This is the quality system working as intended. An organization that opens CAPAs readily is healthier than one that avoids them.
- **Sudden disappearance of a previously tracked risk or issue:** This is a strong negative signal. Risks do not resolve themselves. If a risk item vanishes from the report without documented closure, it has been hidden, not resolved.
- **Shift from specific language to vague language about the same topic:** If last month's report said "EMC test failed at 80 MHz immunity, root cause under investigation" and this month says "EMC testing progressing," the problem has not been solved and is now being obscured.

### Compound Signals

When multiple euphemisms appear in the same report section, the combined signal is almost always worse than any individual phrase:

- "Design optimization in progress" + "regulatory submission timeline being refined" = Design deficiency has pushed back the submission; the program is in a redesign-retest-resubmit loop that could add 6-18 months = 🔴 Red
- "Risk-benefit analysis supports current approach" + "enhanced post-market monitoring plan" = A known safety issue is being rationalized and deferred simultaneously; this is the most dangerous combination in medical device development = 🔴 Red
- "Supplier development program" + "process validation optimization" = Both the supply chain and the manufacturing process are failing; production readiness is fundamentally blocked = 🔴 Red
- "Cross-functional alignment on design inputs" + "clinical protocol refinement" = Neither the device requirements nor the clinical success criteria are stable; the entire program foundation is shifting = 🔴 Red
- "Biocompatibility testing scope refinement" + "labeling updates to enhance clarity" = Device is failing biocompatibility and usability simultaneously; the team is narrowing test scope and adding warnings instead of fixing the device = 🔴 Red

---

## Domain-Specific Language Categories

### Schedule and Regulatory Timeline

The most common euphemisms used to disguise schedule problems in medical device development:

- **"Regulatory submission timeline being refined"** — submission is delayed; evidence is not ready. Severity: High.
- **"Clinical enrollment pace being monitored"** — trial is behind schedule; no active mitigation. Severity: Medium-High.
- **"Design transfer activities progressing"** — manufacturing is not ready; launch date is at risk. Severity: Medium.
- **"Pre-submission meeting being scheduled"** — a fundamental question exists that the team cannot answer internally; this resets the FDA interaction clock. Severity: Medium.

### Quality and Design Deficiency

The most common euphemisms used to disguise quality problems:

- **"Design optimization in progress"** — V&V failure; redesign underway. Severity: High.
- **"Conducting thorough root cause analysis"** — root cause unknown after extended investigation. Severity: High.
- **"CAPA effectiveness verification pending"** — corrective action may not have worked. Severity: Medium.
- **"Design history file remediation"** — design controls were not followed; retroactive documentation. Severity: Critical.

### Resource and Capability

The most common euphemisms used to disguise resource shortages or capability gaps:

- **"Exploring strategic partnership for clinical evidence"** — cannot generate clinical data independently. Severity: Medium-High.
- **"Cross-functional alignment"** — functions disagree; no one is making decisions. Severity: Medium.
- **"Quality system documentation update in progress"** — QMS is inadequate; staff or process capability gap. Severity: Medium-High.

### Regulatory and Compliance

The most common euphemisms used to disguise regulatory problems:

- **"Regulatory strategy alignment"** — FDA/notified body has pushed back; approach may fail. Severity: Critical.
- **"Predicate device landscape analysis"** — no valid predicate; 510(k) pathway may be invalid. Severity: High.
- **"Engaging with FDA on classification question"** — device classification is unknown. Severity: High.
- **"Notified body audit preparation activities"** — not confident in audit readiness. Severity: High.

### Patient Safety and Clinical

The most common euphemisms used to disguise safety and clinical concerns:

- **"Risk-benefit analysis supports current approach"** — high risk being rationalized. Severity: Critical.
- **"Enhanced post-market monitoring plan"** — known issue deferred to field surveillance. Severity: Critical.
- **"Clinical protocol refinement"** — endpoints not being met; criteria being adjusted. Severity: Critical.
- **"Biocompatibility testing scope refinement"** — test failure; scope being narrowed. Severity: High.

---

## Usage in Analysis

When The King's Hand encounters any phrase from the translation table or any softening language indicator in a medical device program document:

1. **Translate immediately** — replace the corporate language with the ground truth in internal reasoning
2. **Assess status impact** — apply the classification from the table
3. **Look for compound signals** — check if multiple euphemisms cluster in the same report section; compound signals almost always indicate worse conditions than individual phrases
4. **Cross-reference with evidence** — verify the translation against design review minutes, V&V test reports, CAPA logs, regulatory correspondence, clinical data, and complaint records
5. **Assess the risk control hierarchy** — when the translation reveals that the team is using information (labels, IFU) instead of design controls, flag this as an ISO 14971 hierarchy inversion
6. **Check for the "silence signal"** — in medical device programs, the absence of discussion about specific topics (risk management, V&V status, CAPA trends, clinical enrollment) is itself a signal. Organizations stop reporting on what they want to hide.
7. **Report in Module 3** — include the translation explicitly in the cross-layer friction analysis, naming the specific language used, what it actually means, and which layer of the value chain is affected
