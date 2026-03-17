# Test Case: Project Mercury-Codec

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | TC-010 |
| Test Name | Yellow-to-Red Override — Video Codec SoC (Streaming Platform) |
| Primary Test Target | Performance model divergence between algorithm team and hardware, cross-layer friction |
| Secondary Test Targets | Customer commitment shortfall, corporate code word translation |
| Expected Status | 🔴 Red (override from official 🟡 Yellow) |
| Override Triggers | R1 (DDR memory bandwidth architectural bottleneck, no HW fix path confirmed), R8 (AV1 decode throughput 23% below committed specification, no software recovery plan) |

---

## Simulated Input Documents

### Document 1: Weekly Status Report (Project Manager)

**Project:** Mercury-Codec — Multi-Standard Video Codec SoC (AV1 / H.266 VVC / H.265 HEVC)
**Process Node:** TSMC 6nm
**Phase:** Post-Silicon Validation / Customer Integration
**Official Status:** 🟡 Yellow — "Codec performance optimization in progress"
**Report Date:** Week 12, 2026

**Executive Summary:**
Mercury-Codec post-silicon validation is progressing well. AV1 decode achieves 4K@120fps in isolated testing, meeting the silicon specification. H.266 VVC encode at 4K@30fps has been validated. The video processing pipeline (HDR10+ tone mapping, film grain synthesis) is functional. Codec driver integration with Linux 6.6 V4L2 framework is complete. Performance optimization is underway to close the remaining gap in the real-world multi-stream decoding scenario. Netflix (Tier-1 streaming customer) has been engaged and their integration evaluation is scheduled for Week 18. The team is confident the performance targets will be achieved through ongoing software optimization.

**Hardware Status:**
- AV1 decode engine: 4K@120fps validated in isolated test
- H.266 VVC encode engine: 4K@30fps validated
- DDR5 memory interface: functional at 6400 MT/s
- PCIe Gen4 x8 host interface: validated at full speed

**Software Status:**
- V4L2 Linux driver: complete and upstream-ready
- AV1 decoder: bit-exact output validated against reference decoder
- Multi-stream management: integration in progress
- Performance optimization: active sprint in progress

**Schedule:**
- Netflix integration evaluation: Week 18
- SDK v1.0 production release: Week 20
- Volume shipment to Netflix CDN infrastructure: Q3 2026

**Risks:**
- Multi-stream real-world performance gap — mitigation: software optimization sprint ongoing.

---

### Document 2: Jira Issue Tracker Extract

**Mercury-Codec Open Issues (as of Week 12):**

| Issue ID | Priority | Summary | Status | Assigned Team | Created | Days Open |
|----------|----------|---------|--------|---------------|---------|-----------|
| MC-1501 | Critical | AV1 4K@60fps multi-stream: 8 concurrent streams achieves 6.1 streams equivalent throughput (target: 8.0) — 24% gap | Open | Codec HW / BSP | Week 8 | 28 |
| MC-1515 | Critical | DDR5 memory bandwidth utilization: 58% effective at peak codec load (design target: 85%) | Open | HW Memory / BSP | Week 9 | 21 |
| MC-1528 | High | AV1 reference frame cache miss rate 34% (algorithm target: <10%) during scene-change-heavy content | Open | Codec Algorithm | Week 10 | 14 |
| MC-1540 | High | H.266 VVC encode: real-time 4K@60fps not achievable — current throughput 4K@44fps (target: 4K@60fps) | Open | Codec Engine | Week 11 | 7 |

**Recently Closed:**

| Issue ID | Priority | Summary | Resolution |
|----------|----------|---------|------------|
| MC-1468 | Critical | DDR5 arbiter starvation: codec DMA channels blocked by PCIe host DMA at peak transfer rate | Closed — DMA priority weights adjusted; codec channels given higher priority |
| MC-1475 | High | AV1 bitstream parser throughput insufficient for 8K@30fps — parser CPU-bound | Closed — parser offloaded to dedicated hardware accelerator (silicon ECO) |

---

### Document 3: Cross-Team Meeting Notes (Week 11)

**Attendees:** Codec HW Lead (Dr. Priya Nair), BSP Lead (James Wu), Codec Algorithm Lead (Fatima Al-Rashid), Memory Subsystem Lead (Robert Kim), Project Manager (Amy Chen)

**Discussion:**

Dr. Priya Nair (Codec HW): The AV1 multi-stream throughput gap is a memory bandwidth problem, not a compute problem. Our codec engines are compute-capable of 8 streams at 4K@60fps. The bottleneck is that the DDR5 memory subsystem is only delivering 58% of the bandwidth the codec engines need. At 85% efficiency (design target), we would have comfortable headroom for 8 streams.

Robert Kim (Memory): The 58% efficiency is due to two factors. First, the DDR5 arbiter was prioritizing PCIe traffic over codec DMA — we've fixed that (MC-1468). After the fix, efficiency improved from 44% to 58%, but we're stuck there. The second factor is that the memory controller's page hit rate under the codec access pattern is lower than expected — we're seeing a lot of page closes and refreshes that eat bandwidth.

Fatima Al-Rashid (Codec Algorithm): Our reference frame access pattern was designed for a memory controller with a larger row buffer and a different page management policy. The actual controller behavior is significantly different from what we were told during architecture planning. We've been optimizing for 8 weeks against the wrong memory model — similar to how a cache-optimized algorithm degrades badly on a cache-unfriendly architecture.

James Wu (BSP): I need to add that the reference frame cache miss rate of 34% (MC-1528) is directly related to this. When the memory controller closes pages unexpectedly, the codec's internal reference frame cache has to reload frames from DRAM. At 34% miss rate, we're burning bandwidth on reloads that should be in the on-chip cache.

Amy Chen (PM): What's the realistic throughput with software optimization?

Fatima Al-Rashid (Algorithm): If we restructure our memory access patterns to match the actual controller behavior, we can probably recover 2–3 TOPS equivalent throughput. That brings us to maybe 7.2–7.5 equivalent streams at 4K@60fps. Getting to 8 streams requires either a hardware memory controller change or a new memory access architecture. The hardware team said a controller change is a metal spin.

Dr. Priya Nair (HW): Confirmed. Changing the page management policy requires RTL modification. That is a new tape-out, not a patch.

Amy Chen (PM): Let's target 7.5 streams as a deliverable and see if Netflix's evaluation criteria have any flexibility.

---

### Document 4: Netflix Technical Requirements Document (Provided to Vendor, Week 6)

**Netflix CDN Infrastructure — Video Decode Accelerator Requirements (Excerpt)**

| Parameter | Minimum Requirement | Preferred |
|-----------|--------------------|----|
| AV1 4K@60fps concurrent streams per card | 8 streams | 10 streams |
| Memory bandwidth efficiency at peak load | >80% | >90% |
| AV1 decode latency (first frame) | <50ms | <30ms |
| Power per stream (4K@60fps AV1) | <8W | <6W |
| H.266 VVC encode (future roadmap) | 4K@30fps min | 4K@60fps preferred |

**Netflix note:** The 8-stream minimum is a firm requirement for our rack density targets. A solution delivering fewer than 8 concurrent streams does not qualify for our CDN infrastructure deployment.

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | 🔴 Red (override from official 🟡 Yellow) |
| Override Triggers Activated | R1 (DDR5 memory controller page management policy is a hardware architectural constraint, no fix without tape-out), R8 (AV1 multi-stream throughput 24% below committed specification with maximum software recovery of 7.2–7.5 streams vs. Netflix's firm 8-stream requirement) |

### Expected Key Findings

1. **Memory Architecture Performance Model Divergence:** The codec algorithm team optimized reference frame access patterns for a memory controller with different page management behavior than the actual silicon. This is a cross-layer communication failure: the memory subsystem team had the actual controller characteristics; the algorithm team had different assumptions from architecture planning. Result: 8 weeks of algorithm optimization wasted.

2. **DDR5 Memory Bandwidth Architectural Bottleneck:** Effective memory bandwidth efficiency is 58% (target 85%). Hardware team has confirmed the page management policy cannot be changed without RTL modification (new tape-out). Maximum software recovery estimated at 7.2–7.5 equivalent streams — below Netflix's firm 8-stream minimum requirement.

3. **Netflix Requirement is a Hard Threshold:** Netflix's technical requirements document explicitly states "fewer than 8 concurrent streams does not qualify." The PM's "see if Netflix's evaluation criteria have flexibility" approach contradicts a written customer specification. Netflix's Week 18 evaluation will produce a binary pass/fail outcome against this threshold.

4. **H.266 VVC Encode Gap (Additional):** H.266 VVC encode real-time 4K@60fps is not achievable — current throughput is 4K@44fps (target 4K@60fps, gap 27%). Not disclosed in official report.

### Expected Questions (Calibration Reference)

1. **[Defensive/Accountability]:** Netflix's technical requirements document (provided in Week 6) explicitly states: "A solution delivering fewer than 8 concurrent streams does not qualify for CDN infrastructure deployment." The algorithm team has confirmed that the maximum software-achievable throughput is 7.2–7.5 equivalent streams due to a hardware memory controller page management constraint that requires a new tape-out to fix. The Week 18 evaluation will produce a binary pass/fail result. What is the plan for the Netflix evaluation — and who is responsible for communicating the 8-stream gap to Netflix before Week 18 rather than discovering it together during the evaluation?

2. **[Strategic/Scale-Out]:** The codec algorithm team's reference frame access patterns were optimized for a memory controller with different page management behavior than the actual silicon — an architecture planning communication failure that resulted in 8 weeks of misdirected optimization. If Mercury-Codec 2 (targeting AV1 at 8K@120fps) uses a new memory controller, the same risk repeats unless there is a formal process for sharing accurate memory controller behavioral specifications with the algorithm and compiler teams before optimization work begins. What process change is being implemented to ensure the algorithm team receives validated memory controller behavioral specifications — not architectural planning assumptions — before their next optimization cycle begins?

3. **[Strategic/Ecosystem Moat]:** Netflix CDN infrastructure deployments lock in a codec accelerator supplier for 3–5 year deployment cycles. Missing the 8-stream threshold in Week 18 effectively closes the Netflix CDN window for this silicon generation. H.266 VVC encode at 4K@60fps — the preferred specification and Netflix's stated roadmap requirement — is also not achievable at current throughput (4K@44fps). If Mercury-Codec fails Netflix qualification and a competitor's codec SoC wins the CDN deployment, what is the total revenue exposure across the streaming infrastructure market for the codec product line, and is there a credible path to competing for the next Netflix deployment cycle with Mercury-Codec 2?
