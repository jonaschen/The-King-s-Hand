# Test Case: Project GreenLight-Trap

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | TC-004 |
| Test Name | Pure Watermelon Effect — All-Green Report Concealing Crisis |
| Primary Test Target | Watermelon effect detection (official Green masking actual Red) |
| Secondary Test Targets | Corporate code word translation, cross-reference analysis, structural pattern detection |
| Expected Status | 🔴 Red (override from official 🟢 Green) |
| Override Triggers | R2 (two tape-out slips in 60 days), R4 (customer escalation from Tier-1), R6 (Green reported while ≥3 Red signals in data) |
| Detection Difficulty | High — the project manager has deliberately sanitized the weekly report |

---

## Simulated Input Documents

### Document 1: Weekly Status Report (Project Manager)

**Project:** Phoenix-5G — 5G Modem SoC (Sub-6 GHz + mmWave, Release 17)
**Process Node:** TSMC 4nm
**Phase:** Pre-Production Validation
**Official Status:** 🟢 Green — "On track for production release"
**Report Date:** Week 14, 2026

**Executive Summary:**
Phoenix-5G is executing well across all workstreams. The modem DSP subsystem has passed all protocol conformance tests for 3GPP Release 17. The RF front-end calibration is complete and meets sensitivity specifications. The power management subsystem has been optimized to meet the carrier-specified battery drain targets. Cross-team collaboration remains strong with weekly alignment sessions between the modem DSP, RF, and protocol stack teams. Customer engagement with MegaMobile (Tier-1 OEM) continues positively with regular technical exchanges.

The team successfully completed a comprehensive verification milestone this quarter, validating all critical signal paths. A minor schedule refinement was applied to the final validation phase to accommodate additional test coverage. The firmware team has delivered excellent quality — defect density is at an all-time low for this project stage.

**Hardware Status:**
- Modem DSP: all protocol conformance tests passed
- RF front-end: calibration complete, sensitivity within spec
- Power management: optimized for carrier battery drain targets
- DDR PHY: training sequence validated across all temperature corners

**Software Status:**
- Protocol stack v4.2: 3GPP Release 17 feature complete
- Modem firmware: defect density at 0.3/KLOC (team best)
- Power management firmware: optimization finalized
- RF calibration software: production-ready

**Schedule:**
- Final validation complete: Week 16
- Carrier certification submission: Week 18
- Customer (MegaMobile) engineering sample delivery: Week 22
- Mass production: Q4 2026

**Risks:**
- No material risks. All workstreams are executing to plan.

---

### Document 2: Jira Issue Tracker Extract

**Phoenix-5G Open Issues (as of Week 14):**

| Issue ID | Priority | Summary | Status | Assigned Team | Created | Days Open |
|----------|----------|---------|--------|---------------|---------|-----------|
| PH-3301 | Medium | Carrier-specific IMS registration timeout on T-Mobile network | In Progress | Protocol Stack | Week 12 | 14 |
| PH-3315 | Medium | mmWave beam tracking latency 12ms (target: <10ms) | In Progress | Modem DSP | Week 13 | 7 |
| PH-3320 | Low | OTA firmware update size optimization — 18MB (target: <15MB) | Open | Firmware | Week 14 | 1 |

**Recently Closed (Last 60 Days):**

| Issue ID | Priority | Summary | Resolution | Closed |
|----------|----------|---------|------------|--------|
| PH-3102 | Critical | 5G NR handover failure between Sub-6 and mmWave — call drop rate 8% | Closed — firmware retry and state machine workaround | Week 6 |
| PH-3115 | Critical | Modem DSP thermal throttling under sustained 5G NR CA — throughput drops 40% | Closed — DVFS profile adjusted, power budget reallocated | Week 7 |
| PH-3128 | Critical | Baseband processor lockup during VoNR call + data simultaneous load | Closed — watchdog timeout extended to prevent false resets | Week 8 |
| PH-3145 | Critical | RF PA (Power Amplifier) linearity failure at max TX power — EVM spec breach | Closed — TX power backed off by 1.5dB via firmware | Week 9 |
| PH-3160 | High | Carrier aggregation (CA) scheduling conflict — DL throughput 15% below spec | Closed — accepted as known limitation; SW optimization ongoing | Week 10 |
| PH-3175 | High | Power consumption exceeds carrier battery drain target by 22% in connected standby | Closed — modem sleep timer aggressiveness increased | Week 10 |
| PH-3190 | High | Protocol stack crash during inter-RAT handover (5G→LTE fallback) | Closed — exception handling added | Week 11 |
| PH-3210 | Critical | Tape-out schedule review: final mask set date moved from Week 10 to Week 14 | Closed — schedule updated | Week 10 |
| PH-3225 | Critical | Tape-out schedule review: final mask set date moved from Week 14 to Week 18 | Closed — schedule updated | Week 13 |
| PH-3240 | High | MegaMobile engineering escalation: prototype sample delivery delayed from Week 18 to Week 22 | Closed — customer notified | Week 12 |

---

### Document 3: Customer Communication Extract

**Email from MegaMobile VP of Hardware Engineering (Week 13):**

Subject: RE: Phoenix-5G Sample Delivery Timeline — URGENT

"Team,

This is the second delay notification we've received in 6 weeks. The original commitment was Week 18 delivery, which was already a revision from the initial Week 14 date. Now you're asking for Week 22.

Our Galaxy-Next flagship has a carrier certification window that closes in Week 30. If we don't have validated engineering samples by Week 22 at the latest, we cannot complete our integration testing in time. I have already initiated contact with [COMPETITOR REDACTED] as a contingency.

I need a firm commitment — not another 'minor schedule adjustment' — by end of this week. Our CPO is asking whether to trigger the alternate sourcing clause in our supply agreement.

Regards,
James Park
VP Hardware Engineering, MegaMobile"

---

### Document 4: Engineering Metrics Dashboard (Internal)

**Phoenix-5G — Build Health Metrics (Weeks 5-14):**

| Metric | Week 5 | Week 8 | Week 11 | Week 14 | Trend |
|--------|--------|--------|---------|---------|-------|
| Open Critical Bugs | 6 | 8 | 4 | 0 | ↓ Improving |
| Closed Critical Bugs (cumulative) | 2 | 5 | 12 | 16 | ↑ High closure rate |
| Test Coverage (%) | 72% | 74% | 75% | 76% | → Plateau |
| Regression Test Pass Rate | 94% | 91% | 88% | 86% | ↓ Degrading |
| Firmware Size (MB) | 12.4 | 14.1 | 16.8 | 18.3 | ↑ Bloating |
| Workaround Count in Codebase | 3 | 7 | 11 | 14 | ↑ Accelerating |
| Defect Density (per KLOC) | 0.8 | 0.6 | 0.4 | 0.3 | ↓ Improving (but...) |

**Note on metrics:** The "improving" defect density is misleading. Defect density = open bugs / lines of code. The denominator (code size) is growing rapidly due to workaround additions, which makes the ratio look better while quality is actually degrading. The regression pass rate decline from 94% to 86% is the more honest quality signal.

---

### Document 5: Git Commit Log Pattern Analysis (Weeks 8-14)

**Commit category breakdown (154 commits total):**

| Category | Count | % of Total |
|----------|-------|------------|
| Workaround / patch / bypass | 41 | 27% |
| Exception handling additions | 23 | 15% |
| Retry logic additions | 18 | 12% |
| Feature development | 32 | 21% |
| Test additions | 12 | 8% |
| Bug fixes (root cause) | 15 | 10% |
| Documentation / cleanup | 13 | 8% |

**Selected commits of concern:**

```
commit p3a1b2c — Week 8 — [PH-FW] Extend watchdog timeout from 2s to 8s to suppress reset during VoNR+data load
commit p4b2c3d — Week 9 — [PH-RF] Back off PA TX power by 1.5dB to meet EVM spec — firmware-level power control override
commit p5c3d4e — Week 9 — [PH-FW] Add handover state machine retry with 3-attempt recovery sequence
commit p6d4e5f — Week 10 — [PH-FW] Increase modem sleep timer aggressiveness to reduce connected standby power
commit p7e5f6a — Week 10 — [PH-FW] Accept CA scheduling limitation — cap DL throughput expectation in driver
commit p8f6a7b — Week 11 — [PH-FW] Add exception handler for inter-RAT handover crash — catch and restart protocol stack
commit p9a7b8c — Week 12 — [PH-FW] Disable mmWave beam tracking during thermal throttle event to prevent DSP overload
commit q1b8c9d — Week 13 — [PH-FW] Add firmware retry for 5G NR registration failure on T-Mobile network
commit q2c9d0e — Week 14 — [PH-FW] Workaround for DL throughput fluctuation — add moving average filter to mask jitter
```

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | 🔴 Red (override from official 🟢 Green) |
| Override Triggers Activated | R2 (two tape-out date slips: Week 10→14, Week 14→18 = two slips in ~4 weeks), R4 (MegaMobile Tier-1 escalation with alternate sourcing threat), R6 (official Green while ≥3 Red signals present) |

### Expected Key Findings

1. **Watermelon Effect Confirmed:** The project manager reports 🟢 Green with "no material risks." The data reveals: two tape-out slips in 4 weeks, a Tier-1 customer escalation threatening alternate sourcing, 14 workarounds in the codebase, declining regression test pass rates, and at least 4 closed critical hardware bugs resolved only through firmware workarounds. This is a textbook watermelon project.

2. **Serial Tape-Out Slippage (Hidden):** The tape-out date has slipped twice in rapid succession — from Week 10 to Week 14, then from Week 14 to Week 18. Both slips were closed in Jira as administrative schedule updates, not flagged as risks. The weekly report describes only a "minor schedule refinement."

3. **Customer Escalation (Concealed):** MegaMobile's VP of Hardware Engineering sent an urgent email in Week 13 explicitly threatening to trigger an alternate sourcing clause. The weekly report describes customer engagement as "positive with regular technical exchanges." This is a direct misrepresentation.

4. **Workaround Accumulation (14 workarounds):**
   - Handover retry workaround (PH-3102): masks 5G NR handover failure, adds non-deterministic call setup latency
   - Watchdog timeout extension (PH-3128): extends timeout from 2s to 8s — weakens safety recovery mechanism
   - TX power backoff (PH-3145): RF PA linearity failure compensated by 1.5dB TX power reduction — reduces cell edge coverage and uplink throughput
   - Sleep timer aggressiveness (PH-3175): reduces connected standby power but may increase paging miss rate — carrier certification risk
   - CA throughput limitation acceptance (PH-3160): DL throughput 15% below spec accepted as "known limitation" — customer expectation gap
   - Combined PPA impact: TX power -1.5dB (coverage reduction), DL throughput -15%, connected standby still potentially above carrier target, system watchdog safety margin reduced by 4×

5. **Quality Metrics Deception:** The "defect density at all-time low" (0.3/KLOC) is misleading. Code size grew from 12.4MB to 18.3MB (+48%) primarily from workaround additions, inflating the denominator. Meanwhile, regression test pass rate declined from 94% to 86% — indicating that workarounds are introducing new failures faster than they are being resolved.

6. **Test Coverage Plateau:** Test coverage has stalled at 72-76% across 10 weeks. With 14 workarounds in the codebase and declining regression pass rates, the untested 24% of the codebase likely contains the highest-risk code paths.

### Expected Questions (Calibration Reference)

1. **[Defensive/Accountability]:** MegaMobile's VP has explicitly threatened to invoke the alternate sourcing clause, and the project has slipped the tape-out date twice in four weeks. The weekly report to Henry says "Green — no material risks." Who approved this status classification, and can they explain — in front of MegaMobile's CPO — how two tape-out slips, a customer escalation, and 14 firmware workarounds constitute "no material risks"?

2. **[Strategic/Scale-Out]:** The Phoenix-5G firmware now contains 14 workarounds that collectively reduce TX power by 1.5dB, cap DL throughput 15% below spec, extend the watchdog timeout by 4×, and mask handover failures with retry logic. If the Phoenix-6G modem inherits this firmware base — which is the current plan — what is the projected engineering cost to remove, replace, or harden these workarounds, and has anyone assessed whether the workaround-laden firmware architecture can support Release 18 features?

3. **[Strategic/Ecosystem Moat]:** The 5G modem market is a three-player race. If MegaMobile triggers alternate sourcing and publishes a qualification failure report internally — which Tier-1 OEMs routinely share across procurement teams — what is the revenue exposure across the entire modem product line, not just the Phoenix-5G SKU?
