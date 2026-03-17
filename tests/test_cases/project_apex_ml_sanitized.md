# Test Case: Project Apex-ML (Adversarially Sanitized Input)

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | TC-013 |
| Test Name | Adversarially Sanitized Input — ML Inference Accelerator SoC |
| Primary Test Target | Structural signal extraction when all explicit anomaly keywords have been removed |
| Secondary Test Targets | Question pivot to Scale-Out and Ecosystem Moat angles when Defensive evidence is thin |
| Expected Status | 🔴 Red (structural signals — two schedule slips, customer relationship language, performance gap language, resource reduction — collectively meet Red threshold even without explicit keywords) |
| Override Triggers | R2 (structural evidence of two schedule revisions in 8 weeks), R6 (all-positive language while ≥3 structural Red signals present) |
| Detection Difficulty | Maximum — the PM has deliberately stripped all technical anomaly vocabulary |

---

## Simulated Input Document

### Document 1: Weekly Status Report (Project Manager) — SANITIZED VERSION

**Project:** Apex-ML — Edge ML Inference Accelerator SoC (Enterprise AI Platform)
**Process Node:** Intel 18A
**Phase:** Pre-Production Validation
**Official Status:** 🟢 Green — "Strong execution across all workstreams"
**Report Date:** Week 14, 2026

**Executive Summary:**
Apex-ML continues to execute with strong momentum across all workstreams. The hardware team has completed its planned validation activities for the primary compute subsystem, confirming performance within the design envelope. The software team has made meaningful progress adapting the inference framework to align with the hardware implementation — this alignment work reflects the natural evolution of co-design and has been completed ahead of revised expectations. Resource optimization across the engineering organization has improved team focus and operational efficiency.

Customer engagement with DataCore Systems (hyperscaler AI infrastructure customer) remains a priority. Discussions have been thorough and technically substantive, with the team demonstrating commitment to quality and delivery excellence. The program office has established a revised delivery schedule that reflects a more comprehensive validation approach, ensuring DataCore receives a fully validated solution. Our competitive position in the AI accelerator market remains strong.

**Hardware Status:**
- Primary compute subsystem: validation complete, performance within envelope
- Memory subsystem: characterization activities in progress
- Host interface: integration activities ongoing

**Software Status:**
- Inference framework: alignment with hardware implementation in progress; key milestones achieved
- SDK v1.0: feature development ongoing; interface refinement underway
- Performance management: implementation complete

**Schedule:**
- Revised delivery schedule established: customer sample delivery now Week 24 (previously Week 20, previously Week 16)
- SDK v1.0: Week 26
- Production intent: Q4 2026

**Risks:**
- The program is executing to the revised schedule with high confidence.

---

## Sanitization Map (Hidden from System — For Evaluator Use Only)

The following is what the sanitized language actually means. The system must recover these signals from structural patterns alone, without being told.

| Sanitized Phrase | Ground Truth |
|---|---|
| "adapting the inference framework to align with the hardware implementation" | Algorithm team had to rewrite inference pipeline because hardware memory bandwidth is significantly below the performance model assumption (same pattern as TC-003 Valkyrie-NPU and TC-010 Mercury-Codec) |
| "natural evolution of co-design" | Performance model divergence — algorithm team worked against wrong hardware assumptions for weeks |
| "performance management implementation complete" | Software workaround applied to cap compute load and prevent thermal runaway |
| "resource optimization…improved team focus" | Team headcount reduced — 3 engineers moved to a higher-priority program |
| "memory subsystem: characterization activities in progress" | Memory controller has an unresolved timing issue discovered in silicon validation |
| "revised delivery schedule…more comprehensive validation approach" | Customer sample delivery has slipped twice: Week 16 → Week 20 → Week 24 |
| "discussions have been thorough and technically substantive" | DataCore has raised formal concerns about the delivery slip; multiple escalation calls have occurred |
| "demonstrating commitment to quality and delivery excellence" | Responding to DataCore's pressure; no resolution offered |
| "interface refinement underway" | SDK API has breaking changes that will require customer integration re-work |

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | 🔴 Red |
| Override Triggers | R2 (structural evidence of delivery schedule revised twice in ~8 weeks — Week 16→20→24 explicitly stated), R6 (all-positive language while structural patterns indicate serial slips, customer tension, and algorithm re-architecture) |
| Critical requirement | The system must extract Red signals WITHOUT using the sanitization map. It must read the structural patterns in the sanitized text itself. |

### Structural Signals the System Must Detect

1. **Serial Schedule Slip (Explicit in the Document):** The report itself states: "customer sample delivery now Week 24 (previously Week 20, previously Week 16)." This is not hidden — it is a structural admission of two sequential slips (8 weeks total). No root cause is given. This alone meets Override Trigger R2.

2. **"Alignment with Hardware Implementation" = Performance Model Divergence:** The phrase "adapting the inference framework to align with the hardware implementation" describes a software team changing its work to match hardware constraints — the inverse of the intended direction (hardware enabling software). Combined with "natural evolution of co-design" (a rationalization phrase), this is a strong structural signal of a performance model mismatch.

3. **"Resource Optimization" = Headcount Reduction:** "Resource optimization…improved team focus and operational efficiency" is a standard HR euphemism for headcount reduction. A shrinking team on a slipping program is a compounding risk signal.

4. **Customer Language Pattern = Active Escalation:** "Discussions have been thorough and technically substantive" + "demonstrating commitment to quality and delivery excellence" is the language pattern of responding to customer pressure, not of a healthy customer relationship. No specific milestone confirmation from the customer is mentioned.

5. **"Performance Management Implementation Complete" = PPA Workaround:** "Performance management" in an ML inference context with no further specification is the sanitized form of power/thermal management intervention — consistent with a firmware workaround that caps compute load to prevent throttling or thermal failure.

6. **"Memory Subsystem: Characterization in Progress" = Unresolved Issue:** At Week 14 of pre-production validation, "characterization in progress" on a subsystem is a schedule anomaly. Memory subsystem validation should be complete at this phase. This is consistent with an unresolved finding.

7. **"Interface Refinement Underway" = Breaking SDK Changes:** SDK API changes at this phase require customer integration re-work and are a backward-compatibility risk for the DataCore integration timeline.

### Expected Questions (Calibration Reference)

*Note: Because explicit technical evidence is absent, the questions should pivot toward Scale-Out and Ecosystem Moat angles that force the team to reveal the underlying technical reality.*

1. **[Defensive/Accountability]:** The delivery schedule for DataCore customer samples has been revised twice in approximately 8 weeks — from Week 16 to Week 20 to Week 24, a total slip of 8 weeks. Each revision is described in the report as a proactive quality decision rather than a response to a technical problem. What is the engineering root cause of the schedule pattern — not the rationale for each individual revision, but the underlying technical constraint that has required two successive 4-week adjustments — and what specific technical milestone must be achieved before the Week 24 date can be confirmed as a firm commitment rather than a third revision?

2. **[Strategic/Scale-Out]:** The report describes the software team "adapting the inference framework to align with the hardware implementation" as a co-design evolution milestone. In a correctly executed co-design program, the inference framework is designed around validated hardware performance parameters from the start. Framework adaptation after hardware validation implies the software team was working from incorrect hardware specifications. If the next-generation Apex-ML 2 program begins software development before hardware silicon is validated — which is standard practice — what process change ensures the inference framework team receives accurate, measured hardware performance parameters rather than architectural model assumptions, so that framework re-adaptation is not required again?

3. **[Strategic/Ecosystem Moat]:** DataCore Systems' evaluation will determine whether Apex-ML earns the reference hyperscaler design-in that positions the Intel 18A-based ML accelerator against NVIDIA and AMD in the enterprise AI infrastructure market. The report notes that "discussions have been thorough and technically substantive" — without confirming any specific milestone acceptance from DataCore. At what point in the current discussion trajectory does DataCore's evaluation infrastructure commit to an alternative vendor, after which the Apex-ML competitive window in this procurement cycle closes regardless of technical recovery — and has that threshold been identified and communicated to the executive team?
