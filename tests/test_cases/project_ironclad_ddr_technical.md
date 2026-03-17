# Test Case: Project Ironclad-DDR (Highly Technical Input)

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | TC-012 |
| Test Name | Highly Technical Input — DDR5 PHY IP Verification Closure Report |
| Primary Test Target | Technical-only input handling: extract business risk from pure DV log with no PM narrative |
| Secondary Test Targets | No hallucination beyond provided data, commercial framing from technical evidence |
| Expected Status | 🟡 Yellow (formal verification timeouts on 3 assertions represent unresolved corner-case risk) |
| Override Triggers | Y2 (functional coverage 91.2% below 95% closure target), Y5 (3 formal verification timeouts accepted as waivers without root cause proof) |
| Available Evidence | Hardware verification closure report ONLY — no PM report, no Jira, no business context |

---

## Simulated Input Document

### Document 1: Design Verification Closure Report — ONLY DOCUMENT PROVIDED

**IP Block:** Ironclad-DDR — DDR5 PHY IP Block (LPDDR5X / DDR5-8800)
**Process Node:** TSMC 5nm
**DV Closure Report Version:** v2.1
**Report Date:** Week 11, 2026
**DV Sign-off Lead:** Dr. Kenji Watanabe

---

#### 1. Verification Coverage Summary

| Coverage Type | Target | Achieved | Status |
|---|---|---|---|
| Line Coverage | 100% | 98.4% | ⚠️ Waived |
| Branch Coverage | 100% | 97.1% | ⚠️ Waived |
| Functional Coverage (FSM states) | 100% | 99.8% | ✅ Met |
| Functional Coverage (protocol sequences) | 95% | 91.2% | ❌ Not Met |
| Formal Verification (property set A) | All pass | All pass | ✅ Met |
| Formal Verification (property set B — power domain crossing) | All pass | 3 timeout, remainder pass | ⚠️ Waived |
| X-propagation analysis | Clean | 2 unresolved X-sources | ⚠️ Waived |

**Waiver summary:** 5 waivers accepted. All waivers reviewed by DV lead and hardware architect. Waivers approved pending silicon characterization.

---

#### 2. Formal Verification Timeout Details

Three assertions in property set B (power domain crossing) exceeded the formal verification tool's 72-hour time budget and were not proven or disproven:

| Property ID | Description | Status | Disposition |
|---|---|---|---|
| FV-B-047 | PHY PLL lock handshake: no glitch on CLK_OUT during LP4→LP5 power state transition | Timeout | Waived — simulation regression passes (10,000 vectors) |
| FV-B-051 | DQS gating timing preservation across VDD domain crossing during self-refresh exit | Timeout | Waived — silicon measurement planned Week 14 |
| FV-B-058 | ZQ calibration completion flag synchronization: no metastability window | Timeout | Waived — bounded by design analysis (not formally proven) |

**DV lead note:** The three timed-out properties involve multi-cycle, multi-domain timing relationships that are computationally intractable for the formal engine within the time budget. Simulation-based coverage provides confidence but does not constitute formal proof. Acceptance of these waivers is conditional on Week 14 silicon characterization results.

---

#### 3. Unclosed Functional Coverage — Protocol Sequences

Functional coverage for protocol sequences reached 91.2% against the 95% target. Uncovered sequences are concentrated in two areas:

| Uncovered Area | Coverage | Description |
|---|---|---|
| Multi-rank interleaved refresh with concurrent ZQ calibration | 68% | Constrained random did not generate sufficient interleaved scenarios |
| LP5 ultra-low-power (ULP) mode exit under concurrent host read burst | 72% | Timing corner not reached in regression |

**DV lead note:** Both uncovered areas involve low-probability corner cases under combined stress conditions. Constrained random stimulus generation was extended from 4M to 12M cycles without improving coverage. Targeted directed tests have been written but have not yet closed coverage.

---

#### 4. X-Propagation Analysis

Two unresolved X-sources identified:

| X-Source ID | Location | Description | Disposition |
|---|---|---|---|
| XP-011 | DQS delay cell chain | Initialization value undetermined during reset — potential X-propagation to DQS output | Waived — gated during reset; no functional impact demonstrated |
| XP-022 | ZQ calibration result register | Multi-cycle update path: register value undefined for 1 clock cycle during update | Waived — firmware reads register only after update completion flag; functional analysis confirms no impact |

---

#### 5. Silicon Characterization Plan (Pending)

The following items are deferred to silicon characterization (Week 14):
- FV-B-051: DQS gating timing across domain crossing
- Multi-rank interleaved refresh corner case coverage
- LP5 ULP mode exit timing at −40°C temperature corner

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | 🟡 Yellow |
| Override Triggers | Y2 (functional coverage 91.2% vs 95% target — unclosed), Y5 (3 formal verification timeouts treated as waivers rather than proofs) |
| Critical requirement | The system must translate technical DV findings into business risk language without inventing PM-level context. Module 4 must note that commercial context (customer name, schedule, competitive pressure) is absent and cannot be assessed from this document. |

### Expected Key Findings (from DV report alone)

1. **Formal Verification Timeouts (Three Unproven Properties):** FV-B-047, FV-B-051, FV-B-058 all involve power domain crossing timing — the highest-risk class of digital timing bugs because they cause intermittent, temperature- and load-dependent failures that are difficult to reproduce in silicon validation. "Timeout" means the formal tool could neither prove nor disprove the properties. These are not proven safe — they are uncharacterized. Production silicon will be exposed to the conditions these properties cover.

2. **Functional Coverage Gap (91.2% vs 95%):** The uncovered scenarios — multi-rank interleaved refresh with concurrent ZQ calibration, and LP5 ULP mode exit under concurrent host burst — are precisely the scenarios that occur under real-world memory-intensive workloads. The DV team extended simulation from 4M to 12M cycles without closing coverage; directed tests have been written but not yet run to closure.

3. **ZQ Calibration Appears Twice:** ZQ calibration (impedance calibration) appears as a concern in FV-B-058 (metastability), XP-022 (X-propagation during update), and in the unclosed functional coverage area (interleaved refresh with concurrent ZQ). This clustering indicates the ZQ calibration logic is the highest-risk subblock in this IP.

4. **Commercial Context Absent:** No customer name, delivery schedule, product integration path, or competitive context is present in this document. The business risk of the above findings cannot be assessed without knowing what SoC this PHY IP is being integrated into, when tape-out is scheduled, and what memory performance targets the end product commits to.

### Expected Questions (Calibration Reference)

1. **[Defensive/Accountability]:** Three formal verification properties covering power domain crossing (FV-B-047, FV-B-051, FV-B-058) timed out and were waived — meaning they are neither proven safe nor proven unsafe. FV-B-051 (DQS gating timing during self-refresh exit) is deferred to Week 14 silicon characterization. Power domain crossing failures manifest as intermittent, temperature-dependent corruption that is notoriously difficult to reproduce. What is the mitigation plan if the Week 14 silicon characterization reveals a timing violation on any of these three properties — specifically, is there a design fix that can be applied via ECO without requiring a full re-spin?

2. **[Strategic/Scale-Out]:** The ZQ calibration subblock appears as a verification concern in three independent areas: formal verification timeout (FV-B-058, metastability on completion flag), X-propagation (XP-022, undefined register state during update), and functional coverage gap (multi-rank interleaved refresh with concurrent ZQ). This clustering indicates ZQ calibration is the highest-risk subblock in the PHY IP. If this IP block is planned for reuse across multiple SoC designs in the product roadmap, the three unresolved ZQ-related findings travel with it — what is the plan to formally close these before the IP is committed to the next design, rather than accumulating deferred verification debt across multiple tape-outs?

3. **[Strategic/Ecosystem Moat]:** This DV report does not identify the end product, customer, or tape-out schedule — context that is necessary to assess the commercial significance of the five accepted waivers. Which SoC program is integrating this DDR5 PHY IP, when is tape-out scheduled, and have the system-level integration team and the program's hardware architect reviewed these five waivers in the context of that program's memory performance specifications and customer commitments?
