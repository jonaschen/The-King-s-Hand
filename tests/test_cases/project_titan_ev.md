# Test Case: Project Titan-EV

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | TC-006 |
| Test Name | Yellow-to-Red Override — EV Battery Management System SoC |
| Primary Test Target | Functional safety (ISO 26262 ASIL-B) violation masked by firmware |
| Secondary Test Targets | Automotive OEM customer escalation, hardware-to-software blame transfer |
| Expected Status | 🔴 Red (override from official 🟡 Yellow) |
| Override Triggers | R1 (BMS cell balancing hardware defect, no HW fix path), R3 (firmware workaround violates ASIL-B timing requirement), R4 (BMW Tier-1 supplier escalation) |

---

## Simulated Input Documents

### Document 1: Weekly Status Report (Project Manager)

**Project:** Titan-EV — Battery Management System SoC (BMS MCU for 800V EV platform)
**Process Node:** TSMC 40nm Ultra-Low-Power (Automotive Grade)
**Phase:** Pre-Production Validation / Automotive Qualification
**Official Status:** 🟡 Yellow — "Minor calibration adjustments in progress"
**Report Date:** Week 10, 2026

**Executive Summary:**
Titan-EV automotive qualification is on track. AEC-Q100 Grade 0 stress testing completed successfully. The BMS firmware has achieved ISO 26262 ASIL-B compliance across all primary safety functions. Cell balancing accuracy meets the ±2mV specification at nominal temperature. The CAN FD communication stack passed all OBD-II and ISO 14229 (UDS) diagnostic protocol tests. Active thermal management and state-of-charge (SoC) estimation algorithms have been validated against HPPC (Hybrid Pulse Power Characterization) test data. Calibration adjustments to the cell voltage measurement subsystem are in progress to address minor accuracy variations at temperature extremes.

**Hardware Status:**
- AEC-Q100 Grade 0: all stress tests passed
- Cell voltage measurement: ±2mV accuracy at 25°C — meets spec
- Current sensor integration: calibrated and validated
- CAN FD transceiver: ISO 11898-2 compliant

**Software Status:**
- BMS firmware v2.3: ASIL-B compliant (per internal review)
- ISO 26262 ASIL-B safety case documentation: complete
- Cell balancing algorithm: validated at nominal conditions
- SoC estimation (Extended Kalman Filter): ±1.5% accuracy at 25°C

**Schedule:**
- AEC-Q100 qualification complete: Week 8 ✅
- ASIL-B functional safety audit (TÜV Rheinland): Week 14
- BMW Tier-1 supplier (Bosch) engineering sample delivery: Week 18
- Production intent release: Q3 2026

**Risks:**
- Cell voltage measurement accuracy at −40°C being characterized — calibration adjustment expected to resolve.
- No other material risks.

---

### Document 2: Jira Issue Tracker Extract

**Titan-EV Open Issues (as of Week 10):**

| Issue ID | Priority | Summary | Status | Assigned Team | Created | Days Open |
|----------|----------|---------|--------|---------------|---------|-----------|
| TV-1102 | High | Cell voltage ADC accuracy degrades to ±18mV at −40°C (spec: ±2mV) | In Progress | HW Analog / Firmware | Week 6 | 28 |
| TV-1118 | High | SoC estimation error increases to ±6.8% at −40°C (spec: ±2%) | In Progress | Algorithm | Week 7 | 21 |
| TV-1135 | Medium | CAN FD message latency 12ms at peak BMS load (ASIL-B budget: 10ms) | In Progress | Firmware / RTOS | Week 9 | 7 |

**Recently Closed (Last 45 Days):**

| Issue ID | Priority | Summary | Resolution |
|----------|----------|---------|------------|
| TV-1058 | Critical | Cell balancing IC reference voltage drift ±12mV across −40°C to +125°C temperature range | Closed — firmware temperature compensation table added (BSP v2.3) |
| TV-1067 | Critical | ADC voltage reference trimming instability — ±8mV noise floor at startup | Closed — software averaging filter added (64-sample moving average) |
| TV-1078 | High | Passive cell balancing switching causing ADC measurement interference — ±5mV injection noise | Closed — balancing suspended during ADC measurement window (firmware timing workaround) |
| TV-1091 | High | Bosch (BMW Tier-1 supplier) technical review: requested clarification on −40°C cell voltage accuracy | Closed — response sent; further characterization data to be provided |

---

### Document 3: Cross-Team Meeting Notes (Week 9)

**Attendees:** HW Analog Lead (Dr. Marcus Weber), Firmware Lead (Yuna Park), Safety Lead (Dr. Stefan Braun), Algorithm Lead (Chen Fang), Project Manager (Lisa Wong)

**Discussion:**

Dr. Marcus Weber (HW Analog): The cell balancing IC reference voltage drift is a silicon characteristic of this process node at −40°C. The ±12mV drift is within the foundry's datasheet tolerance but exceeds our system accuracy requirement. A hardware fix would require selecting a different reference IC, which means a board spin and re-qualification — approximately 14 weeks and $400K. We recommended firmware compensation as the path forward.

Yuna Park (Firmware): We've implemented a temperature compensation lookup table with 8 calibration points from −40°C to +125°C. It brings the accuracy to approximately ±4–6mV at −40°C. We cannot get to ±2mV at −40°C through software compensation — the underlying analog noise floor is too high.

Dr. Stefan Braun (Safety): I have a serious concern here. The ASIL-B safety case was written assuming ±2mV cell voltage accuracy. At ±4–6mV accuracy, the over-voltage and under-voltage protection thresholds lose their safety margin. For an 800V battery pack with 200+ cells in series, a ±6mV error per cell can mean the difference between a safe cutoff and a thermal runaway event under aggressive fast-charging conditions. I cannot sign off on the ASIL-B compliance with this accuracy degradation at −40°C.

Dr. Stefan Braun: Additionally, TV-1135 — the CAN FD message latency at 12ms — exceeds the 10ms ASIL-B safety function budget. This needs to be resolved before the TÜV audit.

Lisa Wong (PM): The Bosch delivery date is fixed. We cannot absorb 14 weeks for a board spin. Stefan, can you document the residual risk in the safety case and note that the system operates within ASIL-B at temperatures above −10°C?

Dr. Stefan Braun: That is not how ASIL-B works. AEC-Q100 Grade 0 certification covers −40°C to +125°C operation. I cannot limit the safety case to >−10°C operation on an automotive part that is specified for −40°C. If TÜV discovers this during the audit, they will issue a nonconformance finding.

Lisa Wong (PM): Let's continue characterizing and see if we can get closer to ±4mV before the audit.

---

### Document 4: Bosch Technical Escalation Email (Week 9)

**From:** Klaus Hartmann, Senior Technical Manager, Bosch Automotive Electronics
**To:** Nova-AP [sic] Program Office
**Subject:** Titan-EV — Outstanding Technical Questions Before Sample Commitment

"Team,

Following our Week 7 technical review, we have been waiting 3 weeks for the characterization data on Titan-EV cell voltage accuracy at −40°C. Our BMW BMS integration schedule requires finalized electrical characterization before we can commit to the engineering sample order (Week 18 target).

Specifically, we need:
1. Cell voltage accuracy specification at −40°C with firmware compensation — confirmed typical and worst-case values
2. ASIL-B safety case coverage for the full AEC-Q100 operating temperature range
3. Resolution of the CAN FD latency margin issue flagged in our Week 7 review

If we do not receive satisfactory answers by end of Week 11, we will need to evaluate alternative BMS IC suppliers to protect the BMW program timeline.

Best regards,
Klaus Hartmann"

---

### Document 5: Firmware Commit Log (BMS Repository, Weeks 6–10)

```
commit bm01aa2 — Week 6 — Y.Park — [BMS-FW] Add temperature compensation LUT for cell voltage ADC (8 calibration points)
commit bm02bb3 — Week 7 — Y.Park — [BMS-FW] Extend LUT to 16 calibration points — improve low-temp accuracy
commit bm03cc4 — Week 7 — Y.Park — [BMS-FW] Add 64-sample moving average filter for ADC noise reduction
commit bm04dd5 — Week 8 — Y.Park — [BMS-FW] Suspend passive balancing during ADC measurement windows to reduce injection noise
commit bm05ee6 — Week 8 — Y.Park — [BMS-FW] Add ASIL-B diagnostic self-test for compensation table validity
commit bm06ff7 — Week 9 — Y.Park — [BMS-FW] Attempt interpolation between LUT points to improve −40°C accuracy
commit bm07aa8 — Week 9 — Y.Park — [BMS-FW] Revert interpolation — introduces non-monotonic response below −35°C
commit bm08bb9 — Week 10 — Y.Park — [BMS-FW] Increase CAN FD task priority to reduce message latency
commit bm09cc0 — Week 10 — Y.Park — [BMS-FW] CAN latency still at 11ms after priority increase — further investigation needed
```

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | 🔴 Red (override from official 🟡 Yellow) |
| Override Triggers Activated | R1 (cell balancing IC reference voltage drift is a silicon characteristic, no firmware fix achieves ±2mV at −40°C), R3 (firmware workaround leaves ±4–6mV accuracy at −40°C, which safety lead has confirmed is insufficient for ASIL-B compliance on 800V pack), R4 (Bosch Tier-1 escalation with alternate supplier threat) |

### Expected Key Findings

1. **ASIL-B Compliance Failure at −40°C (Critical):** Cell voltage ADC accuracy at −40°C is ±4–6mV after firmware compensation (vs. ±2mV ASIL-B requirement). Safety lead Dr. Stefan Braun has formally stated he cannot sign off on ASIL-B compliance at this accuracy level. On an 800V pack with 200+ cells in series, this accuracy degradation directly endangers over-voltage/under-voltage protection thresholds under fast-charging conditions.

2. **Firmware Compensation Has Reached Its Limit:** The interpolation attempt (bm06ff7) was reverted because it introduces non-monotonic response below −35°C — a worse safety failure than the original inaccuracy. Firmware has exhausted its optimization space; accuracy is bounded by the analog noise floor.

3. **CAN FD Latency ASIL-B Violation:** CAN FD message latency of 11–12ms exceeds the 10ms ASIL-B safety function budget. Priority increase achieved partial improvement to 11ms — still non-compliant.

4. **TÜV Audit Exposure:** TÜV Rheinland audit is scheduled for Week 14 with two open ASIL-B compliance gaps: −40°C voltage accuracy and CAN FD latency. Safety lead has explicitly stated that TÜV will issue a nonconformance finding if these are not resolved.

5. **Bosch/BMW Escalation (Concealed):** Bosch has issued a written escalation (Week 9) explicitly stating they will evaluate alternate BMS IC suppliers if answers are not received by Week 11. The weekly report describes Bosch as an open characterization deliverable item, not a formal escalation.

### Expected Questions (Calibration Reference)

1. **[Defensive/Accountability]:** Safety lead Dr. Stefan Braun stated in the Week 9 meeting that he cannot sign off on ASIL-B compliance at ±4–6mV cell voltage accuracy at −40°C, and that limiting the safety case to >−10°C operation is not an acceptable approach for an AEC-Q100 Grade 0 automotive part. TÜV Rheinland's audit is in Week 14. Which of the two non-compliant items — voltage accuracy at −40°C, or CAN FD latency at 12ms — has a credible resolution path in the 4 weeks before the audit, and what is the plan for the other one when TÜV issues the nonconformance finding?

2. **[Strategic/Scale-Out]:** The cell balancing IC reference voltage drift of ±12mV across the AEC-Q100 temperature range is a silicon characteristic of the selected process node — not a firmware bug. The firmware compensation approach has reached its accuracy floor at ±4–6mV. If Titan-EV 2 (the next-generation BMS SoC for a 1000V platform) uses the same cell balancing IC or process node, this same accuracy limitation repeats at a higher system voltage where the safety margins are even tighter. Who owns the decision to evaluate an alternative reference IC for the next silicon revision, and has this characterization failure been formally reported to the IC vendor as a product feedback item?

3. **[Strategic/Ecosystem Moat]:** Bosch's BMW BMS integration is the reference design-win that positions Titan-EV across the European premium automotive BMS market. Bosch's Week 9 email explicitly states they will evaluate alternative suppliers if characterization data is not provided by Week 11, and the TÜV nonconformance risk suggests that even with data, the ASIL-B gap may not be closed in time. If Bosch commits to an alternate BMS IC supplier to protect the BMW program timeline — a decision that typically locks in a supplier for the 6-year production lifecycle — what is the total revenue exposure across all BMW-platform variants that Titan-EV was designed to serve, and has the business development team been briefed on the failure probability before Week 11?
