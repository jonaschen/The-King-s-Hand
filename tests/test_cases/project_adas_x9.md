# Test Case: Project ADAS-X9

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | TC-001 |
| Test Name | Yellow-to-Red Override — ADAS Automotive SoC |
| Primary Test Target | Status override accuracy (official Yellow → detected Red) |
| Secondary Test Targets | Workaround detection, PPA quantification, ASIL-D compliance risk identification |
| Expected Status | 🔴 Red (override from official 🟡 Yellow) |
| Override Triggers | R1 (critical HW bug, no HW fix path), R3 (workaround violates customer PPA spec), R8 (performance ≥15% below spec) |

---

## Simulated Input Documents

### Document 1: Weekly Status Report (Project Manager)

**Project:** ADAS-X9 — Automotive ADAS SoC (Level 2+ Autonomous Driving Platform)
**Process Node:** TSMC 5nm
**Phase:** Silicon Bring-up / Software Development
**Official Status:** 🟡 Yellow — "Software optimization in progress"
**Report Date:** Week 11, 2026

**Executive Summary:**
ADAS-X9 silicon bring-up is proceeding on schedule. First silicon received in Week 6, and all major IP blocks have been verified functional. The ISP and NPU subsystems have passed initial functional tests. Software optimization is in progress to maximize ISP-to-NPU data pipeline throughput. The AUTOSAR MCAL stack porting was completed this week, a significant milestone for our automotive platform credibility. Minor schedule adjustment applied to the software delivery timeline to accommodate additional performance tuning. European Tier-1 customer (Continental AG) design-in evaluation remains on track for Q3 2026.

**Hardware Status:**
- All IP blocks functional on first silicon
- ISP achieves target frame rate at 1080p
- NPU inference passes accuracy validation
- Power measurements within envelope at nominal workload

**Software Status:**
- BSP v2.1 released with ISP and NPU driver support
- AUTOSAR MCAL stack porting completed — CAN, SPI, ADC, GPIO drivers validated
- ISP-to-NPU data pipeline optimization ongoing — current throughput at 82% of target under peak multi-camera workload
- Exploring alternative software approaches for data path efficiency
- Boot time optimization ongoing (currently 3.2s, target 2.0s)

**Schedule:**
- Tape-out for production mask set: Week 26, 2026 (no change)
- Customer evaluation sample delivery: Week 30, 2026
- Minor schedule adjustment: software delivery shifted from Week 20 to Week 22

**Risks:**
- ISP-to-NPU throughput gap (18% below target) — mitigation: software optimization sprint in progress
- Boot time exceeds target — mitigation: bootloader team investigating parallel initialization

---

### Document 2: Jira Issue Tracker Extract

**ADAS-X9 Open Critical Issues (as of Week 11):**

| Issue ID | Priority | Summary | Status | Assigned Team | Created | Days Open |
|----------|----------|---------|--------|---------------|---------|-----------|
| X9-1847 | Critical | AXI bus bandwidth saturation under 4-camera ISP + NPU concurrent workload | Open | HW Platform / BSP | Week 7 | 28 |
| X9-1852 | Critical | ISP-to-NPU DMA transfer packet loss at >80% bus utilization | Open | BSP / HW Verification | Week 7 | 28 |
| X9-1901 | Critical | NPU inference throughput regression — 30 TOPS target, measuring 24.6 TOPS under real workload | Open | NPU Algorithm / BSP | Week 8 | 21 |
| X9-1923 | High | Data throttling workaround causing 340ms latency spike in object detection pipeline | Open | BSP | Week 9 | 14 |
| X9-1935 | High | ASIL-D real-time deadline violation — safety monitor triggered during throttled operation | Open | Safety / RTOS | Week 9 | 14 |
| X9-1948 | Medium | AUTOSAR MCAL CAN driver intermittent timeout on cold boot | Open | BSP / AUTOSAR | Week 10 | 7 |

**Recently Closed:**

| Issue ID | Priority | Summary | Resolution |
|----------|----------|---------|------------|
| X9-1800 | Critical | NPU clock tree PLL lock failure during DVFS transition | Closed — software PLL wait loop workaround applied |
| X9-1815 | High | ISP frame buffer DMA alignment error | Closed — header padding workaround in DMA driver |

---

### Document 3: Cross-Team Meeting Notes (Week 10)

**Attendees:** HW Platform Lead (Chen Wei), BSP Lead (Sarah Park), NPU Algorithm Lead (Raj Patel), RTOS Safety Lead (Thomas Mueller), Project Manager (David Liu)

**Discussion Summary:**

Chen Wei (HW Platform): The AXI bus bandwidth issue is an architectural limitation of the interconnect design. The ISP and NPU share the same AXI port to DDR, and under 4-camera workload, the combined bandwidth demand exceeds the port capacity by approximately 20%. A hardware fix would require a metal spin to add a dedicated AXI port for the NPU — estimated cost $2.8M and 8-week schedule impact.

David Liu (PM): A metal spin is not an option. We cannot absorb an 8-week delay. The customer delivery date is fixed. We need a software solution.

Sarah Park (BSP): We've implemented OS-level data throttling as a workaround. The ISP feed rate is capped at 80% of peak to prevent bus saturation. This resolves the packet loss issue but introduces latency spikes of 200-400ms in the NPU inference pipeline.

Raj Patel (NPU Algorithm): The throttling is killing our TOPS numbers. We committed 30 TOPS to Continental. We're now measuring 24.6 TOPS under real workload — that's an 18% gap. Our algorithm optimization cannot close this gap because the bottleneck is bus bandwidth, not compute efficiency.

Thomas Mueller (RTOS Safety): I need to flag a serious concern. The 340ms latency spike from throttling violates our ASIL-D real-time deadline of 100ms for the object detection safety path. During throttled operation, the safety monitor is triggering. This is not a minor issue — it means the system cannot maintain ASIL-D compliance under peak load.

David Liu (PM): Let's log the ASIL-D concern for further analysis. Sarah, please continue optimizing the throttling parameters. Raj, see if you can compensate on the algorithm side. We'll reassess in two weeks.

Sarah Park (BSP): For the record, I disagree with the approach. We're optimizing a workaround for an architectural flaw. The throttling cannot simultaneously solve the bandwidth problem AND meet ASIL-D timing. These are contradictory requirements.

David Liu (PM): Noted. Let's focus on what we can deliver and revisit in the next review cycle.

---

### Document 4: Git Commit Log Extract (BSP Repository, Weeks 8-11)

```
commit a3f7e2d — Week 8 — S.Park — [X9-BSP] Add AXI bus utilization monitor and data throttling framework
commit b8c1d44 — Week 8 — S.Park — [X9-BSP] Implement ISP feed rate limiter for NPU pipeline protection
commit c4e9f01 — Week 9 — S.Park — [X9-BSP] Tune throttling thresholds: cap ISP at 80% peak bandwidth
commit d2a6b78 — Week 9 — S.Park — [X9-BSP] Add emergency throttle escalation for bus saturation events
commit e1f3c89 — Week 9 — S.Park — [X9-RTOS] Extend safety monitor timeout from 100ms to 500ms (TEMPORARY — pending safety review)
commit f5d2a10 — Week 10 — S.Park — [X9-BSP] Revert safety monitor timeout change after safety team objection
commit a9b4c23 — Week 10 — R.Patel — [X9-NPU] Attempt algorithm-level compensation for throttled input rate
commit b7e8d56 — Week 10 — R.Patel — [X9-NPU] Revert algorithm compensation — no measurable improvement
commit c3f1a78 — Week 11 — S.Park — [X9-BSP] Refine throttling parameters — reduce latency spike to 280ms (was 400ms)
commit d6e2b90 — Week 11 — S.Park — [X9-BSP] PLL lock wait workaround for NPU clock tree (X9-1800)
```

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | 🔴 Red (override from official 🟡 Yellow) |
| Override Triggers Activated | R1 (AXI architectural flaw, no HW fix path), R3 (24.6 TOPS vs. 30 TOPS commitment = PPA spec breach), R8 (NPU performance 18% below committed 30 TOPS specification with no recovery plan) |

### Expected Key Findings

1. **AXI Bus Bandwidth Architectural Flaw (Critical):** The ISP and NPU share an AXI DDR port that is ~20% under-provisioned for the 4-camera workload. This is a silicon architecture defect, not a software optimization opportunity. The hardware team has confirmed the only fix is a metal spin ($2.8M, 8 weeks).

2. **Data Throttling Workaround — PPA Cost:** OS-level data throttling caps ISP feed rate at 80%. This workaround:
   - Reduces NPU throughput from 30 TOPS target to 24.6 TOPS (18% gap)
   - Introduces 280–400ms latency spikes in the object detection pipeline
   - Violates ASIL-D real-time deadline of 100ms
   - Debt classification: Systemic — affects all users of the AXI bus

3. **Safety Mechanism Compromise Attempt:** Commit e1f3c89 shows the BSP team temporarily extended the ASIL-D safety monitor timeout from 100ms to 500ms to suppress the violation alert. This was reverted after safety team objection, but the attempt indicates pressure to hide the safety compliance failure.

4. **Hardware-to-Software Blame Transfer:** The project manager explicitly rejected the metal spin option and directed the software team to "find a software solution" for a hardware architecture defect. The BSP lead's formal objection was noted but overridden.

5. **NPU Algorithm Team Dead End:** The NPU algorithm team attempted and reverted an algorithm-level compensation, confirming the bottleneck is hardware bandwidth, not software efficiency.

6. **Customer Commitment at Risk:** Continental AG was committed 30 TOPS. Current measurement is 24.6 TOPS — an 18% shortfall that cannot be closed by software.

### Expected Questions (Calibration Reference)

1. **[Defensive/Accountability]:** Who authorized classifying the OS-level data throttling as an "acceptable optimization path" for the ISP-to-NPU pipeline, knowing that it produces 280ms latency spikes that violate the ASIL-D 100ms real-time deadline — and what is the fallback plan if Continental AG's safety certification team rejects the throttled configuration?

2. **[Strategic/Scale-Out]:** The metal spin to add a dedicated NPU AXI port costs $2.8M and 8 weeks. If the throttling workaround ships and Continental discovers the 18% TOPS gap during their validation, the contract penalty exposure plus design-win loss is estimated at what amount — and has anyone presented this comparison to the hardware VP to force a cost-of-delay decision?

3. **[Strategic/Ecosystem Moat]:** The AUTOSAR MCAL stack completed this week is the core technical credential for positioning this platform as an NXP replacement in European Tier-1 automotive accounts. If Continental AG's safety certification team rejects the throttled configuration — which is the technically probable outcome given the ASIL-D violation — and publishes a qualification failure report, how long does the AUTOSAR MCAL competitive window remain open before NXP or a competing platform claims the European Tier-1 design-in pipeline that this asset was intended to capture, and is business development currently operating with knowledge of this failure probability?
