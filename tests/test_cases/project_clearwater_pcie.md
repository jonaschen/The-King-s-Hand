# Test Case: Project Clearwater-PCIe

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | TC-008 |
| Test Name | Green-to-Yellow Override — PCIe Gen5 Storage Controller SoC |
| Primary Test Target | Hidden firmware workaround, sales/engineering disconnect on NVMe spec |
| Secondary Test Targets | Workaround detection, PPA quantification, corporate code word translation |
| Expected Status | 🟡 Yellow (override from official 🟢 Green) |
| Override Triggers | Y1 (NVMe command abort workaround not tested across temperature corners), Y7 (latency tail workaround PPA cost not disclosed in official report) |

---

## Simulated Input Documents

### Document 1: Weekly Status Report (Project Manager)

**Project:** Clearwater-PCIe — PCIe Gen5 x4 NVMe 2.0 Storage Controller SoC
**Process Node:** TSMC 5nm
**Phase:** Mass Production Readiness
**Official Status:** 🟢 Green — "On track for MP qualification"
**Report Date:** Week 8, 2026

**Executive Summary:**
Clearwater-PCIe is on track for mass production qualification in Q2 2026. PCIe Gen5 x4 host interface has been validated at 32 GT/s with full Gen5 equalization. NVMe 2.0 command set compliance testing passed 100% of the NVMe Compliance Test Suite (CTS) mandatory cases. Sequential read throughput achieves 14 GB/s (spec: 14 GB/s) and sequential write achieves 12 GB/s (spec: 12 GB/s). Random 4K IOPS target of 2.1M read IOPS and 1.9M write IOPS are met. Enterprise SSD qualification kits have been shipped to two Tier-1 NAND OEM partners (Samsung and SK Hynix). The firmware team has delivered BSP v4.0 with power management optimizations that reduce active power by 8%.

**Hardware Status:**
- PCIe Gen5 x4 SERDES: full speed validated, equalization tuned
- NVMe 2.0 controller logic: CTS mandatory compliance passed
- DRAM cache controller: validated at DDR4-3200
- Crypto engine: AES-XTS 256-bit at 14 GB/s validated

**Software Status:**
- NVMe firmware v4.0: production candidate
- PCIe firmware: Gen5 equalization coefficients finalized
- Power management: active power reduced 8% from previous release
- Error handling and recovery: hardened for enterprise reliability

**Schedule:**
- NVMe CTS full pass: Week 6 ✅
- Samsung and SK Hynix evaluation kit delivery: Week 7 ✅
- JEDEC reliability qualification: Week 14
- MP qualification: Week 18
- Revenue shipment: Q3 2026

**Risks:**
- None identified. All workstreams executing to plan.

---

### Document 2: Jira Issue Tracker Extract

**Clearwater-PCIe Open Issues (as of Week 8):**

| Issue ID | Priority | Summary | Status | Assigned Team | Created | Days Open |
|----------|----------|---------|--------|---------------|---------|-----------|
| CP-0881 | Medium | P99.9 read latency 2.8ms under sustained QD256 workload (enterprise target: <2.0ms) | In Progress | Firmware / NVMe Stack | Week 6 | 14 |
| CP-0892 | Medium | Power consumption in active idle 340mW (enterprise datasheet: <280mW) | In Progress | Power Mgmt | Week 7 | 7 |

**Recently Closed (Last 30 Days):**

| Issue ID | Priority | Summary | Resolution |
|----------|----------|---------|------------|
| CP-0845 | Critical | NVMe command abort race condition — host abort during active NAND operation causes controller lockup (1 in ~10,000 abort events) | Closed — firmware serialization workaround: abort handling made synchronous; NAND operations suspended during abort window |
| CP-0851 | High | PCIe Gen5 link recovery taking 180ms on first-boot equalization — enterprise requirement: <50ms | Closed — equalization coefficients pre-programmed in OTP; link recovery now 22ms |
| CP-0858 | High | Random 4K write IOPS drops 22% after 72-hour sustained write workload (write cliff) | Closed — garbage collection policy adjusted; write cliff onset deferred |
| CP-0866 | High | P99.9 latency 4.2ms at QD256 — exceeds enterprise target | Closed — latency shaping algorithm added; P99.9 now 2.8ms at QD256 |

---

### Document 3: Firmware Commit Log (NVMe Repository, Weeks 4–8)

```
commit cp1a2b3 — Week 4 — H.Tanaka — [NVMe-FW] Add abort serialization lock to prevent concurrent NAND access during host abort
commit cp2b3c4 — Week 4 — H.Tanaka — [NVMe-FW] Suspend active NAND reads/writes during abort window (max 12ms suspension)
commit cp3c4d5 — Week 5 — H.Tanaka — [NVMe-FW] Add abort timeout escalation — 30s max abort completion time
commit cp4d5e6 — Week 5 — H.Tanaka — [NVMe-FW] Latency shaping: add token bucket rate limiter for QD>128 to smooth P99.9
commit cp5e6f7 — Week 6 — H.Tanaka — [NVMe-FW] Tune latency shaping parameters — P99.9 reduced from 4.2ms to 2.8ms at QD256
commit cp6f7a8 — Week 6 — H.Tanaka — [NVMe-FW] Power mgmt: reduce cache DRAM refresh rate in active idle to lower idle power
commit cp7a8b9 — Week 7 — H.Tanaka — [NVMe-FW] Add background abort stress test — characterizing workaround robustness
commit cp8b9c0 — Week 8 — H.Tanaka — [NVMe-FW] Abort serialization: increase suspension window to 18ms for high-temperature operation
```

---

### Document 4: Enterprise Storage Customer Internal Benchmark (Samsung, Week 8)

**Confidential — Samsung Semiconductor Enterprise Storage**

Initial Clearwater-PCIe evaluation findings:

| Parameter | Datasheet | Measured |
|-----------|-----------|----------|
| Sequential Read | 14 GB/s | 14.1 GB/s ✅ |
| Sequential Write | 12 GB/s | 11.9 GB/s ✅ |
| Random 4K Read IOPS | 2.1M | 2.08M IOPS ✅ |
| Random 4K Write IOPS | 1.9M | 1.87M IOPS ✅ |
| P99.9 Read Latency (QD256) | Not specified | 2.8ms |
| Active Idle Power | <280mW | 338mW |
| Abort latency (with workaround) | Not specified | 12–18ms per abort |

**Samsung evaluation note:** P99.9 latency at 2.8ms and active idle power at 338mW (21% above datasheet) are concerns for our enterprise SSD product line. We will return formal feedback after completing temperature corner testing. Main specification metrics pass.

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | 🟡 Yellow (override from official 🟢 Green) |
| Override Triggers Activated | Y1 (abort serialization workaround not corner-case tested across full temperature range — commit cp8b9c0 shows suspension window increased at high temp, indicating temperature sensitivity), Y7 (P99.9 latency impact and active idle power overage not disclosed in official report) |
| Note | Not Red because main throughput and IOPS specs pass, NVMe CTS passed, no customer escalation yet — but two hidden workarounds with undisclosed PPA costs create Yellow-level commercial risk before JEDEC qualification |

### Expected Key Findings

1. **NVMe Abort Serialization Workaround (Hidden):** NVMe command abort race condition (CP-0845) caused controller lockup 1-in-10,000 abort events — a critical correctness bug. Firmware workaround serializes abort handling by suspending all active NAND operations for 12–18ms per abort event. PPA cost: every host-issued abort introduces up to 18ms of I/O stall across all queues — a significant P99 tail latency contribution under enterprise workloads with frequent abort traffic. The suspension window was extended from 12ms to 18ms at high temperature (commit cp8b9c0), indicating the hardware race condition worsens with temperature and the workaround has not been characterized across the full temperature range.

2. **Latency Shaping Workaround:** P99.9 latency at QD256 was 4.2ms; a token bucket rate limiter was added to shape latency to 2.8ms by throttling high-queue-depth requests. PPA cost: throughput is artificially rate-limited at QD>128, masking underlying performance limitations. The enterprise target of <2.0ms P99.9 is still not met — 2.8ms is 40% above target.

3. **Active Idle Power Overage:** Active idle power is 338mW vs. <280mW datasheet spec (+21%). The "8% active power reduction" cited in the official report is measured against a prior firmware release, not against the datasheet specification.

4. **Samsung Evaluation Gap:** Samsung's benchmark found the P99.9 and active idle power discrepancies. They will return with temperature corner results — where the abort serialization window expansion behavior is most likely to surface as a concern.

### Expected Questions (Calibration Reference)

1. **[Defensive/Accountability]:** The NVMe abort serialization workaround (CP-0845) suspends all active NAND I/O for up to 18ms per abort event to avoid a hardware race condition. Commit cp8b9c0 shows the suspension window was extended from 12ms to 18ms specifically for high-temperature operation, indicating the underlying hardware race condition worsens with temperature. Samsung is currently running temperature corner testing. What is the abort I/O stall behavior at 70°C and 85°C junction temperature, has this been characterized, and what is the plan if Samsung's temperature corner test reveals a suspension window longer than 18ms at high temperature that pushes P99.9 latency beyond enterprise qualification thresholds?

2. **[Strategic/Scale-Out]:** The NVMe abort race condition is a hardware controller logic defect that was resolved by a firmware serialization workaround that introduces up to 18ms of I/O stall per abort event. If Clearwater-PCIe 2 (targeting PCIe Gen6) inherits the same NVMe controller abort-handling logic, this race condition and its latency cost repeat in the next generation at higher speeds. Has the hardware team identified and scheduled a fix for the abort race condition in the next controller revision — and has anyone calculated the P99.9 latency impact of 18ms abort stalls in a PCIe Gen6 context where the expected P99.9 target is likely sub-1ms?

3. **[Strategic/Ecosystem Moat]:** The enterprise NVMe SSD market's primary selection differentiators are P99.9 latency and power efficiency — the exact two metrics where Clearwater-PCIe is currently out of spec (P99.9 2.8ms vs. 2.0ms target; idle power 338mW vs. 280mW spec). Samsung's evaluation kits are in-hand and temperature corner results are forthcoming. If Samsung's enterprise SSD product management team decides the P99.9 and power figures are not competitive with the current NVMe controller landscape and declines to qualify Clearwater-PCIe for their enterprise SSD lineup, what is the alternative path to enterprise market entry — and has product marketing modeled the scenario where Samsung qualifies only for consumer-tier products rather than enterprise?
