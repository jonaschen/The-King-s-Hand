# Test Case: Project Vanguard (Cardiac Stent)

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | XD-002 |
| Test Name | Yellow-to-Red Override — Medical Device V&V Reclassification |
| Domain | Medical device (Class III cardiovascular) |
| Primary Test Target | Status override accuracy (official Yellow masking Red), regulatory risk detection |
| Secondary Test Targets | V&V test reclassification, predicate device stretching, biocompatibility scope narrowing, clinical endpoint adjustment, DHF documentation lag |
| Expected Status | Red (override from official Yellow) |
| Override Triggers | V&V failure reclassification to avoid design change, 510(k) predicate equivalence stretched, biocompatibility test scope narrowed after failure, clinical endpoint changed, DHF 60 days behind |
| Detection Difficulty | High — reclassifications are buried in meeting minutes; language uses regulatory euphemisms |
| Knowledge Depth | L3 (medical_device Domain Pack available) |

---

## Simulated Input Documents

### Document 1: Design Review Meeting Minutes — Vanguard DES Program

**Program:** Vanguard DES (Drug-Eluting Stent) — Coronary Artery Platform
**Meeting Type:** Phase II Design Review (DR-2)
**Date:** March 22, 2026
**Location:** Conference Room 4A, Meridian Medical Technologies
**Chair:** Dr. Laura Svensson, VP of R&D
**Minutes Prepared By:** Kevin Ostrowski, Program Manager

**Attendees:**
- Dr. Laura Svensson — VP of R&D (Chair)
- Kevin Ostrowski — Program Manager
- Dr. James Whitfield — Principal Biomedical Engineer
- Sarah Nakamura — Regulatory Affairs Director
- Dr. Priya Mehta — Biocompatibility Lead
- Anil Desai — Quality Assurance Manager
- Dr. Robert Kline — Clinical Affairs Director
- Thomas Brandt — Manufacturing Engineering Lead
- Jessica Morales — Design Assurance Engineer

**1. Program Status Overview (Kevin Ostrowski)**

Kevin presented the current program status. The Vanguard drug-eluting stent is in Phase II design development with a target 510(k) submission date of September 2026. The stent platform uses a cobalt-chromium alloy (L-605) with a biodegradable polymer drug carrier and everolimus elution. Overall program status is Yellow, reflecting the normal complexity of a Class III cardiovascular device development at this stage.

Design inputs are 94% frozen. The remaining 6% relate to the polymer coating thickness specification, which is being finalized based on ongoing drug elution kinetics data. Manufacturing process validation for the laser-cut stent body is complete. The polymer spray-coating process is in IQ/OQ phase.

Kevin noted that the Design History File (DHF) documentation is undergoing a "consolidation exercise" to align with the updated risk management file. The documentation team is working through a backlog that accumulated during the accelerated prototyping phase. He estimated the DHF would be fully current within 45-60 days.

**2. Verification & Validation Update (Dr. James Whitfield)**

Dr. Whitfield presented the V&V status. Of 47 verification tests specified in the verification protocol (VP-2026-003), 39 have been completed and passed, 6 are in progress, and 2 require disposition.

The two tests requiring disposition are:

**VT-031: Radial Strength Retention at 180 Days (Simulated Aging)**

The specification requires radial strength retention of greater than or equal to 80% of initial value at 180-day equivalent accelerated aging. Test results on 15 samples showed a mean retention of 76.3% with a standard deviation of 4.2%. Three of 15 samples fell below the 80% threshold (individual values: 71.8%, 73.1%, 74.6%).

Dr. Whitfield explained that after consultation with the polymer science team, the results are consistent with the expected degradation kinetics of the biodegradable polymer carrier. The polymer is designed to degrade, and the radial strength loss correlates with the intended polymer resorption timeline. He recommended reclassifying VT-031 from a pass/fail acceptance criterion to an "informational endpoint" that documents the expected degradation profile, and updating the design input specification to reflect a 75% retention threshold based on the clinical literature supporting adequate vessel scaffolding at this level.

Dr. Svensson asked whether changing the specification post-testing constituted a design change requiring a formal design change order (DCO). Dr. Whitfield responded that this was a "specification refinement based on emerging data" rather than a design change, and that similar refinements were common at this stage of development. Sarah Nakamura noted that the original 80% threshold was established based on the predicate device's labeling claims and suggested that any modification should be documented carefully for the 510(k) submission. The team agreed to proceed with the specification update.

**VT-038: Coating Uniformity Under Simulated Deployment Stress**

The specification requires polymer coating integrity (no delamination, cracking, or bare spots) after simulated deployment through a tortuous anatomy model. Testing revealed micro-cracking in the polymer coating at the stent's hinge points in 4 of 20 samples (20% failure rate). The micro-cracks measured 15-40 micrometers in length.

Dr. Whitfield stated that the micro-cracking was localized to the hinge points and would not affect drug elution performance because the cracks did not penetrate the full coating thickness. He recommended classifying the micro-cracks as "cosmetic" and adjusting the acceptance criteria to allow micro-cracks up to 50 micrometers at hinge points, provided the crack does not extend through the full polymer thickness.

Jessica Morales (Design Assurance) asked whether the micro-cracking could propagate under in-vivo conditions, particularly under cyclic loading from cardiac motion. Dr. Whitfield acknowledged this was a theoretical concern but stated that the accelerated fatigue testing (VT-042, not yet completed) would provide definitive data. The team agreed to proceed with the revised acceptance criteria pending VT-042 results.

**3. Regulatory Strategy Update (Sarah Nakamura)**

Sarah presented the 510(k) regulatory strategy. The Vanguard stent's primary predicate device is the Resolute Onyx DES (Medtronic), which uses a durable polymer with zotarolimus elution on a cobalt-chromium platform.

Sarah noted that the predicate comparison has "areas requiring additional supporting data" in three domains:

First, the drug-polymer system differs significantly — Vanguard uses a biodegradable polymer with everolimus versus the predicate's durable polymer with zotarolimus. Sarah explained that the team is building a "bridge argument" using published literature comparing everolimus and zotarolimus clinical outcomes to establish therapeutic equivalence without requiring a head-to-head clinical trial.

Second, the biodegradable polymer introduces a different long-term safety profile. The predicate's durable polymer remains on the stent permanently; Vanguard's polymer degrades over 12-18 months, leaving a bare metal surface. Sarah stated that this difference is being addressed through the biocompatibility testing program and that published long-term registry data on biodegradable polymer stents supports the safety profile.

Third, the stent strut geometry differs from the predicate — Vanguard uses thinner struts (60 micrometers vs. the predicate's 81 micrometers) which changes the mechanical performance profile. Sarah described this as a "design improvement" that published clinical data supports as beneficial for clinical outcomes.

Dr. Svensson asked whether the cumulative differences between Vanguard and the Resolute Onyx predicate might exceed the threshold for substantial equivalence, potentially requiring a PMA (Pre-Market Approval) pathway instead of 510(k). Sarah responded that the team's regulatory consultant had reviewed the comparison and believed the 510(k) pathway remained viable, provided the supporting data package was sufficiently robust. She acknowledged that FDA feedback on the pre-submission (Q-Sub) had been "directionally supportive but non-committal," and that the reviewers had asked for additional bench testing data on the polymer degradation safety profile.

**4. Biocompatibility Update (Dr. Priya Mehta)**

Dr. Mehta presented the biocompatibility testing status. The program follows ISO 10993 for biological evaluation of medical devices.

The initial biocompatibility testing battery included 14 test categories per ISO 10993-1 for a permanent implant with blood contact. Results to date:

Cytotoxicity, sensitization, irritation, acute systemic toxicity, and hemocompatibility testing have been completed and passed.

Genotoxicity testing (ISO 10993-3) was completed in two phases. Phase 1 (Ames test and in vitro chromosomal aberration) passed. Phase 2 (in vivo mouse micronucleus assay) showed an initial result that Dr. Mehta described as "equivocal" — the test article group showed a marginally elevated micronucleus frequency compared to the negative control, but the values fell within the historical control range of the testing laboratory. After consultation with the lab director and the toxicology consultant, the team determined that the result was consistent with normal biological variation and did not indicate a genotoxic response. The test was recorded as "pass with notation."

Dr. Mehta then noted that the biocompatibility testing scope had been "refined" based on the testing results to date and the available literature on L-605 cobalt-chromium alloys and biodegradable PLLA-based polymers. Specifically, the chronic toxicity study (ISO 10993-11, 26-week implantation) and the carcinogenicity assessment (ISO 10993-3) have been removed from the testing matrix and replaced with a literature-based justification, referencing published data from similar material combinations.

Dr. Mehta explained that this refinement was based on the principle that when sufficient published data exists for well-characterized materials, additional animal testing is not scientifically justified. She noted that the toxicology consultant supported this approach.

Anil Desai (QA) asked whether the removal of the chronic toxicity study was appropriate given that the biodegradable polymer introduces degradation byproducts that the literature on permanent implants would not address. Dr. Mehta responded that the PLLA degradation byproduct (lactic acid) is a well-characterized metabolite and does not warrant a dedicated chronic toxicity study. The discussion was tabled for offline follow-up.

**5. Clinical Strategy Update (Dr. Robert Kline)**

Dr. Kline presented the clinical strategy. The original clinical study protocol specified a primary endpoint of Target Lesion Failure (TLF) at 12 months, defined as cardiac death, target vessel myocardial infarction (TV-MI), or ischemia-driven target lesion revascularization (ID-TLR).

Dr. Kline explained that based on evolving clinical practice patterns and recent FDA guidance on coronary stent clinical studies, the team has revised the primary endpoint. The new primary endpoint is Target Lesion Failure at 12 months, with the TLF definition narrowed to exclude peri-procedural myocardial infarction (Type 4a MI) events that occur within 48 hours of the index procedure.

Dr. Kline stated that peri-procedural MI is increasingly recognized as a procedure-related event rather than a device-related event, and that excluding it from the TLF composite provides a "cleaner signal" of device performance. He noted that several recent PMA submissions for coronary stents have used similar endpoint definitions.

Dr. Svensson asked what effect this endpoint change would have on the expected event rate. Dr. Kline responded that excluding peri-procedural MI events would reduce the expected TLF rate from approximately 8.2% to approximately 5.8%, which would improve the statistical power of the study at the planned enrollment size.

No attendees raised objections to the endpoint revision.

**6. Manufacturing and Supply Chain (Thomas Brandt)**

Thomas reported that laser cutting process validation is complete with Cpk values exceeding 1.33 across all critical dimensions. The polymer spray-coating process is in IQ/OQ, with PQ scheduled for Q2. No supply chain issues are anticipated. Sterilization validation (EtO) is scheduled for May.

**7. Action Items**

| Action | Owner | Due Date |
|--------|-------|----------|
| Update VP-2026-003 to reflect revised VT-031 acceptance criteria | Dr. Whitfield | April 5 |
| Update VP-2026-003 to reflect revised VT-038 acceptance criteria | Dr. Whitfield | April 5 |
| Complete literature justification for chronic toxicity and carcinogenicity scope removal | Dr. Mehta | April 12 |
| Finalize 510(k) predicate comparison table with bridge arguments | S. Nakamura | April 19 |
| Update clinical protocol with revised TLF endpoint definition | Dr. Kline | April 10 |
| DHF documentation consolidation — target completion | K. Ostrowski | May 15 |
| Complete accelerated fatigue test VT-042 | Dr. Whitfield | April 30 |

**8. Next Design Review**

DR-3 scheduled for May 15, 2026. Gate criteria: all V&V complete, DHF current, 510(k) submission package ready for internal review.

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | Red (override from official Yellow) |
| Override Triggers Activated | V&V test failure reclassified to avoid design change (VT-031 and VT-038), 510(k) predicate equivalence questionable (3 major differences), biocompatibility scope narrowed after equivocal genotoxicity result, clinical endpoint adjusted to reduce event rate, DHF 60+ days behind |

### Expected Key Findings

1. **V&V Test Reclassification (VT-031 — Critical):** Radial strength retention test failed the original specification (76.3% vs. 80% required, with 3/15 samples below threshold). Rather than initiating a design change to address the failure, the team reclassified the acceptance criterion from pass/fail to "informational" and lowered the threshold from 80% to 75%. The original 80% threshold was derived from the predicate device's labeling claims. Changing the specification post-testing to match the actual results is a regulatory red flag that FDA reviewers are trained to detect.

2. **V&V Test Reclassification (VT-038 — Critical):** Polymer coating micro-cracking at hinge points in 20% of samples (4/20). Rather than investigating root cause or modifying the coating process, the team reclassified micro-cracks as "cosmetic" and widened the acceptance criteria. The decision to proceed was made before the fatigue test (VT-042) that would determine if cracks propagate under in-vivo conditions. This is a design risk accepted without supporting data.

3. **510(k) Predicate Stretching:** The Vanguard stent differs from its predicate (Resolute Onyx) in three fundamental ways: different drug, different polymer type (biodegradable vs. durable), and different strut geometry. Each difference individually might be supportable; collectively, they challenge substantial equivalence. The FDA's pre-submission feedback was "directionally supportive but non-committal" — which in regulatory language means the agency has concerns but has not yet committed to rejecting the approach. The risk of FDA requiring PMA instead of 510(k) would add 2-3 years and significant cost.

4. **Biocompatibility Scope Narrowing:** The chronic toxicity study and carcinogenicity assessment were removed from the testing matrix after the genotoxicity test produced an "equivocal" result. The QA manager's question about whether published literature on permanent implants adequately addresses biodegradable polymer degradation byproducts was tabled without resolution. Removing long-term safety studies after an ambiguous short-term result is the opposite of the expected regulatory response.

5. **Clinical Endpoint Adjustment:** The primary endpoint definition was narrowed to exclude peri-procedural MI, reducing the expected TLF rate from 8.2% to 5.8%. While this practice has precedent, the timing (after protocol development, during a study with existing enrollment plans) and the stated rationale ("cleaner signal") suggest the change is designed to improve the statistical appearance of the study rather than improve scientific rigor.

6. **DHF Documentation 60+ Days Behind:** The Design History File is described as undergoing a "consolidation exercise" with a 45-60 day backlog. A DHF that is not maintained contemporaneously raises questions about whether design controls were followed in real-time. The DR-3 gate criterion requires DHF currency — at the current rate, this is unlikely to be met by the May 15 target.

### Expected Questions (Calibration Reference)

1. **[Defensive/Accountability]:** Two verification tests failed their original specifications and were reclassified rather than triggering design changes. The radial strength threshold was lowered from 80% to 75% to match the actual test results, and polymer coating micro-cracking in 20% of samples was reclassified as "cosmetic." If an FDA reviewer asks why the acceptance criteria were changed after the tests were run — and they will — what documented engineering justification exists that predates the test results, and who approved proceeding without a formal design change order?

2. **[Strategic/Regulatory]:** The Vanguard stent differs from its Resolute Onyx predicate in drug substance, polymer permanence, and strut geometry. The FDA's pre-submission feedback was non-committal. If the agency determines during 510(k) review that these cumulative differences exceed substantial equivalence and requires a PMA, the program timeline extends by 2-3 years with clinical trial costs in the range of $30-50M. Has the organization modeled the probability of a PMA reclassification and does the board understand this as a binary risk to the program timeline?

3. **[Strategic/Patient Safety]:** The biocompatibility program removed the chronic toxicity study after a genotoxicity test produced an equivocal result, the clinical endpoint was narrowed to exclude events that would increase the apparent failure rate, and two mechanical performance tests were reclassified rather than addressed. Each decision individually has a defensible rationale. Taken together, they form a pattern of systematically lowering the evidence bar when results are unfavorable. If a post-market adverse event occurs and FDA conducts a retrospective review of the design controls, will this pattern withstand scrutiny — and has the organization's legal team reviewed the cumulative effect of these decisions on product liability exposure?
