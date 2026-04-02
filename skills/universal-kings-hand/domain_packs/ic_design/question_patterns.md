# Question Patterns — The King's Three Questions Design Templates

> Reference knowledge base for The King's Hand. Provides 15 high-impact
> question templates across the three question types. Each template is a
> parameterized scaffold — fill in project-specific numbers, team names,
> and failure scenarios from the analysis. A template with blanks is useless;
> a template filled with the project's own evidence is a weapon.

---

## Core Principle: Why Questions Fail

A question fails when a project manager can answer it without acknowledging
the real problem. The three failure modes:

| Failure Mode | Example | Why It Fails |
|---|---|---|
| **Too abstract** | "Are you confident in the schedule?" | "Yes, we're working hard on it." |
| **Missing worst-case anchor** | "Is the customer happy?" | "We had a good call last week." |
| **No named accountability** | "Are there any risks to the workaround?" | "The team is monitoring it closely." |

A question is unanswerable when it: (1) names a specific number or event from
the evidence, (2) forces acknowledgment of the worst-case scenario, and
(3) demands a named owner, a specific Plan B, or a quantified cost comparison.

---

## Type 1 — Defensive / Accountability Questions

**Purpose:** Attack the worst current technical or schedule risk. Force the
team to name a specific mitigation, a named fallback, or acknowledge that no
credible fallback exists. The PM cannot answer with effort or optimism —
only with facts or silence.

**Anatomy of a strong Defensive question:**
- Open with the specific evidence item (Jira ticket ID, commit hash, meeting
  statement, customer email)
- Name the team or individual responsible for the decision
- Demand a concrete deliverable: a Plan B with timeline, a named person
  accountable for the fix, or a specific number (cost, date, probability)
- Close with the worst-case consequence if no answer is available

---

### Template D-1: Hardware-to-Software Blame Transfer

> In [meeting/document, date], [HW team lead] confirmed that [hardware defect
> description] requires [metal spin / tape-out revision / architectural change]
> estimated at [$X and Y weeks], and this option was rejected by [PM/decision
> maker]. The software workaround currently in production causes [specific PPA
> degradation: e.g., +Xms latency, −Y% throughput, Z× power increase]. Who
> authorized classifying this as an acceptable permanent solution — and what
> is the explicit fallback plan if [key customer / certification body] rejects
> the workaround configuration during their [validation test / certification
> audit]?

**When to use:** Any time a hardware defect has been handed to the software
team to "fix" with a workaround, and the PM's report omits the hardware origin.

---

### Template D-2: Safety / Compliance Violation

> [Safety standard, e.g., ASIL-D / ISO 26262 / IEC 61508] requires
> [specific timing / redundancy / error rate criterion]. The current [workaround
> / system configuration] produces [measured violation: e.g., Xms latency
> vs. Yms deadline, Z% error rate vs. W% limit]. [Name of safety lead /
> certification engineer] flagged this on [date]. Who is the named individual
> responsible for the compliance gap resolution — and what is the certification
> body's response when they discover this deviation during audit?

**When to use:** Any time a safety monitor timeout has been extended, a
real-time deadline is being violated, or a functional safety certification
is at risk from a software workaround.

---

### Template D-3: Customer Commitment Shortfall

> [Customer name] was committed [specific spec: X TOPS / Y µA standby /
> Z ms latency / W dBm TX power] in [contract / NDA / design-in agreement
> date]. Current measured performance is [actual value] — a [N%] gap. The
> [algorithm / compiler / BSP] team has confirmed that [software optimization
> / tuning] can recover at most [recoverable delta], leaving a residual gap
> of [remaining shortfall] that requires [hardware fix description]. What
> is the plan for the conversation with [customer name]'s [VP/CPO/engineering
> lead] — and has anyone calculated the contract penalty exposure if they
> trigger the [performance / delivery] clause?

**When to use:** Any time a committed specification — TOPS, power, latency,
coverage, throughput — cannot be met by software optimization alone.

---

### Template D-4: Metric Manipulation / Indicator Selection Bias

> The [weekly report / dashboard] reports [metric A, e.g., defect density]
> as [improving value] — the best in project history. However, [metric B,
> e.g., regression pass rate / test coverage] has [degraded from X% to Y%]
> over the same period, and [metric C, e.g., firmware size / workaround count]
> has increased [from X to Y, +Z%]. [Metric A] improves when [denominator,
> e.g., code size] increases — which it has by [N%], primarily from [workaround
> / exception handler] additions. Who chose to feature [metric A] in the
> executive summary while [metric B] was declining — and what is the current
> regression pass rate target before the project is considered ready for
> [customer delivery / carrier certification]?

**When to use:** When a positive-looking metric is being used to mask a
negative-trending metric in the same report period.

---

### Template D-5: Serial Schedule Slip Pattern

> The [tape-out / software delivery / customer sample] date has been revised
> [N times] in [X weeks]: from [original date] to [revision 1] to [current
> date]. Each revision was recorded as [administrative update / minor schedule
> refinement] without a root cause analysis. What is the engineering root
> cause of the pattern — not the proximate reason for each individual slip —
> and who is the named owner of the corrective action plan that prevents a
> [N+1]th revision?

**When to use:** When a project has experienced two or more schedule slips in
rapid succession, each individually rationalized without diagnosing the
underlying systemic cause.

---

## Type 2 — Scale-Out Strategic Questions

**Purpose:** Challenge whether this project's technical foundation — its BSP,
its SDK, its algorithm, its hardware architecture — can be reused across the
product line, or whether the technical debt accumulated here will become a
permanent tax on future chip generations. The PM cannot answer with "we're
focused on the current tape-out" — the question forces a cost-of-carrying
calculation.

**Anatomy of a strong Scale-Out question:**
- Name the specific technical debt item (not "workarounds in general")
- Project it forward across N product generations or M SKUs
- Demand a specific cost estimate or architecture decision
- Raise the risk of the debt outliving its host project

---

### Template S-1: Debt Inheritance Across Chip Generations

> [Project name]'s firmware currently contains [N workarounds / the
> [specific workaround] pattern] that [specific effect: masks X hardware
> defect / reduces Y by Z% / weakens safety recovery by W×]. [Next project]
> is planned to inherit this firmware base. What is the engineering cost
> estimate to remove, replace, or harden these [N] workarounds before
> [next project]'s [tape-out / first customer shipment] — and has this
> cost been included in [next project]'s headcount and schedule plan?

**When to use:** Any time a workaround-laden firmware or driver layer is
scheduled to be inherited by a downstream chip program.

---

### Template S-2: Performance Model Carried Forward

> The [algorithm / compiler / BSP] team developed against a performance
> model that assumed [X GB/s bandwidth / Y TOPS / Z ms latency]. The actual
> measured silicon delivers [A GB/s / B TOPS / C ms] — a [D%] gap. If the
> next chip generation inherits the same [memory subsystem / bus architecture
> / interconnect topology], the same performance model divergence will repeat
> — costing another [estimated N engineer-weeks] of re-profiling and
> re-optimization. Who owns the decision to fix the [hardware root cause]
> in the next silicon revision versus carry the software compensation forward?

**When to use:** When a hardware architectural constraint has forced a
fundamental re-profiling of the software stack, and the hardware is a
candidate for carry-forward into the next generation.

---

### Template S-3: Workaround Maintenance Across SKU Portfolio

> [Specific workaround, e.g., GPIO polling wake / retry logic / data
> throttling] was implemented by [engineer name / team] in [BSP version].
> It is expected to be maintained across [N] derivative SKUs over [Y] years.
> What is the cumulative maintenance cost of this patch — in engineer-hours
> per SKU per year, multiplied across the portfolio — versus the one-time
> cost of fixing the underlying [hardware / architecture] defect in the next
> silicon revision? Has this comparison been presented to the hardware VP?

**When to use:** When a single workaround will be ported to multiple product
variants, each requiring independent testing and maintenance effort.

---

### Template S-4: SDK / AI Compiler Portability

> The [SDK / AI compiler / algorithm framework] was optimized for [this
> chip's specific characteristics: e.g., 200 GB/s DDR bandwidth, 30 TOPS
> isolated NPU, specific memory hierarchy]. The current silicon delivers
> [actual characteristics]. If the next chip generation changes [bus width /
> memory type / NPU architecture], how much of the [SDK / compiler]
> optimization work is portable versus must be rewritten from scratch —
> and is there an abstraction layer in the current architecture that would
> allow portability, or is the [SDK / compiler] tightly coupled to this
> specific silicon's (flawed) characteristics?

**When to use:** When an AI SDK or compiler has been heavily optimized around
hardware characteristics that are either flawed or chip-specific.

---

### Template S-5: Test Infrastructure Scalability

> Test coverage has [plateaued at X% / declined from X% to Y%] while the
> codebase has grown [from A MB to B MB, +C%] from workaround and exception
> handler additions. The [N%] of the codebase that is untested contains the
> most recently added code — which is, by definition, the highest-risk code.
> What is the plan to restore test coverage to [original target]% before
> [tape-out / MP release] — and what is the estimated engineering cost of
> retrofitting tests to the [M] workaround modules that currently have no
> automated test coverage?

**When to use:** When firmware size growth from workarounds has outpaced test
additions, leaving the newest (riskiest) code paths untested.

---

## Type 3 — Ecosystem Moat Strategic Questions

**Purpose:** Challenge whether this project's deliverables — its software
stack, its SDK, its certification, its customer relationship — build lasting
competitive advantage and customer lock-in, or whether the current technical
crisis is eroding those assets before they can be converted into market
position. The question MUST include a worst-case failure scenario so the PM
cannot answer with "yes, we are aware of the asset."

**Anatomy of a strong Ecosystem Moat question:**
- Name the specific strategic asset at stake (AUTOSAR MCAL, AI SDK ecosystem,
  carrier certification, developer community, design-win pipeline)
- Name the specific failure scenario that threatens it (customer rejection,
  benchmark failure, spec gap disclosed, competitor filling the vacuum)
- Ask what the competitive window looks like AFTER that failure scenario
  materializes — not just whether the asset exists today
- Demand evidence that the business development / commercial team is operating
  with accurate technical information

---

### Template E-1: Competitive Asset Buried by Crisis

> [Strategic asset, e.g., AUTOSAR MCAL stack / BLE 5.3 + Matter integration /
> PCIe Gen5 validation] was completed [date / milestone] and represents a
> genuine competitive differentiator against [named competitor, e.g., NXP /
> Nordic Semiconductor / Qualcomm] in [market segment]. If [current crisis
> outcome: e.g., Continental AG publishes a qualification failure / customer
> benchmark reveals TOPS gap / datasheet spec is found to be incorrect], how
> long does the competitive window for [strategic asset] remain open before
> [named competitor] captures the [specific customer / market opportunity]
> it was intended to unlock — and is the business development team currently
> operating with accurate knowledge of the [crisis probability / failure
> timeline]?

**When to use:** Any time a genuine technical achievement is being shadowed
by a crisis that, if it becomes public, will prevent the asset from being
converted into market position.

---

### Template E-2: Specification Integrity and Developer Trust

> [Product name] is marketed with [specific spec, e.g., <8µA standby /
> 100 TOPS / 30ms latency]. The engineering team knows the actual delivered
> value is [actual measured value] — a [N%] gap. [N customers / M evaluation
> kits] are currently evaluating the product against the published spec.
> When [customer segment, e.g., IoT device makers / hyperscaler customers]
> discover the gap during their own characterization, what is the damage to
> the [brand / developer community / design-in pipeline] — and what is the
> plan for proactive disclosure versus waiting for customers to find it?

**When to use:** When a datasheet specification has not been updated to reflect
a PPA degradation from a firmware workaround, and customers are evaluating
against the outdated spec.

---

### Template E-3: Certification as Moat

> [Certification, e.g., ASIL-D / 3GPP Release 17 / BLE SIG / Matter / FCC
> Part 27] is the gatekeeping requirement for [market segment, e.g., European
> automotive OEM / carrier approval / US spectrum license]. The current [system
> configuration / workaround] [specific violation: e.g., violates ASIL-D
> 100ms deadline / reduces max TX power below 3GPP minimum / exceeds power
> spectral density limits]. If [certification body] discovers this during
> [audit / test], what is the fastest possible path to certification from
> that point — and does [named competitor] already hold [equivalent / superior]
> certification that would allow them to fill the customer commitment while
> the company is in remediation?

**When to use:** When a regulatory or industry certification is on the critical
path to market entry and a current technical deficiency puts that certification
at risk.

---

### Template E-4: OEM / Customer Relationship as Strategic Asset

> [Customer name]'s [flagship product / platform / procurement cycle] represents
> [N years / $X annual revenue / Y% of addressable market] of potential
> relationship value beyond the current design-in. [Customer name] has
> [escalated / threatened alternate sourcing / initiated competitor evaluation]
> due to [specific event: schedule slip / spec gap / quality issue]. At what
> point in the [escalation / competitor evaluation] process does [customer
> name]'s internal qualification infrastructure commit to a competitor — after
> which the relationship value is permanently lost regardless of technical
> recovery — and has that threshold date been identified and communicated to
> the executive team?

**When to use:** When a Tier-1 customer has issued a formal escalation or
initiated alternate sourcing, and the relationship's long-term value exceeds
the value of the current design-in.

---

### Template E-5: Ecosystem / Developer Community Lock-In

> [SDK / AI compiler / developer toolchain] defines whether this chip becomes
> a commodity or a platform. The current [SDK version / compiler state] is
> [specific limitation: optimized against wrong performance model / locked to
> this silicon's flawed characteristics / lacking [feature] that [competitor]
> provides]. If [competitor platform, e.g., NVIDIA CUDA / Arm NN / Qualcomm
> AI Engine] captures the developer community during the [N months] required
> to fix [current SDK limitation], what is the realistic recovery path for
> [product name]'s ecosystem position — and has the product management team
> modeled the scenario where technical recovery happens but developer community
> loyalty does not follow?

**When to use:** When an AI SDK or software developer ecosystem is at risk
because the underlying silicon's technical crisis is consuming the engineering
resources that should be building developer-facing tooling and documentation.

---

## Template Selection Guide

Use this matrix to select the most impactful question types for a given project:

| Signal in the Data | Highest-Impact Question Types |
|---|---|
| Hardware defect hidden as software fix | D-1, S-1, S-3 |
| Safety / compliance violation | D-2, E-3 |
| Customer commitment (spec) shortfall | D-3, E-2, E-4 |
| Serial schedule slips | D-5, E-4 |
| Metric manipulation / defect density theater | D-4, S-5 |
| Performance model divergence (HW vs SW) | D-3, S-2, S-4 |
| Customer escalation / alternate sourcing | D-3, E-4 |
| Strategic asset buried by crisis | E-1 |
| SDK / AI compiler at risk | S-4, E-5 |
| Workaround proliferation across portfolio | S-1, S-3 |
