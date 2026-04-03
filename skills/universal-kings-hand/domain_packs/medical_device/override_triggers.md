# Status Override Triggers — Medical Device / Pharmaceutical

> Reference knowledge base for The King's Hand. Defines strict criteria for
> status light assignment with explicit override triggers that supersede
> official project status reports in medical device development programs.

---

## Core Principle

**Technical and regulatory evidence always trumps official report status.**

When a program manager reports Green but the design review minutes, CAPA logs, V&V results, or regulatory correspondence reveal Red-level conditions, The King's Hand overrides to Red and explains exactly why. The system exists precisely because medical device programs are under intense schedule and commercial pressure that systematically distorts internal reporting. The consequences of undetected distortion in this domain are uniquely severe: patient harm, regulatory enforcement, criminal prosecution, and existential corporate liability.

---

## Status Definitions

### Green — On Track

The program is genuinely healthy. All regulatory, design, verification, clinical, and manufacturing indicators are positive. No material risks have been identified that lack a credible and resourced mitigation plan.

**All of the following must be true:**

| Criterion | Requirement |
|:----------|:-----------|
| Design controls current | All design reviews completed on schedule with documented decisions; action items tracked to closure; DHF current |
| V&V on schedule | Verification and validation testing proceeding per protocol; no unresolved test failures requiring design change |
| Regulatory strategy confirmed | Regulatory pathway confirmed by RA (Regulatory Affairs) with predicate identified (for 510(k)) or clinical plan approved (for PMA); no open questions with FDA/notified body |
| Risk management current | ISO 14971 risk management file updated concurrently with design; no open unmitigated hazards above acceptable risk threshold |
| No open CAPA | Zero open Corrective and Preventive Actions related to the device or its development process |
| Supplier audits complete | All critical suppliers independently audited and on the Approved Supplier List; no open supplier corrective actions |
| Clinical plan approved | Clinical evaluation strategy defined and approved by clinical affairs; IDE submitted (if required); enrollment on plan |
| Software lifecycle compliant | IEC 62304 classification justified and documented; software lifecycle activities on plan for the assigned class |
| Budget and resources on plan | Engineering budget on track; no unplanned resource requests; key personnel dedicated |

**If any single criterion above fails, the program cannot be Green.**

---

### Yellow — Latent Risk

Emerging problems are visible in the data but have not yet caused irreversible damage. The program could slip to Red without intervention. Executive attention is warranted to prevent escalation.

**One or more of the following conditions exist:**

| Criterion | Signal |
|:----------|:------|
| Design review action items overdue | Open action items from design reviews are past due by >14 days with no documented path to closure |
| V&V test failures requiring re-test | One or more verification or validation tests have failed but the failure is attributed to test setup or procedure error (not design deficiency); re-test planned |
| Regulatory strategy under revision | Regulatory pathway or predicate selection is being reconsidered based on new information; submission timeline uncertain |
| Open CAPA with no root cause | A CAPA has been opened related to the device or process, and root cause investigation has not been completed within the company's defined timeline |
| Supplier issue identified | One or more critical suppliers have open corrective actions, incoming inspection reject rates above threshold, or audit findings not yet closed |
| Risk management file lag | The risk management file has not been updated to reflect design changes made in the last 30 days |
| DHF documentation backlog | Design History File documentation is >30 days behind current design activities |
| Clinical enrollment behind plan | Clinical trial enrollment is >20% behind the planned rate |
| Software anomalies accumulating | Open software anomalies (IEC 62304 problem reports) are increasing sprint-over-sprint with resolution rate below creation rate |
| Key personnel shared | Principal engineer, regulatory lead, or quality lead is allocated to 2+ concurrent programs |

---

### Red — Critical

A material problem threatens the program timeline, regulatory strategy, patient safety, or commercial viability. Immediate executive intervention is required. Delay in action will make the situation worse.

**Any one of the following conditions triggers Red:**

| Criterion | Trigger |
|:----------|:------|
| Design control gap identified by auditor | An internal or external audit has identified a design control nonconformity (missing design review, incomplete traceability, undocumented design change) |
| V&V failure requiring design change | A verification or validation test has failed and the root cause is a design deficiency — not a test error; redesign is required |
| Regulatory submission rejected or RTA | FDA has issued a Refuse to Accept, Not Substantially Equivalent determination, or PMA deficiency letter with major findings; or notified body has rejected the Technical Documentation |
| Clinical adverse event | A serious adverse event has occurred in a clinical trial that is possibly or probably related to the device |
| Recall risk identified | Post-market data, internal testing, or complaint trend analysis indicates a potential field safety corrective action (recall) may be necessary |
| FDA Warning Letter or 483 observation | FDA has issued a Warning Letter or Form 483 observation related to the device, its manufacturing, or the QMS that governs it |
| Patient safety issue confirmed | A hazard has been identified that is not adequately controlled and could result in serious injury or death |
| Regulatory pathway failure | The planned regulatory pathway (510(k), De Novo, PMA) has been determined to be non-viable; pathway change required |
| Clinical endpoint not met | Interim or final clinical data indicates the primary efficacy endpoint will not be met |

---

## Override Rules

### Override-to-Red Triggers

These conditions **automatically override any official status to Red**, regardless of what the program manager reports:

| # | Override Trigger | Rationale |
|---|-----------------|-----------|
| R1 | V&V test failures reclassified as "expected variation" or "within acceptable range" without statistical justification | Test failures are being buried rather than investigated; the device may not meet its specifications; this is a data integrity concern |
| R2 | Design change submitted after regulatory filing without a supplement or amendment | The filed design no longer matches the marketed design; this is a regulatory violation (adulteration) that can trigger enforcement action |
| R3 | Clinical protocol deviation unreported to FDA or IRB within required timeline | A regulatory reporting obligation has been violated; this creates both legal exposure and calls into question the integrity of all trial data |
| R4 | CAPA root cause repeatedly changed (3+ revisions) without resolution | The organization does not understand the problem; the CAPA system is being used to create the appearance of action without achieving resolution |
| R5 | Risk management file not updated after a design change that affects a previously controlled hazard | The risk management file no longer reflects the actual device; residual risk determinations are invalid; auditor finding is certain |
| R6 | Program manager reporting Green/Yellow while 3+ Yellow or Red signals exist in program data | Watermelon effect confirmed; the reporting chain is corrupted; executive visibility into true program status has been compromised |
| R7 | Software safety classification lower than hazard analysis supports, with hardware mitigations not independently verified | The IEC 62304 lifecycle rigor is insufficient for the actual risk; patient safety depends on unverified assumptions |
| R8 | Predicate device substantial equivalence argument contradicted by the device's own design documentation | The 510(k) strategy is built on a false equivalence; FDA can issue NSE at any time; the entire regulatory foundation is unstable |

### Override-to-Yellow Triggers

These conditions **automatically override Green status to Yellow**:

| # | Override Trigger | Rationale |
|---|-----------------|-----------|
| Y1 | Risk management file not updated within 30 days of a design change | The risk file is stale; design decisions are being made without current risk context; audit finding is likely |
| Y2 | DHF documentation lag exceeds 30 days behind current design activity | The design history is incomplete; if development were audited today, nonconformities would be found |
| Y3 | Supplier corrective action open for more than 90 days | The supplier issue is not being resolved with urgency; incoming quality risk is accumulating |
| Y4 | Open software anomalies increasing for 2+ consecutive sprints | Software quality is degrading; the development team is creating defects faster than resolving them; V&V readiness is receding |
| Y5 | No usability evaluation conducted prior to entering detailed design | Usability risk is uncharacterized; the design may need fundamental revision after summative testing, which is a late and expensive discovery |
| Y6 | Single-source supplier for a critical component with no qualified alternative | Supply chain risk is concentrated; any supplier disruption directly impacts production timeline |
| Y7 | Clinical enrollment more than 30% behind planned rate with no approved mitigation | The clinical timeline is slipping; regulatory submission date is at risk; the enrollment problem may signal site or protocol issues |

---

## Status Assessment Process

When analyzing a medical device program document, The King's Hand follows this sequence:

1. **Collect all evidence** from the input document (program status reports, design review minutes, V&V results, CAPA logs, regulatory correspondence, clinical data, audit reports, supplier performance data, complaint trends)
2. **Check Override-to-Red triggers first** — if any R1-R8 condition is present, the status is Red regardless of all other factors
3. **Check Override-to-Yellow triggers** — if no Red triggers but any Y1-Y7 condition is present, the status is at least Yellow
4. **Assess base status** — only if no override triggers are present, evaluate against the Green criteria table
5. **Compare with official status** — if the assessed status is worse than the official report, override and explain the specific evidence that contradicts the official classification
6. **Never upgrade** — The King's Hand never assigns a better status than the official report. If official says Yellow and evidence supports Yellow, keep Yellow. The system only overrides in the direction of worse status.

---

## Evidence Quality Requirements

The King's Hand must distinguish between evidence-based assessment and speculation:

| Evidence Type | What It Reveals | Absence Impact |
|:-------------|:---------------|:---------------|
| Design review minutes and action item logs | Whether design controls are being followed; whether decisions are documented; whether action items are being closed | Cannot assess design process health — flag as data gap; this is a critical gap because design controls are the backbone of medical device development |
| V&V test reports and protocols | Whether the device meets specifications; whether test failures have occurred; whether acceptance criteria are appropriate | Cannot assess product quality or submission readiness — flag as critical data gap |
| CAPA logs and investigation records | Whether quality problems are being identified and resolved; whether root causes are understood | Cannot assess quality system health — flag as data gap; open CAPAs are the single best predictor of audit outcomes |
| Regulatory correspondence (FDA letters, notified body communications) | Whether the regulatory strategy is viable; whether the authority has concerns | Cannot assess regulatory risk — flag as data gap; the absence of regulatory correspondence late in development may itself be a signal |
| Clinical trial data (enrollment, endpoints, adverse events) | Whether the clinical evidence supports the intended claim; whether safety signals exist | Cannot assess clinical/regulatory pathway viability — flag as critical data gap for PMA and EU MDR Class III |
| Risk management file (hazard analysis, risk controls, residual risk) | Whether risks are identified and controlled; whether the risk-benefit analysis supports release | Cannot assess patient safety posture — flag as critical data gap; an unavailable risk file is itself a Red signal |
| Supplier audit reports and incoming inspection data | Whether the supply chain is qualified and performing | Cannot assess supply chain risk — flag as data gap |
| Complaint and MDR data (post-market) | Whether field safety signals exist; whether complaint trends are emerging | Cannot assess post-market safety — flag as data gap; for marketed products, absence of complaint data review is a Red signal |

---

## Confidence Levels

| Level | Evidence Coverage | Recommendation |
|:------|:-----------------|:---------------|
| High | 6+ evidence types present with data from the last 30 days | Assessment is reliable; findings can be acted on with confidence |
| Medium | 3-5 evidence types present; some data gaps but core program data (design reviews, V&V, regulatory) available | Assessment is directional; flag specific gaps and recommend data requests before major decisions |
| Low | Fewer than 3 evidence types present | Assessment is speculative; demand comprehensive data package before acting; the data absence pattern itself may be informative (organizations hide what they do not want examined) |
