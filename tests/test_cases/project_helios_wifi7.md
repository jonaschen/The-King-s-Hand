# Test Case: Project Helios-WiFi7

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | TC-007 |
| Test Name | Green-to-Red Override — Wi-Fi 7 Enterprise Access Point SoC |
| Primary Test Target | Watermelon effect: all-green report concealing schedule crisis + hidden spec compromise |
| Secondary Test Targets | Corporate code word translation, customer escalation concealment |
| Expected Status | 🔴 Red (override from official 🟢 Green) |
| Override Triggers | R2 (two certification submission failures in 8 weeks), R4 (Cisco Tier-1 customer escalation), R6 (Green reported while ≥3 Red signals in data) |

---

## Simulated Input Documents

### Document 1: Weekly Status Report (Project Manager)

**Project:** Helios-WiFi7 — Tri-Band Wi-Fi 7 (802.11be) Enterprise Access Point SoC
**Process Node:** TSMC 7nm
**Phase:** Certification and Pre-Production Validation
**Official Status:** 🟢 Green — "Certification milestones on track"
**Report Date:** Week 11, 2026

**Executive Summary:**
Helios-WiFi7 is executing well across all workstreams. Wi-Fi 7 (802.11be) Multi-Link Operation (MLO) has been validated across all three bands (2.4GHz, 5GHz, 6GHz). The MAC/PHY layer achieves the target 5.8 Gbps aggregate throughput in a controlled RF environment. Security certification (WPA3-Enterprise) is complete. The firmware team has delivered excellent stability — the system has achieved 14-day continuous uptime in soak testing. Regulatory certification submissions are proceeding through the standard review process. Enterprise customer (Cisco) engagement continues with productive technical exchanges.

**Hardware Status:**
- All RF front-end blocks functional across tri-band
- PCIe Gen4 host interface validated at full speed
- DDR4 memory controller validated at 3200 MT/s
- Crypto engine: AES-256-GCM at 10 Gbps validated

**Software Status:**
- Wi-Fi 7 MLO driver: Linux 6.6 upstreamed
- WPA3-Enterprise: certification complete
- QoS and traffic scheduling: implemented per 802.11be specification
- Firmware v3.1: 14-day soak test complete, zero crashes
- Power save mode: optimization finalized

**Schedule:**
- FCC Part 15 certification: submission Week 9, decision Week 13
- ETSI EN 301 893 (EU): submission Week 10, decision Week 14
- Cisco lab evaluation: Week 15
- CE/FCC marks received: Week 15
- Customer (Cisco) engineering sample delivery: Week 18
- Mass production: Q3 2026

**Risks:**
- Regulatory review timelines subject to agency schedule — standard process.
- No technical risks identified.

---

### Document 2: Jira Issue Tracker Extract

**Helios-WiFi7 Open Issues (as of Week 11):**

| Issue ID | Priority | Summary | Status | Assigned Team | Created | Days Open |
|----------|----------|---------|--------|---------------|---------|-----------|
| HW-2201 | High | FCC Part 15 resubmission: spurious emission at 5.845 GHz Band 1 edge exceeds limit by 2.1 dBm | In Progress | RF / Firmware | Week 9 | 14 |
| HW-2215 | High | ETSI EN 301 893 resubmission: 6GHz TX power spectral density 1.8 dB above ETSI limit in channel 149 | In Progress | RF / Firmware | Week 10 | 7 |
| HW-2228 | Medium | MLO throughput degrades 31% under 50-client enterprise load (throughput 4.0 Gbps vs. 5.8 Gbps spec) | In Progress | MAC/PHY | Week 10 | 7 |
| HW-2235 | Medium | Enterprise RADIUS authentication latency 340ms (enterprise target: <200ms) | Open | Protocol Stack | Week 11 | 2 |

**Recently Closed (Last 60 Days):**

| Issue ID | Priority | Summary | Resolution |
|----------|----------|---------|------------|
| HW-2101 | Critical | FCC Part 15 submission Week 4 rejected: spurious emissions at 5.8 GHz exceed Part 15 limit | Closed — TX power reduced 1.5 dB across 5 GHz band; resubmitted Week 9 |
| HW-2112 | Critical | ETSI initial submission Week 5 rejected: 6 GHz EIRP 2.3 dB above SP limit in outdoor mode | Closed — outdoor mode TX power capped; resubmitted Week 10 |
| HW-2130 | High | Cisco lab pre-evaluation (Week 8): MLO throughput 4.1 Gbps under 50-client load — below 5.8 Gbps spec | Closed — noted as "test environment calibration difference"; Cisco not yet notified of spec gap |
| HW-2148 | High | Power save mode: stations experience 450ms latency spike on wake-up (enterprise target: <100ms) | Closed — power save disabled by default in enterprise firmware profile |
| HW-2162 | Critical | Cisco formal escalation (Week 10): throughput specification gap — requesting written technical response | Closed — response drafted; pending PM review |

---

### Document 3: RF Engineering Internal Report (Week 10)

**Confidential — RF Team**

The FCC Part 15 rejection (Week 4) and ETSI rejection (Week 5) both have the same root cause: the 7nm RF front-end has higher harmonic content than the pre-silicon simulation predicted. The filter design assumed a specific third-order intercept point (IP3) that was not achieved in silicon.

**Workarounds applied:**
- FCC: Reduced 5 GHz TX power by 1.5 dB across all channels. Resubmitted Week 9. Initial review shows spurious at 5.845 GHz still 2.1 dBm over limit — a second failure is expected.
- ETSI: Capped 6 GHz EIRP in outdoor mode. Resubmitted Week 10. Channel 149 PSD remains 1.8 dB over limit — second failure expected.

**Root cause:** The harmonic filter bank would need a redesign to fully resolve the emissions. This is a hardware fix — estimated 12 weeks and $1.8M for a filter bank revision. The software option is further TX power reduction, but each dB of power reduction directly translates to coverage range reduction (approximately 12% per dB at typical enterprise deployment geometry). The 5 GHz band has already absorbed 1.5 dB; a further 2+ dB reduction would reduce the 5 GHz coverage radius by approximately 25–30%, materially below the enterprise access point specification.

---

### Document 4: Cisco Technical Escalation (Week 10)

**From:** David Chen, VP Technology, Cisco Networking
**To:** Helios-WiFi7 Program Office
**Subject:** Nova-AP [sic] — Throughput Specification Discrepancy

"We ran your pre-evaluation engineering samples through our standard enterprise load test (50 associated clients, mixed TCP/UDP, WPA3-Enterprise authentication). We measured 4.0–4.1 Gbps aggregate throughput versus the 5.8 Gbps specification in your product brief.

This is a 31% gap from the committed specification. Our enterprise AP qualification standard requires sustained throughput to meet the specification under our standard test load. The current result does not meet qualification criteria.

We need a written technical explanation of this gap and a committed plan for closing it. If we do not receive a satisfactory response within 2 weeks, we will suspend the qualification evaluation and resume evaluation of alternate vendors.

David Chen"

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | 🔴 Red (override from official 🟢 Green) |
| Override Triggers Activated | R2 (two regulatory certification submission failures — FCC Week 4 + ETSI Week 5, both entering second submission cycle), R4 (Cisco Tier-1 customer formal escalation with alternate vendor threat), R6 (Green reported while regulatory failures, customer escalation, and throughput spec gap all active simultaneously) |

### Expected Key Findings

1. **Serial Regulatory Certification Failures (Hidden):** FCC Part 15 was rejected in Week 4 and ETSI in Week 5 — both for the same root cause (RF harmonic content exceeding emissions limits). The official report says "certification submissions proceeding through standard review process." Both resubmissions (Week 9, Week 10) are expected to fail again, as the spurious emission and PSD violations remain.

2. **TX Power Reduction Workaround — Coverage Impact:** FCC compliance workaround reduces 5 GHz TX power by 1.5 dB. Further reduction of 2+ dB required for compliance will reduce 5 GHz coverage radius by 25–30%. Enterprise AP products are specified and priced on coverage area — a 25–30% range reduction is a material spec violation.

3. **MLO Throughput Spec Gap:** 50-client enterprise load produces 4.0 Gbps (vs. 5.8 Gbps spec, −31%). Cisco discovered this in their pre-evaluation and issued a formal written escalation. The Jira resolution "test environment calibration difference" is a rationalization — Cisco's test environment is the customer's actual qualification environment.

4. **Power Save Disabled (Hidden):** Enterprise firmware has disabled power save mode by default to avoid the 450ms wake latency (target <100ms). Power consumption in enterprise deployments is now above specification.

5. **Cisco Escalation Concealment:** Cisco's formal escalation email with alternate vendor threat (HW-2162) was closed in Jira as "response drafted; pending PM review" — not flagged as a risk, not escalated, not disclosed in the weekly report.

### Expected Questions (Calibration Reference)

1. **[Defensive/Accountability]:** The FCC Part 15 certification failed in Week 4 and the ETSI certification failed in Week 5 — both for the same root cause: RF harmonic content from the 7nm front-end exceeds emissions limits. Both resubmissions (Week 9 and Week 10) show the same violations still present. The RF team has confirmed the only complete fix is a hardware filter bank revision ($1.8M, 12 weeks), and further firmware TX power reduction would reduce 5 GHz coverage radius by 25–30%. What is the specific technical path to passing both FCC and ETSI certification without compromising the coverage specification — and who is the named owner of explaining to Cisco why certification marks will not be available at the Week 15 evaluation date that was committed to them?

2. **[Strategic/Scale-Out]:** The 7nm RF front-end's harmonic filter bank underperforms the pre-silicon simulation's IP3 assumption — a design modeling error that has now caused two serial certification failures across two regulatory bodies. If Helios-WiFi7's successor SoC inherits the same RF architecture, this emissions problem repeats. What was the IP3 assumption in the pre-silicon RF simulation, what is the measured silicon value, and has the RF design team updated the simulation model so that Helios-WiFi7 2 does not enter certification with the same underestimated harmonic profile?

3. **[Strategic/Ecosystem Moat]:** Cisco's enterprise AP platform is the reference design-win that qualifies Helios-WiFi7 for the enterprise Wi-Fi 7 market. Cisco's VP Technology sent a formal written escalation in Week 10 threatening to suspend qualification and evaluate alternate vendors — this escalation was closed in Jira without being disclosed in the executive weekly report. If Cisco suspends qualification and a competitor's Wi-Fi 7 SoC earns the Cisco design-in while Helios-WiFi7 is in a second regulatory resubmission cycle, what is the timeline before the enterprise Wi-Fi 7 market window closes for late entrants, and is the executive team currently making the $1.8M filter bank revision decision with full knowledge of the Cisco escalation?
