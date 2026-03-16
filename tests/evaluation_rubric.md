# Evaluation Rubric — The King's Hand Output Quality Assessment

> Scoring criteria for evaluating The King's Hand system outputs against
> test cases. Each output is scored across 10 categories. Phase 1 target
> is 100% pass on all categories for the 4-case initial test suite.

---

## Scoring Overview

Each test case evaluation produces a score across 10 categories. Each category is scored as **Pass**, **Partial**, or **Fail**.

| Rating | Definition |
|--------|------------|
| **Pass** | Fully meets the criterion with no exceptions |
| **Partial** | Meets the spirit of the criterion but has minor gaps or imprecisions |
| **Fail** | Does not meet the criterion, or contains a clear violation |

**Phase 1 Acceptance:** All 4 test cases must score **Pass** on all 10 categories.

---

## Category 1: Status Override Accuracy

**What to evaluate:** Does the system correctly override the official status when technical evidence demands it?

| Test Case | Official Status | Expected Override | Pass Criteria |
|-----------|----------------|-------------------|---------------|
| TC-001 (ADAS-X9) | 🟡 Yellow | 🔴 Red | System outputs Red and names at least 2 specific override triggers |
| TC-002 (SmartLink-IoT) | 🟢 Green | 🟡 Yellow | System outputs Yellow and explains why Green is incorrect |
| TC-003 (Valkyrie-NPU) | 🟡 Yellow | 🔴 Red | System outputs Red and names at least 2 specific override triggers |
| TC-004 (GreenLight-Trap) | 🟢 Green | 🔴 Red | System outputs Red and identifies the watermelon effect pattern |

**Scoring:**
- **Pass:** Correct status light AND explicit explanation of why the official status was overridden, citing specific evidence
- **Partial:** Correct status light but vague or incomplete explanation of the override reasoning
- **Fail:** Wrong status light, OR correct status light without any override explanation

---

## Category 2: False Positive Control

**What to evaluate:** Does the system avoid assigning Red or Yellow status when the evidence does not support it?

**Note:** This category is evaluated on clean-input test cases (to be added in Phase 3). For Phase 1, score as Pass if the system does not assign a worse status than the expected output specifies.

**Scoring:**
- **Pass:** No status assignment worse than the expected output for any test case
- **Partial:** N/A
- **Fail:** System assigns Red when Yellow is expected, or Red/Yellow when Green is expected, without evidence

---

## Category 3: Workaround Detection

**What to evaluate:** Does the system identify and name specific workarounds present in the test case input?

| Test Case | Expected Minimum Workarounds |
|-----------|------------------------------|
| TC-001 (ADAS-X9) | ≥2: data throttling, PLL lock wait (plus optionally: header padding) |
| TC-002 (SmartLink-IoT) | ≥2: GPIO polling wake, baseband timer calibration |
| TC-003 (Valkyrie-NPU) | ≥2: memory retry logic, DMA flow control (plus optionally: PCIe stall workaround) |
| TC-004 (GreenLight-Trap) | ≥2: watchdog timeout extension, TX power backoff, handover retry, sleep timer aggressiveness (many available) |

**Scoring:**
- **Pass:** ≥2 workarounds identified per test case, each named specifically (not just "workarounds were found")
- **Partial:** 1 workaround identified, or workarounds mentioned generically without specifics
- **Fail:** 0 workarounds identified when the test case contains planted workarounds

---

## Category 4: PPA Quantification

**What to evaluate:** Does every identified workaround include a specific PPA cost estimate?

**Forbidden language:** "may impact performance," "could affect power," "potential performance degradation" — these are vague and unacceptable.

**Required language examples:** "standby power increased by 25%," "inference throughput reduced by 18%," "P99 latency increased from 45ns to 120ns," "battery life reduced from 2.4 years to 1.9 years."

**Scoring:**
- **Pass:** Every identified workaround has at least one specific, quantified PPA cost (number + unit)
- **Partial:** Most workarounds have quantified costs, but one or two use vague language
- **Fail:** Majority of workarounds use vague "may impact" language, or PPA costs are entirely absent

---

## Category 5: Question Quality

**What to evaluate:** Are the three questions in Module 5 unanswerable with reassuring generalities?

**Test method (human evaluation):** For each question, attempt to construct a reassuring answer that a project manager could give to deflect the question. If such an answer is possible, the question fails.

**Question requirements:**
1. **[Defensive/Accountability]:** Must target a specific risk, name a specific team or decision, and demand a concrete mitigation plan or fallback
2. **[Strategic/Scale-Out]:** Must challenge whether the project's technology can be reused across product lines
3. **[Strategic/Ecosystem Moat]:** Must challenge whether the project builds long-term customer lock-in or ecosystem value

**Scoring:**
- **Pass:** All 3 questions are specific enough that a reassuring general answer is not credible; all 3 question types are present and correctly labeled
- **Partial:** Questions are present and labeled but 1 could be deflected with generalities, or 1 question type is mislabeled
- **Fail:** ≥2 questions can be answered with vague reassurance, or question types are missing/confused

---

## Category 6: Tone Compliance — No Bullet Lists

**What to evaluate:** Are Modules 3 and 4 written in narrative prose without bullet lists?

**Automated check:** Scan Module 3 and Module 4 output for Markdown bullet point syntax (`- `, `* `, `+ `, or numbered list `1. ` used in a list pattern).

**Exception:** Tables are allowed and encouraged for structured data. Only bullet/numbered lists in analytical prose are forbidden.

**Scoring:**
- **Pass:** Zero bullet or numbered lists in Modules 3 and 4 analytical prose
- **Partial:** 1 minor instance of a list that could be rewritten as prose
- **Fail:** ≥2 bullet/numbered lists in analytical prose, or a major analytical section formatted as a list

---

## Category 7: Tone Compliance — No Softening Language

**What to evaluate:** Does Module 3 use cold, specific, direct language without hedging?

**Forbidden phrases (scan for these):**
- "may be," "might be," "could potentially," "it appears that," "there seems to be"
- "some concerns exist," "challenges have been noted," "issues are being addressed"
- "alignment opportunities," "areas for improvement," "potential for optimization"
- "the team is working hard to," "progress has been made," "efforts are underway"
- Any language that attributes a problem to "misalignment" instead of naming the specific decision and team responsible

**Scoring:**
- **Pass:** Zero instances of softening, hedging, or attribution-avoidance language in Module 3
- **Partial:** 1 minor instance of soft language in an otherwise direct analysis
- **Fail:** ≥2 instances of softening language, or a pattern of hedging throughout Module 3

---

## Category 8: Domain Accuracy — Corporate Code Word Translation

**What to evaluate:** When the test case input contains disguised corporate language (from the code words glossary), does the system correctly translate it to ground truth?

| Test Case | Key Code Words to Detect |
|-----------|--------------------------|
| TC-001 | "software optimization in progress" (= AXI architectural flaw), "exploring alternative software approaches" (= HW blame transfer) |
| TC-002 | "firmware stability improvements" (= hardware defect workaround), "power management optimizations" (= spec breach) |
| TC-003 | "performance tuning ongoing" (= TOPS gap), "architecture refinement underway" (= module boundary violation) |
| TC-004 | "minor schedule refinement" (= serial tape-out slippage), "positive customer engagement" (= customer escalation concealed) |

**Scoring:**
- **Pass:** ≥90% of planted code words are correctly translated in the analysis (either in the thinking process reflected in the output or explicitly in Module 3)
- **Partial:** 50-89% of code words translated
- **Fail:** <50% of code words translated, or the system takes corporate language at face value

---

## Category 9: Empowerment Quality — Module 1 Commercial Framing

**What to evaluate:** Does Module 1 (Spectrum Positioning and Empowerment Value) connect the project's technical work to a specific commercial outcome?

**Acceptable commercial outcomes:** Market position protection, customer retention, TAM expansion, regulatory access, competitive differentiation, customer lock-in, design-win pipeline, revenue timeline.

**Unacceptable framing:** Generic technical descriptions like "improves BSP quality" or "enhances system performance" without connecting to a specific business consequence.

**Scoring:**
- **Pass:** Module 1 empowerment value row names a specific commercial outcome with a clear causal link to the project's technical work
- **Partial:** Module 1 mentions a commercial context but the causal link to the technical work is vague
- **Fail:** Module 1 empowerment value is purely technical with no commercial framing

---

## Category 10: Output Format Compliance

**What to evaluate:** Does the output follow the required structural format?

**Checklist:**
- [ ] Output is in Traditional Chinese (繁體中文)
- [ ] Output begins directly with Module 1 heading — no greeting, no preamble
- [ ] All 5 modules present in correct order
- [ ] Module 1 contains a Markdown table with 2 rows (spectrum + empowerment)
- [ ] Module 2 contains exactly one status light emoji, one-sentence objective, one-sentence verdict
- [ ] Module 3 ends with a friction hotspot table
- [ ] Module 4 contains exactly two narrative paragraphs
- [ ] Module 5 contains exactly three labeled questions
- [ ] No `<thinking>` content visible in output
- [ ] No greeting, signature, or self-introduction

**Scoring:**
- **Pass:** All checklist items satisfied
- **Partial:** 1-2 minor format deviations (e.g., Module 4 has 3 paragraphs instead of 2)
- **Fail:** Major format violations (missing modules, wrong language, visible thinking, preamble present)

---

## Evaluation Summary Template

Use this template to record evaluation results for each test case:

```
## Evaluation: [Test Case ID] — [Test Case Name]
Date: [YYYY-MM-DD]
Evaluator: [Name/ID]

| # | Category | Rating | Notes |
|---|----------|--------|-------|
| 1 | Status Override Accuracy | Pass/Partial/Fail | |
| 2 | False Positive Control | Pass/Partial/Fail | |
| 3 | Workaround Detection | Pass/Partial/Fail | |
| 4 | PPA Quantification | Pass/Partial/Fail | |
| 5 | Question Quality | Pass/Partial/Fail | |
| 6 | Tone: No Bullet Lists | Pass/Partial/Fail | |
| 7 | Tone: No Softening Language | Pass/Partial/Fail | |
| 8 | Domain: Code Word Translation | Pass/Partial/Fail | |
| 9 | Empowerment: Commercial Framing | Pass/Partial/Fail | |
| 10 | Output Format Compliance | Pass/Partial/Fail | |

**Overall:** [Pass count]/10 Pass, [Partial count]/10 Partial, [Fail count]/10 Fail
**Phase 1 Acceptance:** [Met / Not Met]
```
