# Test Case: Project Nova-AP

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | TC-005 |
| Test Name | Green-to-Yellow Override — Android Application Processor SoC |
| Primary Test Target | Hidden power regression, SDK/developer ecosystem framing |
| Secondary Test Targets | Metric selection bias, corporate code word translation |
| Expected Status | 🟡 Yellow (override from official 🟢 Green) |
| Override Triggers | Y3 (test coverage plateau, no sprint-over-sprint increase), Y7 (PPA cost of thermal throttling workaround not disclosed in official report) |

---

## Simulated Input Documents

### Document 1: Weekly Status Report (Project Manager)

**Project:** Nova-AP — Octa-Core Android Application Processor SoC (Arm Cortex-X4 + A720 cluster)
**Process Node:** Samsung 4nm
**Phase:** Software Bring-up / SDK Development
**Official Status:** 🟢 Green — "On track for Android 15 certification"
**Report Date:** Week 9, 2026

**Executive Summary:**
Nova-AP software bring-up is progressing ahead of schedule. The Android 15 HAL layer is complete and all mandatory CTS (Compatibility Test Suite) test cases have passed. The GPU driver (Mali-G720) achieved OpenGL ES 3.2 and Vulkan 1.3 compliance last week — a major milestone. AI inference benchmarks on the NPU show strong results at 35 TOPS (INT8), exceeding the 30 TOPS specification. The camera ISP pipeline supports 200MP sensor input with real-time HDR processing. The SDK documentation portal launched internally this week. A leading Android OEM (MegaDevice) has scheduled a technical workshop for Week 12 to evaluate Nova-AP for their 2027 flagship.

**Hardware Status:**
- All CPU, GPU, NPU, and ISP subsystems functional
- DDR5 memory controller validated at 8533 MT/s
- USB4 and DisplayPort 2.1 UHBR13.5 certified
- Thermal sensors and PMIC integration complete

**Software Status:**
- Android 15 HAL: complete — all mandatory CTS cases passed
- GPU driver: OpenGL ES 3.2 and Vulkan 1.3 compliant
- NPU SDK v1.1 released with ONNX and TFLite support
- Thermal management framework: optimization finalized
- Camera ISP pipeline: 200MP HDR processing validated

**Schedule:**
- Android CTS full pass: Week 12, 2026
- MegaDevice technical workshop: Week 12
- Android 15 GMS certification submission: Week 16
- Customer engineering samples: Week 20
- Mass production: Q1 2027

**Risks:**
- None identified. All workstreams executing to plan.

---

### Document 2: Jira Issue Tracker Extract

**Nova-AP Open Issues (as of Week 9):**

| Issue ID | Priority | Summary | Status | Assigned Team | Created | Days Open |
|----------|----------|---------|--------|---------------|---------|-----------|
| NA-0611 | Medium | Sustained CPU workload benchmark score 8% below target (AnTuTu v11 total score) | In Progress | CPU/Perf | Week 7 | 14 |
| NA-0618 | Medium | NPU SDK: INT4 quantization accuracy loss 2.1% (target: <1%) | In Progress | NPU SDK | Week 8 | 7 |
| NA-0622 | Low | Android 15 CTS: 3 optional test cases failing (non-mandatory) | Open | HAL | Week 9 | 2 |

**Recently Closed (Last 30 Days):**

| Issue ID | Priority | Summary | Resolution |
|----------|----------|---------|------------|
| NA-0581 | Critical | CPU cluster thermal throttling onset at 68°C — target sustained performance at ≥75°C | Closed — thermal throttle onset threshold lowered to 62°C to prevent throttling during benchmark |
| NA-0588 | Critical | GPU sustained rendering drops to 52% peak clock after 3 minutes — violates sustained performance spec | Closed — GPU DVFS governor tuned; burst profile extended; thermal budget reallocated from modem to GPU |
| NA-0593 | High | NPU 35 TOPS achieved only in isolated burst mode — 5-min sustained inference: 27.4 TOPS | Closed — benchmark conditions clarified; spec re-interpreted as peak (burst) mode |
| NA-0601 | High | Android CTS Power.Accuracy test failing — sustained CPU workload power 18% above spec | Closed — PMIC current limit adjusted; test sequence modified to avoid thermal saturation condition |

---

### Document 3: Thermal Engineering Internal Report (Week 8)

**Confidential — Nova-AP Thermal Team**

| Condition | CPU Freq (sustained) | GPU Freq (sustained) | NPU TOPS (sustained 5 min) | Board Temp |
|-----------|---------------------|---------------------|---------------------------|------------|
| Design spec | Cortex-X4 @ 3.2GHz | 950MHz | 35 TOPS | ≤75°C |
| Measured (ambient 25°C) | 2.4GHz (−25%) | 680MHz (−28%) | 27.4 TOPS (−22%) | 72°C |
| Measured (ambient 35°C) | 1.9GHz (−41%) | 540MHz (−43%) | 21.8 TOPS (−38%) | 81°C → throttle |

**Engineering Note:** Sustained performance at real-world ambient temperatures (35°C) is substantially below specification. The thermal design of the Samsung 4nm process variant selected for Nova-AP has 12% higher leakage than the nominal model used in architectural planning. The thermal budget was calculated for nominal leakage; actual silicon runs hotter and throttles earlier. The benchmark results in the official report use ambient 25°C controlled lab conditions and burst-mode measurement windows of ≤90 seconds — real-world device experience at 35°C sustained workload is significantly worse.

**Battery Life Impact:** The PMIC thermal budget reallocation from modem to GPU (NA-0588) increases modem power by approximately 15%, reducing battery life in 5G connected scenarios by an estimated 8–12%.

---

### Document 4: NPU SDK Team Internal Note (Week 9)

**To:** Nova-AP Program Office
**From:** NPU SDK Lead (Dr. Aisha Kamara)
**Subject:** SDK documentation launch concerns

The NPU SDK documentation portal launched this week with 35 TOPS (INT8) prominently featured as the headline specification. I want to formally note that this figure reflects isolated burst-mode performance in a controlled thermal environment. The sustained inference performance at 5 minutes is 27.4 TOPS at 25°C ambient, and 21.8 TOPS at 35°C ambient — a 38% gap from the headline figure under realistic deployment conditions.

Mobile AI application developers integrating Nova-AP will encounter the sustained number in production deployments. When they do, the gap from the documentation will be a developer experience failure. I have flagged this three times in the SDK review process. The decision to publish 35 TOPS as the headline figure was made by product marketing over engineering objection.

The INT4 quantization accuracy issue (NA-0618) is also unresolved. This affects the on-device LLM inference use case that MegaDevice's 2027 flagship is specifically targeting.

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | 🟡 Yellow (override from official 🟢 Green) |
| Override Triggers Activated | Y3 (CTS optional cases failing, test coverage not increasing), Y7 (thermal throttling PPA impact not quantified in official report) |
| Note | Not Red because CTS mandatory cases passed and Android GMS path is intact — but the sustained performance gap and SDK documentation mismatch create Yellow-level commercial and developer trust risks |

### Expected Key Findings

1. **Thermal Throttling Gap (Hidden):** Sustained CPU performance at 35°C ambient is 41% below design spec (1.9GHz vs 3.2GHz). GPU sustained is 43% below spec. NPU sustained inference is 38% below spec (21.8 vs 35 TOPS). The official report's performance figures are burst-mode at 25°C controlled lab conditions.

2. **Spec Re-interpretation Pattern:** NA-0593 (NPU sustained TOPS shortfall) was closed by "re-interpreting" the 35 TOPS spec as peak/burst mode rather than sustained — without updating the architectural specification document. This converts a performance failure into a documentation decision.

3. **SDK Documentation Mismatch:** The publicly launched NPU SDK documentation features 35 TOPS (burst) as the headline figure. Sustained performance under realistic conditions is 27.4 TOPS at 25°C and 21.8 TOPS at 35°C. The NPU SDK lead has formally objected to this three times.

4. **Battery Life Regression (Hidden):** The PMIC thermal budget reallocation (NA-0588 resolution) increases modem power by ~15%, reducing battery life in 5G scenarios by 8–12%. Not disclosed in the official report.

5. **MegaDevice Workshop Risk:** MegaDevice's 2027 flagship targets on-device LLM inference. The unresolved INT4 accuracy issue (2.1% vs <1% target) and the sustained TOPS gap are directly relevant to their evaluation criteria.

### Expected Questions (Calibration Reference)

1. **[Defensive/Accountability]:** NA-0593 (NPU sustained TOPS shortfall) was closed by re-interpreting the 35 TOPS specification as a peak/burst figure rather than a sustained performance target — without updating the architectural specification document. Who approved this re-interpretation, and when MegaDevice runs their own 5-minute sustained inference benchmark at 35°C ambient during the Week 12 workshop, what is the plan for explaining the 38% gap between the documentation headline figure and the measured result?

2. **[Strategic/Scale-Out]:** The Samsung 4nm variant has 12% higher leakage than the nominal thermal model, causing sustained performance to throttle 40%+ below spec at real-world temperatures. If Nova-AP 2 (planned for 2028) uses the same or similar process node, this thermal budget miscalculation repeats — unless the architectural team revises the thermal model. Who owns the decision to fix the thermal model in the next silicon revision, and has the 40% sustained performance gap been disclosed to the Samsung process team as a formal process characterization feedback item?

3. **[Strategic/Ecosystem Moat]:** The NPU SDK documentation portal launched this week with 35 TOPS as the headline figure; the NPU SDK lead has formally objected three times that this figure misleads developers about real-world performance. If MegaDevice or an early developer publishes a benchmark showing 21–27 TOPS sustained and the gap from the documentation becomes public, what is the damage to the Nova-AP developer ecosystem before the 2027 flagship design-in window closes — and is product marketing currently aware that the SDK lead's objection is on the record?
