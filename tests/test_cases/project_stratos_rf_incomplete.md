# Test Case: Project Stratos-RF (Incomplete Input)

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | TC-011 |
| Test Name | Incomplete Input — Private 5G RF Transceiver SoC |
| Primary Test Target | Incomplete input handling: useful output from weekly report only, explicit evidence gaps flagged |
| Secondary Test Targets | No hallucination, corporate code word detection from limited data |
| Expected Status | 🟡 Yellow (suspected, based on PM report code words alone) |
| Override Triggers | Y4 (schedule slip without root cause), Y7 (PPA impact of calibration workaround suspected but unconfirmed without Jira/commits) |
| Available Evidence | Weekly PM report ONLY — no Jira, no Git commits, no meeting notes, no internal engineering reports |

---

## Simulated Input Document

### Document 1: Weekly Status Report (Project Manager) — ONLY DOCUMENT PROVIDED

**Project:** Stratos-RF — Direct-Conversion RF Transceiver SoC (Sub-6 GHz, Private 5G NR)
**Process Node:** GlobalFoundries 12LP+
**Phase:** Silicon Bring-up / RF Calibration
**Official Status:** 🟢 Green — "RF bring-up proceeding well"
**Report Date:** Week 8, 2026

**Executive Summary:**
Stratos-RF silicon bring-up is proceeding well. First silicon was received in Week 4 and initial power-on was successful. The digital baseband subsystem is functional and the PLL has locked successfully. RF transmit chain calibration is ongoing with the team making steady progress. Some additional characterization work is being performed to optimize the receive chain noise figure. Alternative calibration approaches are being explored to improve the RF front-end linearity performance. The firmware team has been engaged to support calibration algorithm development. A minor schedule adjustment has been applied to the RF validation timeline to accommodate the additional characterization work. Customer engagement with PrivateNet Systems (enterprise private 5G infrastructure provider) continues with their integration timeline aligned to our Q2 delivery target.

**Hardware Status:**
- Digital baseband: functional
- PLL: locked successfully
- TX chain: calibration ongoing
- RX chain: noise figure characterization in progress

**Software Status:**
- RF calibration firmware: development ongoing
- Baseband driver: integration with RF front-end in progress

**Schedule:**
- RF calibration complete: Week 12 (revised from Week 10)
- PrivateNet Systems integration evaluation: Week 16
- Customer delivery: Q2 2026

**Risks:**
- RF front-end linearity optimization in progress — team confident in resolution.

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | 🟡 Yellow (suspected — limited to single-document evidence) |
| Evidence Confidence | Suspected, not confirmed — no Jira, no commit log, no meeting notes |
| Critical requirement | The output MUST open Module 3 with an explicit evidence inventory paragraph identifying what is missing and what it would reveal |

### Expected Key Findings (from weekly report alone)

1. **Corporate Code Words Detected (Suspected):**
   - "Alternative calibration approaches being explored" → probable translation: RF front-end linearity defect found; compensation algorithm development forced
   - "Additional characterization work to optimize noise figure" → probable translation: RX noise figure not meeting specification
   - "Minor schedule adjustment" → probable translation: 2-week RF validation slip (Week 10 → Week 12)
   - "Firmware team engaged to support calibration algorithm development" → probable translation: RF performance problem requiring software compensation

2. **Structural Signals (Suspected):**
   - Schedule slipped 2 weeks without root cause stated in the report
   - No specification values cited for TX linearity or RX noise figure — no comparison against targets possible from this document alone
   - "Team confident in resolution" with no technical basis provided

3. **What Cannot Be Determined Without Missing Evidence:**
   - Specific Jira issues (cannot confirm any open critical bugs)
   - Git commit patterns (cannot confirm workaround accumulation)
   - Meeting notes (cannot confirm team-level disagreements or blame transfers)
   - Internal RF measurement data (cannot quantify noise figure or linearity gap)

### Hallucination Guard (What the System Must NOT Do)

- Must NOT invent specific bug IDs, commit hashes, or engineering measurements not in the document
- Must NOT state specific dB values for noise figure or linearity degradation (no data provided)
- Must NOT claim a specific hardware defect has been confirmed (only suspected from code words)
- Must NOT cite a specific PPA cost for any workaround (measurement data absent)

### Expected Questions (Calibration Reference)

1. **[Defensive/Accountability]:** The weekly report states "alternative calibration approaches are being explored" for RF front-end linearity performance, and the RF validation timeline has slipped 2 weeks — but no specification target is cited and no measurement data is provided. Before the review meeting, can you provide: (a) the TX linearity specification target (EVM, adjacent channel power ratio, or equivalent), (b) the current measured value, and (c) a technical explanation of why a software calibration approach can close the gap rather than a hardware RF front-end modification?

2. **[Strategic/Scale-Out]:** If the RF front-end linearity limitation is a silicon characteristic of the GF 12LP+ process variant (as the "exploring alternative approaches" language suggests), and the calibration firmware developed to compensate it becomes a permanent part of the BSP, how does this affect the portability of the Stratos-RF calibration stack to derivative products — and has the hardware team assessed whether the linearity limitation is process-related or design-related, since the former affects all future GF 12LP+ designs?

3. **[Strategic/Ecosystem Moat]:** PrivateNet Systems' Q2 integration timeline is synchronized to our delivery target. The RF validation slip of 2 weeks (Week 10 → Week 12) leaves 4 weeks of buffer before their Week 16 integration evaluation. What is PrivateNet's flexibility if a second schedule revision is required — and has anyone assessed whether a delayed or underperforming private 5G modem opens a window for competitors (e.g., Qualcomm FSM, MediaTek T800) to be evaluated by PrivateNet as an alternative?
