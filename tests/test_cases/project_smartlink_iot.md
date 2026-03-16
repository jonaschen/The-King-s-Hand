# Test Case: Project SmartLink-IoT

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | TC-002 |
| Test Name | Green-to-Yellow Override — Ultra-Low-Power Wireless IoT SoC |
| Primary Test Target | Status override accuracy (official Green → detected Yellow) |
| Secondary Test Targets | Hidden workaround detection, PPA quantification, sales/engineering disconnect |
| Expected Status | 🟡 Yellow (override from official 🟢 Green) |
| Override Triggers | Y1 (workaround not corner-case tested), Y7 (workaround PPA cost not quantified in report) |

---

## Simulated Input Documents

### Document 1: Weekly Status Report (Project Manager)

**Project:** SmartLink-IoT — Ultra-Low-Power Wireless SoC (BLE 5.3 + Matter + Wi-Fi HaLow)
**Process Node:** TSMC 22nm ULP
**Phase:** Mass Production Readiness
**Official Status:** 🟢 Green — "On track for MP release"
**Report Date:** Week 12, 2026

**Executive Summary:**
SmartLink-IoT is on track for mass production release in Q2 2026. Hardware verification has been completed successfully — all 147 test vectors passed. The firmware team has delivered BSP v3.0 with full connectivity stack support including BLE 5.3, Matter protocol, and Wi-Fi HaLow. Customer evaluation kits shipped to 12 design-in partners last week. Product marketing has updated the datasheet with the confirmed specifications. Manufacturing test programs are validated and yield targets are being met. This is a clean project with strong commercial momentum.

**Hardware Status:**
- Silicon verification complete — all test vectors passed
- Yield at 94.2% (target: >92%)
- Package qualification complete
- ESD/latchup certification passed

**Software Status:**
- BSP v3.0 released — production candidate
- BLE 5.3 stack certified by Bluetooth SIG
- Matter protocol interoperability validated with 8 ecosystem partners
- Wi-Fi HaLow range test passed at 1km (spec: >800m)
- Firmware stability improvements applied for edge-case Bluetooth baseband behavior
- Power management optimizations finalized

**Schedule:**
- Mass production release: Week 18, 2026 (on track)
- First customer shipment (Acme Smart Home): Week 20, 2026
- Revenue recognition target: Q3 2026

**Key Specification (from datasheet):**
- Standby power: <8µA (button cell battery, >2 year life)
- BLE 5.3 advertising: 12µA average
- Active Wi-Fi HaLow: 45mA peak
- Deep sleep: 1.2µA

**Risks:**
- None identified. Project is executing to plan.

---

### Document 2: Jira Issue Tracker Extract

**SmartLink-IoT Open Issues (as of Week 12):**

| Issue ID | Priority | Summary | Status | Assigned Team | Created | Days Open |
|----------|----------|---------|--------|---------------|---------|-----------|
| SL-0412 | Medium | BLE connection interval negotiation suboptimal with Apple devices | In Progress | Connectivity | Week 10 | 14 |
| SL-0418 | Low | Matter commissioning flow takes 15s (target: <10s) | Open | Connectivity | Week 11 | 7 |

**Recently Closed (Last 30 Days):**

| Issue ID | Priority | Summary | Resolution |
|----------|----------|---------|------------|
| SL-0389 | Critical | Bluetooth baseband wake-up timer precision error — 15% deviation from nominal | Closed — firmware polling workaround applied (BSP v3.0) |
| SL-0391 | High | Deep sleep exit failure when BLE advertising active — system does not wake on timer interrupt | Closed — GPIO polling wake-up implemented as alternative (BSP v3.0) |
| SL-0395 | High | Standby current measured at 10.1µA (spec: <8µA) after wake-up workaround | Closed — "within engineering tolerance; spec under review" |
| SL-0398 | Medium | Exception handling additions for baseband timer edge cases causing 4KB firmware size increase | Closed — accepted in BSP v3.0 |

---

### Document 3: Firmware Commit Log Extract (BSP Repository, Weeks 8-12)

```
commit 7a2f3e1 — Week 8 — J.Kim — [SL-FW] Add exception handler for BT baseband wake timer deviation >10%
commit 8b3c4d2 — Week 8 — J.Kim — [SL-FW] Implement GPIO polling wake as fallback for HW timer interrupt failure
commit 9c4d5e3 — Week 8 — J.Kim — [SL-FW] Set GPIO polling interval to 100ms for wake-up reliability
commit 1d5e6f4 — Week 9 — J.Kim — [SL-FW] Add BLE baseband timer calibration routine at each wake cycle
commit 2e6f7a5 — Week 9 — J.Kim — [SL-FW] Increase polling frequency — reduce interval from 100ms to 50ms after field test failures
commit 3f7a8b6 — Week 9 — J.Kim — [SL-FW] Handle corner case: BT baseband timer stuck at zero after deep sleep exit
commit 4a8b9c7 — Week 10 — J.Kim — [SL-FW] Add watchdog recovery for baseband timer hang condition
commit 5b9c0d8 — Week 10 — J.Kim — [SL-FW] Power measurement adjustment — update standby power model for GPIO polling
commit 6c0d1e9 — Week 11 — J.Kim — [SL-FW] Optimize polling wake duty cycle — reduce average standby current
commit 7d1e2f0 — Week 11 — J.Kim — [SL-FW] Finalize BSP v3.0 — production candidate release
commit 8e2f3a1 — Week 12 — J.Kim — [SL-FW] Post-release patch: fix rare double-wake from GPIO polling race condition
```

---

### Document 4: Product Datasheet (Current Published Version)

**SmartLink-IoT — Ultra-Low-Power Wireless SoC**
**Datasheet Version:** v2.1 (published Week 10, 2026)

**Key Power Specifications:**

| Parameter | Condition | Min | Typ | Max | Unit |
|-----------|-----------|-----|-----|-----|------|
| Deep Sleep Current | All peripherals off, RTC active | — | 1.2 | 2.0 | µA |
| Standby Current | BLE advertising, 1s interval | — | 8.0 | 12.0 | µA |
| BLE Active TX | 0dBm output | — | 5.2 | 7.0 | mA |
| Wi-Fi HaLow Active | TX at MCS0 | — | 45 | 55 | mA |

**Product Positioning (from datasheet intro):**
"SmartLink-IoT delivers industry-leading standby power consumption of <8µA typical, enabling button-cell-powered IoT devices with >2 year battery life. Designed for smart home, industrial sensor, and asset tracking applications where ultra-long battery life is the primary selection criterion."

---

### Document 5: Internal Power Measurement Report (Engineering, Week 11)

**Confidential — Engineering Use Only**

| Parameter | Spec Target | Pre-Workaround (Week 7) | Post-Workaround (Week 11) | Delta |
|-----------|-------------|------------------------|--------------------------|-------|
| Deep Sleep | 1.2µA typ | 1.1µA | 1.3µA | +18% |
| Standby (BLE adv) | 8.0µA typ | 7.8µA | 10.1µA | +29% |
| BLE Active TX | 5.2mA typ | 5.1mA | 5.3mA | +4% |
| GPIO Polling Overhead | N/A | 0µA | 2.1µA continuous | New |

**Engineering Note:** The GPIO polling wake-up workaround adds ~2.1µA continuous overhead due to periodic wake/sleep cycling. This moves the standby current from 7.8µA (within spec) to 10.1µA (above the 8.0µA typical spec, but within the 12.0µA max spec). The change was accepted by the project manager under the rationale that "max spec is still met."

**Battery Life Impact Estimate:**
- Original design target: 2.4 years on CR2032 (230mAh) at 1s BLE advertising
- With GPIO polling overhead: 1.9 years on CR2032
- Delta: -6 months battery life (-21%)

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | 🟡 Yellow (override from official 🟢 Green) |
| Override Triggers Activated | Y1 (GPIO polling workaround not tested across full PVT range), Y7 (PPA cost of workaround not disclosed in official report) |
| Note | Not Red because the product can still ship (max spec met), but not Green because the core product promise (ultra-low-power, >2yr battery) is materially compromised |

### Expected Key Findings

1. **Bluetooth Baseband Wake-Up Timer Defect (Hidden):** The hardware has a 15% timer precision error that causes deep sleep wake-up failures. This is a silicon defect masked by a firmware GPIO polling workaround. The official weekly report describes this as "firmware stability improvements" and "power management optimizations."

2. **GPIO Polling Wake Workaround — PPA Cost:**
   - Standby power increased from 7.8µA to 10.1µA (+29%)
   - Battery life reduced from 2.4 years to 1.9 years on CR2032 (-21%, ~6 months)
   - Debt classification: Architectural contamination — the entire power management model is compromised
   - The workaround polling interval was already tightened from 100ms to 50ms due to field test failures, indicating the hardware defect is worse than initially assessed

3. **Sales/Engineering Disconnect:** The product datasheet (v2.1, published Week 10) still lists standby power as "8.0µA typical." The engineering measurement shows 10.1µA. 12 customer evaluation kits have been shipped with marketing materials citing the original spec. The sales team is pitching ">2 year battery life" when the actual battery life is ~1.9 years.

4. **Jira Issue Closure Pattern:** SL-0395 (standby current at 10.1µA, above spec) was closed with "within engineering tolerance; spec under review" — the spec was not actually reviewed or updated. The published datasheet still uses the original number.

5. **Commit Pattern Red Flag:** 11 commits in 4 weeks from a single engineer (J.Kim) focused on Bluetooth baseband workarounds — including corner cases, polling frequency increases, and a post-release race condition fix. This volume and pattern indicates a hardware defect more serious than acknowledged.

### Expected Questions (Calibration Reference)

1. **[Defensive/Accountability]:** The published datasheet promises <8µA standby and >2 year battery life on CR2032. Engineering measurements show 10.1µA standby and 1.9 year battery life. 12 evaluation kits have been shipped to customers with the original spec. What percentage of the $14M committed order pipeline survives when customers run their own power measurements and discover a 25%+ gap from the datasheet?

2. **[Strategic/Scale-Out]:** The Bluetooth baseband wake-up timer defect is baked into this silicon. Is the hardware team planning to fix the timer precision in the next silicon revision (SmartLink-IoT v2), or is J.Kim's GPIO polling workaround expected to be maintained permanently across all derivative products — and has anyone calculated the cumulative firmware maintenance cost of carrying this patch across 5+ SKUs over 3 years?

3. **[Strategic/Ecosystem Moat]:** The power specification gap was not communicated from engineering to product marketing before the datasheet was published and evaluation kits were shipped. What governance mechanism failed — and what process change is being implemented to ensure that firmware workarounds with measurable PPA impact are disclosed to the commercial team before customer-facing specifications are committed?
