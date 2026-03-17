# Evaluation Rubric — The King's Hand Output Quality Assessment

> Scoring criteria for evaluating The King's Hand system outputs against
> test cases. Each output is scored across 12 categories. This rubric
> is designed to be applied by a junior analyst with no semiconductor
> domain expertise. See "Scoring Without Domain Expertise" before
> beginning any evaluation.

---

## Scoring Without Domain Expertise

You do not need to know what "AXI bus contention" or "formal verification timeout" means to score most categories in this rubric. The majority of scoring decisions are about **structural properties of the output** — not technical correctness. Follow these principles:

**For Categories 1–2 (Status accuracy):** Compare the output's status light against the Expected Status in the test case file. This is an exact match check. You do not need to evaluate whether the technical justification is correct — only whether the final status symbol matches.

**For Categories 3–4 (Workarounds and PPA):** Look for specific named items with numbers attached. The test case's "Expected Key Findings" section lists what the system should have found. Match the output's claims against that list. If the output uses a specific number (e.g., "18% throughput reduction"), that is quantified. If it says "may impact performance," that is vague — mark as Fail.

**For Category 5 (Question quality):** For each question in Module 5, ask yourself: "Could a project manager answer this question with 'Yes, we are aware of this and we are working on it'?" If yes, the question fails. If the question requires the PM to state a specific number, name a specific responsible party, or acknowledge a specific worst-case outcome, it passes.

**For Categories 6–7 (Tone):** These are mechanical checks. Scan the text for bullet symbols (`-`, `*`, `+`, numbered lists) and for the forbidden phrases listed in the category. No semiconductor knowledge required.

**For Category 8 (Code word translation):** The test case file contains a "Sanitization Map" or a list of "Expected Code Words to Detect." Compare the system's output to this list. If the system translated the listed phrases in its analysis, mark Pass.

**For Categories 9–12:** Follow the specific instructions in each category.

**When in doubt:** Mark **Partial**, not Pass or Fail. Reserve Fail for clear, unambiguous violations.

---

## Scoring Overview

Each test case evaluation produces a score across 12 categories. Each category is scored as **Pass**, **Partial**, or **Fail**.

| Rating | Definition |
|--------|------------|
| **Pass** | Fully meets the criterion with no exceptions |
| **Partial** | Meets the spirit of the criterion but has minor gaps or imprecisions |
| **Fail** | Does not meet the criterion, or contains a clear violation |

**Final Acceptance:** A test case passes when it scores **Pass** on all 12 categories. A single Fail on any category requires investigation and potentially a prompt fix. Multiple Partials on the same category across different test cases indicate a calibration issue.

---

## Category 1: Status Override Accuracy

**What to evaluate:** Does the system correctly override the official status when technical evidence demands it?

**How to score without domain expertise:** Compare the 🟢/🟡/🔴 emoji in Module 2 of the output against the "Expected Status" row in the test case metadata table. This is an exact match check.

| Test Case | Official Status | Expected Output Status |
|-----------|----------------|------------------------|
| TC-001 (ADAS-X9) | 🟡 Yellow | 🔴 Red |
| TC-002 (SmartLink-IoT) | 🟢 Green | 🟡 Yellow |
| TC-003 (Valkyrie-NPU) | 🟡 Yellow | 🔴 Red |
| TC-004 (GreenLight-Trap) | 🟢 Green | 🔴 Red |
| TC-005 (Nova-AP) | 🟢 Green | 🟡 Yellow |
| TC-006 (Titan-EV) | 🟡 Yellow | 🔴 Red |
| TC-007 (Helios-WiFi7) | 🟢 Green | 🔴 Red |
| TC-008 (Clearwater-PCIe) | 🟢 Green | 🟡 Yellow |
| TC-009 (Athena-DSP) | 🟢 Green | 🟢 Green (no override) |
| TC-010 (Mercury-Codec) | 🟡 Yellow | 🔴 Red |
| TC-011 (Stratos-RF) | 🟢 Green | 🟡 Yellow (suspected) |
| TC-012 (Ironclad-DDR) | N/A | 🟡 Yellow |
| TC-013 (Apex-ML) | 🟢 Green | 🔴 Red |
| TC-014 (Crestline-HPC) | N/A (Jira only) | 🔴 Red |
| TC-015 (Eon-AI) | 🟢 Green | 🔴 Red |
| TC-016 (Typhoon-5G) | N/A (Email only) | 🔴 Red |

**Scoring:**
- **Pass:** Correct status light AND Module 2 verdict explicitly states why the official status was overridden, citing at least one specific piece of evidence from the input
- **Partial:** Correct status light but the override explanation is vague (e.g., "several issues were found" without citing specific evidence)
- **Fail:** Wrong status light, OR correct light with no override explanation at all

---

## Category 2: False Positive Control

**What to evaluate:** Does the system avoid inventing Red or Yellow signals when the evidence does not support them?

**Primary test case: TC-009 (Athena-DSP — True Green).** This is the primary false-positive control case. The system must hold 🟢 Green and must not fabricate risks.

**Secondary check for all test cases:** For any test case where the expected status is less severe than Red (TC-002, TC-005, TC-008, TC-011, TC-012), verify that the system has not escalated to Red without evidence.

**How to score without domain expertise:** For TC-009, check that the output's status is 🟢 Green and that Module 3 does not contain specific claims about bugs, workarounds, or failures. Any specific claim that is not in the input document is a fabrication.

**Scoring:**
- **Pass:** TC-009 correctly assigned 🟢; no specific technical problems cited that are not evidenced in the input; no status assignment is worse than the expected output without explicit evidence
- **Partial:** TC-009 assigns Yellow with a vague justification, or one test case is elevated by one level with weak evidence
- **Fail:** TC-009 assigned Yellow or Red; OR any test case contains a specific claimed bug, measurement, or failure that does not appear in the input document

---

## Category 3: Workaround Detection

**What to evaluate:** Does the system identify and name specific workarounds present in the test case input?

**How to score without domain expertise:** Each test case's "Expected Key Findings" section lists the workarounds the system should detect (e.g., "GPIO polling wake," "DMA transfer-size limit"). Look for these specific terms (or close equivalents) in Module 3 of the output. Counting is sufficient — you do not need to evaluate whether the technical explanation is accurate.

| Test Case | Expected Minimum Workarounds (names to find in output) |
|-----------|--------------------------------------------------------|
| TC-001 (ADAS-X9) | ≥2: data throttling, PLL lock wait (optionally: header padding) |
| TC-002 (SmartLink-IoT) | ≥2: GPIO polling wake, baseband timer calibration |
| TC-003 (Valkyrie-NPU) | ≥2: memory retry logic, DMA flow control (optionally: PCIe stall) |
| TC-004 (GreenLight-Trap) | ≥2: watchdog timeout extension, TX power backoff (many available) |
| TC-005 (Nova-AP) | ≥2: thermal throttling firmware cap, burst-mode TOPS re-labeling |
| TC-006 (Titan-EV) | ≥2: temperature-compensation software patch, CAN FD timing workaround |
| TC-007 (Helios-WiFi7) | ≥2: RF harmonic filter workaround, MLO throughput cap |
| TC-008 (Clearwater-PCIe) | ≥2: NVMe abort spinlock, idle power state workaround |
| TC-009 (Athena-DSP) | 0 — no workarounds; system must NOT fabricate any |
| TC-010 (Mercury-Codec) | ≥2: software stream-count cap, frame-rate reduction workaround |
| TC-011 (Stratos-RF) | ≥1 suspected (calibration algorithm workaround) — confidence must be "Suspected" |
| TC-012 (Ironclad-DDR) | ≥2: formal verification waivers, functional coverage gap items |
| TC-013 (Apex-ML) | ≥2: framework re-adaptation (structural signal), performance management cap |
| TC-014 (Crestline-HPC) | ≥3: DMA transfer-size split (CRST-001), ASPM L1.2 disable (CRST-005), prefetch disable (CRST-007) |
| TC-015 (Eon-AI) | ≥2: SDK custom ops deferral, NPU performance cap / burst-mode relabeling |
| TC-016 (Typhoon-5G) | ≥1: FV-K-034 simulation waiver (formal verification workaround) |

**Scoring:**
- **Pass:** ≥ the minimum count per test case, each named specifically
- **Partial:** One fewer than the minimum, or workarounds mentioned generically without specific names
- **Fail:** 0 workarounds identified when the test case requires ≥2, OR workarounds fabricated for TC-009

---

## Category 4: PPA Quantification

**What to evaluate:** Does every identified workaround include a specific, quantified PPA cost estimate (a number with a unit)?

**How to score without domain expertise:** For every workaround named in the output, check whether a number appears alongside it. Numbers must have units (%, GB/s, mW, µs, TOPS, etc.). Vague language fails.

**Forbidden language (automatic Fail if present without a number):**
- "may impact performance," "could affect power," "potential performance degradation"
- "some overhead," "additional latency," "reduced efficiency"

**Required format examples:**
- "throughput reduced by 18%" ✓
- "idle power increased from 280 mW to 338 mW (+21%)" ✓
- "standby current increased by 25 µA" ✓
- "P99 latency increased from 3 µs to 15 µs" ✓

**Exception for TC-011 (incomplete input):** PPA cost estimates for suspected workarounds must be explicitly noted as unquantifiable due to absent measurement data. Writing "PPA cost cannot be quantified without RF measurement data" is a **Pass** for this category on TC-011.

**Scoring:**
- **Pass:** Every identified workaround has at least one specific, quantified PPA cost (number + unit)
- **Partial:** Most workarounds have quantified costs, but one uses vague language
- **Fail:** Majority of workarounds use vague "may impact" language, or PPA costs are entirely absent; OR TC-011 states a specific numeric PPA cost for a workaround that was unconfirmed

---

## Category 5: Question Quality

**What to evaluate:** Are the three questions in Module 5 unanswerable with reassuring generalities?

**How to score without domain expertise (the deflection test):** For each question, attempt to construct a response that a confident project manager could give to deflect the question without acknowledging a specific failure. Template deflection responses to test against:
- "Yes, we are aware of this and the team is working on it."
- "We have a plan in place to address this before the next milestone."
- "This is a standard risk that all projects of this type encounter."

If any of these (or a variation) would be a plausible, face-saving response to the question — the question **fails**.

If the question forces the PM to name a specific number, date, team, or worst-case scenario, it **passes** — because a deflection would be visibly non-responsive.

**Question type requirements:**
1. **[Defensive/Accountability]:** Must reference a specific risk with specific evidence, demand a concrete mitigation plan or fallback, and name the responsible team or decision
2. **[Strategic/Scale-Out]:** Must challenge whether the project's problem will infect the next product in the roadmap
3. **[Strategic/Ecosystem Moat]:** Must include a worst-case failure scenario (e.g., "at which point the competitive window closes") so the question cannot be deflected with "yes, we are tracking this asset"

**Scoring:**
- **Pass:** All 3 questions pass the deflection test; all 3 question types are present and correctly labeled
- **Partial:** 1 question could be deflected with generalities, or 1 question type is mislabeled
- **Fail:** ≥2 questions can be deflected; or question types are missing, confused, or the Ecosystem Moat question contains no worst-case failure scenario

---

## Category 6: Tone Compliance — No Bullet Lists

**What to evaluate:** Are Modules 3 and 4 written in narrative prose without bullet lists?

**How to score:** Scan Module 3 and Module 4 for any of these Markdown patterns in analytical paragraphs:
- Lines starting with `- ` or `* ` or `+ ` (bullet points)
- Lines starting with a number followed by a period or parenthesis, used in a list pattern (`1.`, `2.`, `(1)`, `(2)`)

**Exception — Tables are allowed.** A Markdown table with `|` characters is not a bullet list. The friction hotspot table at the end of Module 3 is required and should be present.

**Exception — Module 5 question labels.** The `[Defensive/Accountability]` / `[Strategic/Scale-Out]` / `[Strategic/Ecosystem Moat]` labels in Module 5 are structural markers, not bullet list items.

**Scoring:**
- **Pass:** Zero bullet or numbered lists in Modules 3 and 4 analytical prose
- **Partial:** 1 minor instance (e.g., a 2-item list that could be rewritten as prose)
- **Fail:** ≥2 bullet/numbered lists in analytical prose, or a major analytical section formatted as a list

---

## Category 7: Tone Compliance — No Softening Language

**What to evaluate:** Does Module 3 use cold, specific, direct language without hedging?

**Scan the text for these forbidden patterns:**

| Forbidden Phrase / Pattern | Why It Fails |
|---|---|
| "may be," "might be," "could potentially" | Epistemic hedge — removes accountability |
| "it appears that," "there seems to be," "it is possible that" | Avoids commitment to a finding the evidence supports |
| "some concerns exist," "challenges have been noted," "issues are being addressed" | Passive voice concealing agent — who made which decision? |
| "alignment opportunities," "areas for improvement," "potential for optimization" | Management euphemism substituting for a specific problem |
| "the team is working hard to," "progress has been made," "efforts are underway" | Motion language with no specific milestone — exactly what the system is designed to detect in input documents, and must not reproduce |
| Attributing a problem to "misalignment" or "communication issues" without naming the specific decision and the team responsible | Attribution avoidance |

**Exception:** Confidence-level labels in incomplete-evidence cases ("Suspected," "Confirmed," "Undetectable without") are not softening language — they are required.

**Scoring:**
- **Pass:** Zero instances of softening, hedging, or attribution-avoidance language in Module 3
- **Partial:** 1 minor instance in an otherwise direct analysis
- **Fail:** ≥2 instances of softening language, or a pattern of hedging throughout Module 3

---

## Category 8: Domain Accuracy — Corporate Code Word Translation

**What to evaluate:** When the test case input contains disguised corporate language (from the code words glossary), does the system correctly translate it to ground truth?

**How to score without domain expertise:** Each test case file contains a list of corporate phrases and their expected translations — either in a "Sanitization Map" table (TC-013, TC-015) or in an "Expected Key Findings" section with arrow notation (`"phrase" → probable translation`). Find these phrases in the system output and verify they have been translated (not taken at face value).

| Test Case | Key Code Words to Detect |
|-----------|--------------------------|
| TC-001 | "software optimization in progress" → AXI architectural flaw; "exploring alternative software approaches" → HW blame transfer |
| TC-002 | "firmware stability improvements" → hardware defect workaround; "power management optimizations" → spec breach |
| TC-003 | "performance tuning ongoing" → TOPS gap; "architecture refinement underway" → module boundary violation |
| TC-004 | "minor schedule refinement" → serial tape-out slippage; "positive customer engagement" → customer escalation concealed |
| TC-011 | "alternative calibration approaches being explored" → RF defect + compensation firmware; "minor schedule adjustment" → 2-week slip |
| TC-013 | "natural evolution of co-design" → performance model divergence; "resource optimization" → headcount reduction; "thorough and technically substantive discussions" → active customer escalation |
| TC-015 | "SDK v2.0 key features complete*" → compiler backend for custom ops not delivered; "technical deep-dive session requested" → customer concern about TOPS |
| TC-016 | "final validation activities" → qualification test failure being managed; "all core capabilities functional" → accurate only for nominal conditions, not customer operating profile |

**Scoring:**
- **Pass:** ≥90% of planted code words in the test case are correctly translated in the output (reflected in Module 3 analysis or Module 2 verdict)
- **Partial:** 50–89% of code words translated
- **Fail:** <50% of code words translated, or the system takes corporate language at face value without interrogation

---

## Category 9: Empowerment Quality — Module 1 Commercial Framing

**What to evaluate:** Does Module 1 (Spectrum Positioning and Empowerment Value) connect the project's technical work to a specific commercial outcome?

**Acceptable commercial outcomes:** Market position protection, customer retention, TAM expansion, regulatory access, competitive differentiation, customer lock-in, design-win pipeline, revenue timeline, safety certification access (for automotive/industrial).

**Unacceptable framing:** Generic technical descriptions like "improves BSP quality" or "enhances system performance" without connecting to a specific business consequence.

**How to score:** Find the "Core Empowerment Value" row in the Module 1 table. Ask: "Does this row name a specific commercial consequence — not just a technical benefit?" A commercial consequence names a customer, a market, a revenue stream, or a competitive position.

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
- [ ] Module 4 contains two narrative paragraphs (may be three for complex cases — mark Partial, not Fail)
- [ ] Module 5 contains exactly three labeled questions
- [ ] No `<thinking>` content visible in output
- [ ] No greeting, signature, or self-introduction

**For incomplete-evidence test cases (TC-011, TC-012, TC-014, TC-016):** Module 3 must open with a 「證據清單與分析侷限」(Evidence Inventory and Analytical Limitations) paragraph before the main analysis. If this paragraph is absent, mark Category 10 as Fail for these test cases.

**Scoring:**
- **Pass:** All checklist items satisfied
- **Partial:** 1–2 minor format deviations (e.g., Module 4 has 3 paragraphs instead of 2; evidence inventory present but not labeled)
- **Fail:** Major format violations (missing modules, wrong language, visible thinking, preamble present, evidence inventory absent when required)

---

## Category 11: Edge Case Robustness

*This category applies only to TC-011, TC-012, TC-013, TC-014, TC-015, TC-016. For TC-001 through TC-010, mark as N/A.*

**What to evaluate:** Does the system handle its specific edge case type correctly?

### For Incomplete-Evidence Cases (TC-011, TC-014, TC-016)

**Required behaviors:**
1. Module 3 opens with an Evidence Inventory paragraph naming missing document types
2. Each named finding is assigned a confidence level: **Confirmed**, **Suspected**, or **Undetectable without [X]**
3. The friction hotspot table includes a fourth column: **Evidence Confidence**
4. No specific bug IDs, measurement values, or engineering data are cited that do not appear in the input

**How to score:** Read Module 3's opening paragraph. Does it list missing document types by name (e.g., "Jira issue tracker," "Git commit log")? Does it explain what each missing source would have revealed? Check 5 specific claims in Module 3 — do they all carry confidence labels?

**Scoring:**
- **Pass:** Evidence inventory present and complete; all findings carry confidence labels; no hallucinated specifics
- **Partial:** Evidence inventory present but incomplete (e.g., missing one source type); most but not all findings carry confidence labels
- **Fail:** No evidence inventory; findings stated without confidence labels; OR specific technical data cited that does not appear in the input

### For Technical-Only Input (TC-012)

**Required behaviors:**
1. DV/engineering findings are translated into business-risk language (not just summarized as technical findings)
2. Module 4 explicitly notes that commercial context (customer name, schedule, competitive pressure) is absent and cannot be assessed from this document
3. ZQ calibration risk clustering is identified (appears in three independent finding areas)

**Scoring:**
- **Pass:** Business-risk translation present; commercial context absence flagged; ZQ clustering identified
- **Partial:** Business-risk translation present but commercial context absence not flagged, or ZQ clustering missed
- **Fail:** DV findings summarized technically without translation to business risk; commercial context absence not acknowledged

### For Adversarially Sanitized Input (TC-013)

**Required behaviors:**
1. 🔴 Red assigned despite absence of explicit anomaly keywords
2. Serial schedule slip (Week 16→20→24) explicitly cited as the primary override evidence
3. At least 2 additional structural signals identified (framework re-adaptation language, resource optimization euphemism, customer pressure language pattern)

**Scoring:**
- **Pass:** Red assigned; serial slip cited; ≥2 additional structural signals identified
- **Partial:** Red assigned and serial slip cited, but fewer than 2 additional structural signals
- **Fail:** Status light is Yellow or Green; OR serial slip not cited; OR no structural signals named

### For Real-Format Input Parsing (TC-014 Jira CSV, TC-015 PowerPoint, TC-016 Email)

**Required behaviors:**
1. System correctly parses the format-specific structure (CSV fields, slide titles, email headers)
2. Key signals from the format-specific source are extracted and cited in the analysis (e.g., Jira label values, specific slide numbers, email sender/recipient relationships)
3. The evidence inventory notes which standard document types are absent

**Scoring:**
- **Pass:** Format correctly parsed; format-specific signals cited with source attribution; evidence inventory present
- **Partial:** Format parsed with some signal extraction but key format-specific signals missed
- **Fail:** Format not parsed (analysis treats all input as undifferentiated text); key signals not extracted; evidence inventory absent

---

## Category 12: Inter-Module Consistency

**What to evaluate:** Are the findings in Module 3 consistent with the status light in Module 2 and the questions in Module 5?

**This category catches internal contradictions** — e.g., Module 2 says 🔴 Red but Module 3's friction table only has Yellow-level findings; or Module 5 asks questions about risks that Module 3 never mentioned.

**How to score:**
1. Read Module 2's one-sentence verdict. Note the stated reason for the status light.
2. Find that reason in Module 3's analysis. Is it present and supported?
3. Read Module 5's three questions. For each question, find the underlying finding in Module 3. If a question in Module 5 references a specific fact or risk, that fact must appear in Module 3.

**Scoring:**
- **Pass:** Module 2 verdict is fully supported by Module 3 evidence; all three Module 5 questions are grounded in Module 3 findings
- **Partial:** One question in Module 5 references a fact not clearly established in Module 3; or Module 2 verdict is slightly more alarming than Module 3 supports
- **Fail:** Module 2 status light is contradicted by Module 3's content; OR Module 5 questions reference facts entirely absent from Module 3

---

## Evaluation Summary Template

Use this template to record evaluation results for each test case:

```
## Evaluation: [Test Case ID] — [Test Case Name]
Date: [YYYY-MM-DD]
Evaluator: [Name/ID]

| # | Category | Rating | Notes |
|---|----------|--------|-------|
| 1  | Status Override Accuracy | Pass/Partial/Fail | |
| 2  | False Positive Control | Pass/Partial/Fail | |
| 3  | Workaround Detection | Pass/Partial/Fail | |
| 4  | PPA Quantification | Pass/Partial/Fail | |
| 5  | Question Quality | Pass/Partial/Fail | |
| 6  | Tone: No Bullet Lists | Pass/Partial/Fail | |
| 7  | Tone: No Softening Language | Pass/Partial/Fail | |
| 8  | Domain: Code Word Translation | Pass/Partial/Fail | |
| 9  | Empowerment: Commercial Framing | Pass/Partial/Fail | |
| 10 | Output Format Compliance | Pass/Partial/Fail | |
| 11 | Edge Case Robustness | Pass/Partial/Fail/N/A | |
| 12 | Inter-Module Consistency | Pass/Partial/Fail | |

**Overall:** [Pass count]/12 Pass, [Partial count]/12 Partial, [Fail count]/12 Fail
**Acceptance:** [Met / Not Met]
```

---

## Inter-Rater Reliability Guidance

When two evaluators score the same output independently, they should reach the same result on Categories 1, 2, 6, 7, and 10 — these are mechanical checks with clear pass/fail criteria that require no judgment.

For Categories 3, 4, 8, and 11, use the test case's "Expected Key Findings" section as the shared reference. Both evaluators should be working from the same expected finding list.

For Categories 5, 9, and 12, which require more judgment, use this protocol:
- If both evaluators score the same (Pass/Partial/Fail), record that score.
- If evaluators differ by one level (e.g., one scores Pass, the other Partial), discuss using the specific examples in each category's scoring description and reach consensus.
- If evaluators differ by two levels (Pass vs. Fail), escalate to the senior reviewer. This should be rare; if it happens repeatedly on the same category, the category's scoring description needs clarification.

**Target inter-rater agreement:** ≥90% exact match on mechanical categories (1, 2, 6, 7, 10), ≥80% on judgment categories (3, 4, 5, 8, 9, 11, 12).
