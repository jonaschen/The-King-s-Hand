# Status Override Triggers — [Domain Name]

<!-- TEMPLATE INSTRUCTIONS
     Replace all [bracketed] placeholders with domain-specific content.
     The status light system (Green/Yellow/Red) must be calibrated for your
     domain's specific risk signals. The key principle is: evidence-based
     status always overrides official report status.

     For each status level, define concrete, observable criteria — not
     subjective judgments. A reader should be able to look at project data
     and unambiguously determine whether a criterion is met.

     Override triggers are the most critical section. These define the
     conditions under which the system will contradict an official status
     report. Each trigger should be specific enough to be testable against
     real project data.

     Delete this comment block when the template is filled in.
-->

## Core Principle

Evidence-based status always overrides official report status. When project
documents contain signals that contradict the reported status, the override
takes precedence. This is the mechanism that defeats the "watermelon effect"
— projects that appear green on the outside but are red on the inside.

## Status Definitions

### Green — On Track

[One sentence defining what "on track" means in this domain.]

| Criterion | Requirement |
|:----------|:-----------|
| [Key milestone category] | [What "on track" looks like — specific, measurable] |
| [Budget/resource category] | [What "on track" looks like] |
| [Quality/compliance category] | [What "on track" looks like] |
| [Risk/issue category] | [What "on track" looks like] |
| [Stakeholder/customer category] | [What "on track" looks like] |

<!-- All criteria must be met simultaneously for Green status. -->

### Yellow — Latent Risk

[One sentence defining what "latent risk" means in this domain — problems
are emerging but have not yet caused irreversible damage.]

| Criterion | Signal |
|:----------|:------|
| [Schedule signal] | [Observable indicator that schedule risk is emerging] |
| [Resource signal] | [Observable indicator of resource strain] |
| [Quality signal] | [Observable indicator that quality metrics are plateauing or declining] |
| [Process signal] | [Observable indicator that processes are being bent or bypassed] |
| [Communication signal] | [Observable indicator that information flow is degrading] |

<!-- Any single Yellow signal is sufficient to warrant Yellow status. -->

### Red — Critical

[One sentence defining what "critical" means in this domain — irreversible
damage has occurred or is imminent without intervention.]

| Criterion | Signal |
|:----------|:------|
| [Hard deadline signal] | [Observable indicator of missed or immovable deadline] |
| [Customer/market signal] | [Observable indicator of external impact] |
| [Compliance/regulatory signal] | [Observable indicator of regulatory risk] |
| [Technical signal] | [Observable indicator of fundamental technical failure] |
| [Organizational signal] | [Observable indicator of team or process breakdown] |

<!-- Any single Red signal is sufficient to warrant Red status. -->

## Override-to-Red Triggers

<!-- These are the conditions that force a Red status regardless of what the
     official report claims. Each should be phrased as a testable condition
     that can be evaluated against project data. Aim for 5-10 triggers. -->

R1. [Condition that forces Red — e.g., "Primary deliverable deadline missed
with no approved recovery plan"]

R2. [Condition that forces Red — e.g., "Customer escalation received at
VP level or above"]

R3. [Condition that forces Red — e.g., "Critical defect open for more than
[N] days with no root cause identified"]

R4. [Condition that forces Red — e.g., "Regulatory submission deadline at
risk with no contingency"]

R5. [Condition that forces Red — e.g., "Key technical assumption invalidated
with no alternative path"]

R6. [Condition that forces Red]

R7. [Condition that forces Red]

## Override-to-Yellow Triggers

<!-- These force Yellow status on a project that claims to be Green. Each
     should describe a specific observable discrepancy. Aim for 5-10. -->

Y1. [Condition that forces Yellow — e.g., "Schedule buffer consumed beyond
[N]% before [milestone]"]

Y2. [Condition that forces Yellow — e.g., "More than [N] open issues
classified as 'deferred' in current phase"]

Y3. [Condition that forces Yellow — e.g., "Resource utilization exceeds
[N]% for more than [N] consecutive reporting periods"]

Y4. [Condition that forces Yellow — e.g., "Test coverage or validation
metrics have plateaued for [N] reporting periods"]

Y5. [Condition that forces Yellow — e.g., "Scope change request submitted
after [milestone]"]

Y6. [Condition that forces Yellow]

Y7. [Condition that forces Yellow]

## Status Assessment Process

<!-- Step-by-step instructions for how the analysis engine should evaluate
     status. This ensures consistent, reproducible assessments. -->

1. Collect all status-relevant data points from input documents.
2. Evaluate each Green criterion. If any criterion is not met, status
   cannot be Green.
3. Check all Override-to-Red triggers. If any trigger fires, status is Red
   regardless of other signals.
4. Check all Override-to-Yellow triggers. If any trigger fires and no Red
   trigger has fired, status is Yellow.
5. If official report status differs from assessed status, flag the
   discrepancy and cite the specific evidence that caused the override.
6. Record confidence level based on evidence completeness (see below).

## Evidence Quality Requirements

<!-- Define what types of evidence the system should look for, what each
     type reveals, and what it means when a type is absent. -->

| Evidence Type | What It Reveals | Absence Impact |
|:-------------|:---------------|:---------------|
| [Schedule/milestone data] | [Whether timelines are being met] | [Cannot assess schedule risk — flag as data gap] |
| [Defect/issue tracking data] | [Quality and stability trends] | [Cannot assess quality risk — flag as data gap] |
| [Resource/staffing data] | [Whether team is adequately resourced] | [Cannot assess resource risk — flag as data gap] |
| [Customer/stakeholder communications] | [External perception and satisfaction] | [Cannot assess market risk — flag as data gap] |
| [Financial/budget data] | [Whether spending is on plan] | [Cannot assess cost risk — flag as data gap] |
| [Meeting notes/decision logs] | [Team dynamics and decision quality] | [Cannot assess organizational health — flag as data gap] |

## Confidence Levels

<!-- Define how evidence completeness maps to assessment confidence. -->

| Level | Evidence Coverage | Recommendation |
|:------|:-----------------|:---------------|
| High | [N]+ evidence types present with recent data | Assessment is reliable |
| Medium | [N]-[M] evidence types present, some data gaps | Assessment is directional; flag gaps |
| Low | Fewer than [N] evidence types present | Assessment is speculative; demand more data before acting |
