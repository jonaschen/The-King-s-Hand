# Test Case: Project Eon-AI (PowerPoint-to-Text Input)

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | TC-015 |
| Test Name | PowerPoint-to-Text Input — Edge AI Inference SoC Quarterly Program Review |
| Primary Test Target | Real-format input handling: extract intelligence from a slide-deck text dump with no prose narrative |
| Secondary Test Targets | Status override from fragmented slide content; extracting quantitative signals from table data embedded in slides |
| Expected Status | 🔴 Red (NPU TOPS 18.75% below specification — no recovery plan stated; two sequential schedule slips; all-green executive framing while technical slides reveal multiple Red-level findings) |
| Override Triggers | R8 (NPU TOPS 52 vs 64 specification — 18.75% below committed specification with no recovery plan), R6 (executive summary and milestone tracker show all-green while NPU performance, schedule, and SDK slides carry three Red-level signals) |
| Available Evidence | PowerPoint deck text export ONLY — slide content as pasted plain text; no PM report, no Jira, no speaker notes |

---

## Simulated Input Document

### Document 1: PowerPoint Text Export — Eon-AI Q1 2026 Program Review

*The following is the text content extracted from a PowerPoint presentation using the "Save As Plain Text" function. Slide titles are prefixed with `[SLIDE N]`. Bullet indentation is preserved where possible. Tables appear as tab-separated or space-aligned text. Speaker notes are not included in this export.*

---

```
[SLIDE 1]
Eon-AI Program Review
Q1 2026 Update
Confidential — For Executive Review Only
Presenter: Sarah Liu, Program Manager
Date: March 16, 2026

[SLIDE 2]
Executive Summary
Status: ● ON TRACK

Strong execution momentum across all workstreams
• Hardware silicon bring-up complete; all power rails nominal
• Software stack milestone: SDK v2.0 key features complete*
• Customer engagement: Velox Computing integration timeline confirmed
• Team performance: high velocity, collaborative, cross-functional alignment strong

Q2 outlook: Engineering sample delivery on schedule. Customer integration evaluation begins Week 20.

[SLIDE 3]
Milestone Tracker
                                    Target      Status
─────────────────────────────────────────────────────
Silicon bring-up complete           Week 4       ✓ Done
PLL lock validation                 Week 5       ✓ Done
NPU functional verification         Week 8       ✓ Done
SDK v2.0 key features complete      Week 10      ✓ Done
Performance characterization        Week 12      ✓ Done
Customer samples ready              Week 18      → In Progress
Velox Computing integration eval    Week 20      → Planned

All milestones on track or complete.

[SLIDE 4]
NPU Performance Summary
Eon-AI Custom NPU — Performance Characterization Results (Week 12)

Target Workload: INT8 Inference, ResNet-50 / MobileNetV3 / BERT-base

                    Specification   Measured    Delta
────────────────────────────────────────────────────
Peak TOPS (INT8)       64 TOPS       52 TOPS    −18.75%
Sustained TOPS         48 TOPS       41 TOPS    −14.6%
Memory BW Util.        85%           78%        −8.2%
Power (peak)           8W            7.8W       −2.5%
Area                   On spec       On spec    —

Note: Peak TOPS figure represents burst-mode performance.
Sustained TOPS measured over 30-second inference run.

[SLIDE 5]
Software Stack Status
SDK v2.0 Feature Delivery

Feature                             Status      Notes
─────────────────────────────────────────────────────
Core inference runtime              ✓ Complete  —
Model conversion tools (ONNX→NPU)   ✓ Complete  —
Operator library (standard ops)     ✓ Complete  —
Compiler backend — standard ops     ✓ Complete  —
Compiler backend — custom ops       ✗ Deferred  Rescheduled to v2.1
Memory bandwidth profiler           ✓ Complete  —
Python SDK wrapper                  ✓ Complete  —
C++ low-latency API                 In Progress ETA Week 16

* "SDK v2.0 key features complete" — Note: Compiler backend for custom operators
  has been rescheduled to SDK v2.1. Standard operator coverage is complete.

[SLIDE 6]
Customer Engagement — Velox Computing
Account: Velox Computing (hyperscaler AI infrastructure, Tier-1)
Program: Eon-AI integration into Velox Athena-2 AI training cluster node

Timeline
  Week 20:  Engineering sample delivery to Velox integration lab
  Weeks 20–28: Integration evaluation (8 weeks)
  Q3 2026:  Velox Athena-2 design-in decision

Status Update:
Velox Computing has requested a technical deep-dive session for Week 15 to review
NPU performance characterization results before engineering sample delivery.

Velox integration criteria (confirmed):
  • Peak inference throughput: ≥60 TOPS (INT8, sustained over benchmark run)
  • Memory bandwidth efficiency: ≥83%
  • Power envelope: ≤9W peak
  • Custom operator support: full coverage required for Velox proprietary model layer types

[SLIDE 7]
Schedule Summary
                                Original    Revised (Feb)   Current
──────────────────────────────────────────────────────────────────
Performance char. complete       Week 10      Week 12         Week 12 ✓
Customer samples ready           Week 14      Week 16         Week 18
Velox integration eval start     Week 16      Week 18         Week 20
Q3 design-in decision            Q3 2026      Q3 2026         Q3 2026*

*Q3 design-in decision timeline maintained. Buffer consumed: ~4 weeks of 8-week evaluation margin.

[SLIDE 8]
Risk Summary
Risk Register — Active Items

Risk ID   Description                         Likelihood   Impact   Mitigation
─────────────────────────────────────────────────────────────────────────────
RISK-001  SDK v2.1 custom ops delivery timing  Low          Medium   Parallel development track initiated
RISK-002  Foundry capacity (TSMC 3nm)          Low          Low      Slots confirmed through Q3

All critical technical risks closed. Program executing to plan.
Previous risks RISK-003 (NPU clock domain), RISK-004 (memory controller arbitration)
closed in Week 9 and Week 11 respectively.

[SLIDE 9]
Next Steps
  • Week 15: NPU performance deep-dive with Velox Computing
  • Week 16: C++ low-latency API completion
  • Week 17: Engineering sample final validation
  • Week 18: Customer sample shipment to Velox
  • Week 20: Velox integration evaluation kickoff

Team confidence: HIGH. Strong execution. On track for Q3 design-in.
```

---

## Sanitization Map (Hidden from System — For Evaluator Use Only)

The following is what the slide content actually means. The system must recover these signals from the slide content itself.

| Slide / Element | Surface Message | Ground Truth |
|---|---|---|
| Slide 2: "SDK v2.0 key features complete*" | All SDK features done | Compiler backend for custom ops not delivered — critical gap for Velox (who requires custom op support) |
| Slide 4: NPU 52 TOPS vs 64 TOPS spec | Performance characterization complete | 18.75% miss — below the R8 override threshold (≥15%). Meets Override Trigger R8. |
| Slide 4: Sustained TOPS 41 vs 48 spec | Measured performance data | 14.6% sustained miss — Velox's integration criterion is "≥60 TOPS sustained." 41 TOPS fails this criterion. |
| Slide 5: "Compiler backend — custom ops: Deferred to v2.1" | Minor feature deferral | Velox requires full custom operator coverage (Slide 6). Deferred feature = Velox integration criterion cannot be met on current schedule. |
| Slide 6: "Velox has requested a technical deep-dive session for Week 15" | Customer engagement milestone | Customer has seen preliminary performance numbers and has concerns — requesting pre-delivery technical review before committing to the evaluation |
| Slide 7: Schedule slipped twice (Week 14 → Week 16 → Week 18) | Schedule adjustment | Two sequential slips, 4 weeks total. Q3 design-in "maintained" only if 8-week evaluation completes by Q3 — no buffer remains. |
| Slide 8: "All critical technical risks closed" | Risk register clean | RISK-003 and RISK-004 were closed, but the NPU performance miss (Slide 4) is not listed as a risk — it has been framed as "characterization results" rather than a risk item. |
| Slide 6: Velox integration criterion "≥60 TOPS sustained" | Spec confirmation | Current measured sustained TOPS: 41. Velox criterion: ≥60. Gap: 31.7%. Current silicon will fail the primary Velox integration criterion. |

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | 🔴 Red |
| Override Triggers | R8 (52 TOPS vs 64 TOPS spec — 18.75% below committed specification), R6 (Slide 2 executive summary and Slide 3 milestone tracker are all-green while Slides 4 and 5 carry NPU performance miss and SDK gap that will cause Velox integration criteria to fail) |
| Missing Evidence | Jira, commit log, PM narrative, speaker notes absent — system must note these gaps and work from slide content alone |
| Critical requirement | The system must cross-reference the NPU performance figures (Slide 4) against the Velox integration criteria (Slide 6) and identify that current silicon fails the primary evaluation criterion. This cross-slide signal extraction is the core test of this format. |

### Expected Key Findings (from slide content alone)

1. **NPU TOPS Miss Violates Velox Integration Criterion (Confirmed from Slides 4 and 6):** Slide 4 records sustained TOPS at 41. Slide 6 records the Velox integration criterion at ≥60 TOPS sustained. This 31.7% gap means that regardless of sample delivery timing, the current silicon will fail Velox's primary evaluation criterion. The slide deck presents these two data points four slides apart with no cross-reference — they must be connected by the analyst, not the presenter.

2. **SDK Custom Operator Gap Disqualifies Velox Integration (Confirmed from Slides 5 and 6):** Slide 5 records that the compiler backend for custom operators has been deferred to SDK v2.1. Slide 6 records that Velox requires "full custom operator coverage for Velox proprietary model layer types." The deferred SDK feature is a disqualifying gap for the Velox evaluation. The asterisk on "SDK v2.0 key features complete" in Slide 2 conceals this from the executive summary.

3. **Two Sequential Schedule Slips (Confirmed from Slide 7):** Customer sample delivery slipped from Week 14 → Week 16 → Week 18 — two sequential 2-week revisions totaling 4 weeks. The Q3 design-in decision timeline is described as "maintained" but with zero remaining buffer if the 8-week evaluation proceeds as planned. Any further slip eliminates the Q3 window.

4. **Velox Deep-Dive Request Signals Customer Concern (Structural — Slide 6):** A pre-delivery "technical deep-dive session" requested by a hyperscaler customer on NPU performance results is not a routine engagement milestone. It is the structural pattern of a customer who has seen preliminary numbers and wants an explanation before committing to the evaluation — consistent with awareness of the TOPS gap.

5. **NPU Risk Not Listed in Risk Register (Structural — Slides 4 and 8):** Slide 8 risk register has two entries, both rated Low/Medium, and states "all critical technical risks closed." The 18.75% NPU TOPS miss recorded in Slide 4 is not listed as a risk. The absence of a material finding from the risk register is itself a structural signal — the Slide 8 "clean" register was constructed after the Slide 4 miss was measured.

### Expected Questions (Calibration Reference)

1. **[Defensive/Accountability]:** Slide 4 records NPU sustained TOPS at 41. Slide 6 records the Velox Computing integration evaluation criterion at ≥60 TOPS sustained — a gap of 31.7% on the primary evaluation metric. Customer engineering sample delivery is scheduled for Week 18, and the Velox technical deep-dive session is scheduled for Week 15. What will be presented at the Week 15 deep-dive to explain the 41 TOPS sustained performance against Velox's 60 TOPS criterion — specifically, is the response that recovery is achievable before the Week 20 evaluation kickoff through software optimization, or that the criterion must be renegotiated, and which of these positions has been reviewed by the executive team before the Week 15 meeting?

2. **[Strategic/Scale-Out]:** The Eon-AI custom NPU is positioned as the inference compute engine for the broader product roadmap. The current NPU has achieved 52 TOPS peak and 41 TOPS sustained against a 64/48 TOPS specification — a 14–19% gap. If the shortfall originates in the NPU microarchitecture (memory bandwidth scheduling, operator fusion efficiency, or pipeline stall rates) rather than in a fixable firmware configuration, the same gap will propagate to every product that inherits this NPU design. Before the Week 15 Velox deep-dive, has the NPU architecture team performed a root-cause analysis that establishes whether the TOPS gap is recoverable through compiler/runtime tuning on existing silicon, or whether it requires a microarchitectural change that would only be available in the next NPU revision?

3. **[Strategic/Ecosystem Moat]:** Velox Computing's design-in decision for the Athena-2 AI training cluster node determines whether Eon-AI establishes a hyperscaler reference design — the category of customer win that creates ecosystem pull, SDK adoption momentum, and competitive defensibility against NVIDIA and AMD inference accelerator offerings. Slide 6 records that the technical deep-dive is requested by Velox before sample delivery — and Velox's integration criteria include both the TOPS threshold that current silicon does not meet and the custom operator coverage that SDK v2.1 has deferred. At what point in the evaluation process does Velox commit its engineering resources to an alternative AI accelerator evaluation, foreclosing the Eon-AI competitive window regardless of future recovery — and has that threshold been identified and communicated to the executive team before the Week 15 meeting?
