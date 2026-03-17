# Test Case: Project Valkyrie-NPU

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | TC-003 |
| Test Name | Multi-Layer Friction — NPU AI Accelerator Platform SoC |
| Primary Test Target | Cross-layer communication failure detection, performance model divergence |
| Secondary Test Targets | Workaround detection, accountability gap identification, competitive pressure analysis |
| Expected Status | 🔴 Red |
| Override Triggers | R1 (memory controller errata, no HW fix), R8 (NPU throughput ≥15% below spec) |

---

## Simulated Input Documents

### Document 1: Weekly Status Report (Project Manager)

**Project:** Valkyrie-NPU — Edge AI Accelerator SoC (Datacenter Inference Platform)
**Process Node:** TSMC 3nm
**Phase:** Post-Silicon Validation / Software Development
**Official Status:** 🟡 Yellow — "Performance tuning ongoing"
**Report Date:** Week 13, 2026

**Executive Summary:**
Valkyrie-NPU post-silicon validation is progressing well. The NPU core achieves 120 TOPS (INT8) in isolated benchmark — meeting the silicon specification. The AI compiler team has released SDK v1.2 with improved model quantization support. Integration of the full inference pipeline (model load → pre-processing → NPU inference → post-processing) is underway with performance tuning ongoing. The team has identified optimization opportunities in the memory subsystem that are expected to close the remaining performance gap. Architecture refinement underway on the DMA engine interface. A key hyperscaler customer (CloudScale Inc.) has scheduled a benchmark evaluation for Week 20 using their proprietary LLM inference workload.

**Hardware Status:**
- NPU core: 120 TOPS (INT8) validated in isolated test — meets spec
- DDR5 memory controller: functional, bandwidth optimization in progress
- PCIe Gen5 host interface: validated at full speed
- Thermal envelope: within spec at nominal workload

**Software Status:**
- AI Compiler SDK v1.2 released — ONNX model support, INT8/INT4 quantization
- NPU runtime driver integrated with Linux kernel 6.4
- Inference pipeline integration ongoing — end-to-end performance at 78 TOPS (target: 100 TOPS effective)
- Memory subsystem optimization in progress — DMA engine utilization at 62%
- Exploring alternative software approaches for memory access patterns

**Schedule:**
- Customer benchmark evaluation: Week 20 (CloudScale Inc.)
- SDK v2.0 release (production): Week 24
- Volume shipment: Q4 2026

**Risks:**
- End-to-end inference throughput gap (78 vs 100 TOPS) — mitigation: memory optimization sprint
- SDK API stability — minor interface changes expected before v2.0

---

### Document 2: Jira Issue Tracker Extract

**Valkyrie-NPU Open Critical Issues (as of Week 13):**

| Issue ID | Priority | Summary | Status | Assigned Team | Created | Days Open |
|----------|----------|---------|--------|---------------|---------|-----------|
| VK-2201 | Critical | DDR5 memory controller intermittent ECC errors under sustained NPU load | Open | HW Memory / BSP | Week 9 | 28 |
| VK-2215 | Critical | DMA engine throughput 38% below design target when NPU and host compete for DDR bandwidth | Open | HW Platform / NPU Runtime | Week 10 | 21 |
| VK-2230 | Critical | End-to-end inference throughput: 78 TOPS measured vs. 100 TOPS target (22% gap) | Open | NPU Algorithm / BSP / HW | Week 11 | 14 |
| VK-2245 | High | Model quantization accuracy degradation on INT4 — 3.2% accuracy loss (target: <1%) | Open | AI Compiler | Week 12 | 7 |
| VK-2248 | High | PCIe Gen5 host-to-device transfer stalls during concurrent NPU inference | Open | BSP / PCIe Driver | Week 12 | 7 |

**Recently Closed:**

| Issue ID | Priority | Summary | Resolution |
|----------|----------|---------|------------|
| VK-2180 | Critical | DDR5 memory controller ECC single-bit error rate exceeding threshold | Closed — retry logic added to memory driver |
| VK-2195 | High | DMA transfer timeout under multi-stream inference workload | Closed — retry with backoff implemented |

---

### Document 3: Cross-Team Meeting Notes (Week 12)

**Attendees:** NPU Algorithm Lead (Dr. Li Mei), AI Compiler Lead (Alex Novak), BSP/Runtime Lead (Mike Torres), HW Memory Lead (Dr. Yuki Tanaka), Project Manager (Jennifer Chang)

**Discussion:**

Dr. Li Mei (NPU Algorithm): Our models are optimized assuming 200 GB/s effective DDR5 bandwidth to the NPU. The silicon specification says 204.8 GB/s peak. However, in practice, we're seeing only 124 GB/s effective bandwidth when the NPU inference engine is running concurrently with host-side pre-processing and post-processing. Our TOPS numbers are memory-bandwidth-bound, not compute-bound.

Mike Torres (BSP/Runtime): The memory bandwidth issue has two root causes. First, the DMA engine is only achieving 62% utilization due to a hardware scheduling conflict between NPU DMA channels and the host PCIe DMA. Second, VK-2201 — the intermittent ECC errors — are forcing us to add retry logic to every memory transaction, which adds approximately 15% overhead.

Dr. Yuki Tanaka (HW Memory): The ECC error rate is higher than expected. The memory controller has a known issue with refresh timing under sustained high-bandwidth workloads. The hardware team has characterized the issue and determined that a fix would require a metal spin. We've recommended the retry approach as the production workaround.

Alex Novak (AI Compiler): We have a related problem. Our compiler generates memory access patterns optimized for the theoretical 200 GB/s bandwidth. With the actual 124 GB/s, these patterns cause memory contention that further degrades throughput. We need to re-profile and re-optimize the compiler's memory scheduler, but that requires the BSP team to give us accurate bandwidth numbers — which are still changing weekly as they tune the DMA and retry logic.

Jennifer Chang (PM): Where does this leave us for the CloudScale benchmark in Week 20?

Dr. Li Mei (NPU Algorithm): Honestly? We're at 78 TOPS end-to-end. The gap to 100 TOPS is 22%. The algorithm team can optimize our memory access patterns to recover maybe 5-8 TOPS. The compiler team might recover another 3-5 TOPS with better scheduling. But the fundamental bottleneck is the memory bandwidth constraint. Without hardware-level bandwidth improvement, we cannot close the gap.

Mike Torres (BSP/Runtime): I need to add that the retry logic for VK-2201 is masking the ECC errors, but it's adding latency non-determinism. For the LLM inference workload that CloudScale wants to benchmark, latency consistency matters as much as throughput.

Jennifer Chang (PM): Let's target 90 TOPS as a realistic stretch goal for Week 20. Alex, can you expedite the compiler re-optimization? Dr. Li, please work with Mike to establish the real bandwidth numbers.

Dr. Li Mei (NPU Algorithm): Jennifer, I want to be clear — the algorithm team has been developing against a performance model that assumed 200 GB/s DDR bandwidth. We now know that model was wrong by 38%. We've been optimizing for a system that doesn't exist. Everything we've done in the last 8 weeks needs to be re-profiled. This is not a tuning exercise. It's a re-architecture of our inference pipeline.

---

### Document 4: AI Compiler Team Internal Report (Week 12)

**Confidential — AI Compiler Team Only**

**Performance Model Discrepancy Analysis:**

| Parameter | Compiler Assumption | Actual Measured | Gap |
|-----------|-------------------|----------------|-----|
| DDR5 Effective Bandwidth | 200 GB/s | 124 GB/s | -38% |
| DMA Engine Utilization | 95% | 62% | -33% |
| Memory Latency (P99) | 45 ns | 120 ns (with retries) | +167% |
| NPU TOPS (end-to-end) | 100 TOPS | 78 TOPS | -22% |
| Model Load Time (1B param) | 2.1s | 5.8s | +176% |

**Risk Assessment:** The compiler's graph optimizer and memory scheduler are designed around the assumption that DDR bandwidth is not a bottleneck. This assumption is fundamentally broken. Re-optimizing the compiler for a bandwidth-constrained regime requires:
1. Rewriting the memory prefetch strategy
2. Implementing operator fusion to reduce memory round-trips
3. Adding a bandwidth-aware scheduling pass to the graph optimizer

**Estimated effort:** 6-8 engineer-weeks. **Estimated TOPS recovery:** 8-12 TOPS (bringing end-to-end to 86-90 TOPS). **Cannot close the full 22 TOPS gap without hardware bandwidth improvement.**

---

### Document 5: Git Commit Log Extract (BSP Repository, Weeks 9-13)

```
commit aa12bc3 — Week 9 — M.Torres — [VK-BSP] Add DDR5 ECC error counter and logging framework
commit bb23cd4 — Week 9 — M.Torres — [VK-BSP] Implement memory transaction retry logic (max 3 retries)
commit cc34de5 — Week 10 — M.Torres — [VK-BSP] Increase retry limit to 5 after ECC error storm observed
commit dd45ef6 — Week 10 — M.Torres — [VK-BSP] Add retry backoff timer to prevent bus saturation during error events
commit ee56fa7 — Week 10 — M.Torres — [VK-BSP] DMA engine bandwidth profiling — measured 62% utilization
commit ff67ab8 — Week 11 — M.Torres — [VK-BSP] Attempt DMA channel priority rebalancing for NPU vs PCIe
commit aa78bc9 — Week 11 — M.Torres — [VK-BSP] Revert DMA priority change — caused PCIe host timeout
commit bb89cd0 — Week 12 — M.Torres — [VK-BSP] Add bandwidth measurement API for compiler team integration
commit cc90de1 — Week 12 — M.Torres — [VK-BSP] Memory latency profiling — P99 at 120ns with retry overhead
commit dd01ef2 — Week 13 — M.Torres — [VK-BSP] PCIe Gen5 stall workaround — add flow control for concurrent DMA
```

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | 🔴 Red |
| Override Triggers Activated | R1 (DDR5 memory controller errata, no HW fix — retry workaround only), R8 (78 TOPS vs 100 TOPS = 22% below spec, no credible recovery plan to close full gap) |

### Expected Key Findings

1. **Performance Model Divergence (Critical):** The NPU algorithm team and AI compiler have been developing for 8+ weeks against a performance model assuming 200 GB/s DDR bandwidth. Actual measured bandwidth is 124 GB/s — a 38% gap. All optimization work during this period was targeting a system that does not exist. This is a cross-layer communication failure: the hardware memory team knew the bandwidth constraint but did not communicate it to the algorithm and compiler teams until it was discovered during integration.

2. **DDR5 Memory Controller Errata — Retry Workaround:**
   - Hardware defect: ECC error rate exceeds threshold under sustained NPU load due to refresh timing issue
   - Workaround: Software retry logic (up to 5 retries per transaction) with backoff
   - PPA cost: P99 memory latency increased from 45ns to 120ns (+167%); non-deterministic latency incompatible with consistent LLM inference
   - Debt class: Isolated patch, but severity increases with workload intensity

3. **DMA Engine Underperformance:** DMA utilization at 62% (vs. 95% design target) due to scheduling conflict between NPU and PCIe host DMA channels. BSP team attempted priority rebalancing but reverted after causing PCIe host timeouts. This is an unsolved hardware limitation.

4. **Three-Team Performance Model Gap:** The algorithm team assumed 200 GB/s bandwidth. The compiler optimized memory access patterns for 200 GB/s. The BSP team knows the real number is 124 GB/s. The compiler team estimates 6-8 weeks of rework to adapt to the real bandwidth, recovering only 8-12 TOPS (to ~86-90 TOPS). The full 22 TOPS gap cannot be closed without hardware improvement.

5. **Customer Benchmark at Risk:** CloudScale Inc. benchmark evaluation in Week 20 with proprietary LLM inference workload. Current end-to-end performance is 78 TOPS. Best case with compiler re-optimization is 86-90 TOPS. The 100 TOPS target appears unachievable. LLM workloads are particularly sensitive to memory bandwidth and latency consistency — both of which are degraded.

6. **Accountability Gap:** The hardware memory team recommended the retry workaround as "production solution" without quantifying its impact on the full inference pipeline performance. The project manager's "90 TOPS stretch goal" has no engineering basis — neither the compiler team nor the algorithm team committed to delivering it.

### Expected Questions (Calibration Reference)

1. **[Defensive/Accountability]:** The algorithm team has been optimizing against a 200 GB/s DDR bandwidth assumption for 8 weeks while the actual measured bandwidth is 124 GB/s — a 38% gap that invalidates all their work. Who in the hardware memory team knew the real bandwidth numbers, when did they know, and why was this not communicated to the algorithm and compiler teams before 8 weeks of engineering effort was wasted?

2. **[Strategic/Scale-Out]:** The DDR5 memory controller's ECC error rate under sustained NPU load requires a software retry workaround that adds 167% P99 latency overhead. If Valkyrie-NPU is the foundation for the next three generations of inference accelerators, is this memory controller design going to be carried forward — and has anyone calculated the cumulative R&D cost of every future compiler and algorithm team having to design around a bandwidth-constrained, latency-unpredictable memory subsystem?

3. **[Strategic/Ecosystem Moat]:** CloudScale's benchmark evaluation in Week 20 will reveal a 22% TOPS gap against committed specifications. If CloudScale publishes these results in their internal vendor comparison (which they share with other hyperscalers), what is the damage to Valkyrie's competitive positioning against NVIDIA's inference platform — and is the AI SDK team prepared with a narrative that explains the gap while demonstrating a credible path to the target specification?
