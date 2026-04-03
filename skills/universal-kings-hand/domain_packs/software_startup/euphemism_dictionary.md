# Euphemism Dictionary — Software Startup

> Reference knowledge base for The King's Hand. Maps corporate euphemisms and
> softened language commonly found in software startup status reports, board
> updates, all-hands meetings, and investor communications to their ground
> truth meaning and status classification.

---

## Core Principle

Software startups under pressure develop predictable language patterns to package bad news as neutral or positive updates. These patterns are especially refined in startups because: (1) founders must maintain investor confidence to survive, (2) engineering managers operate in a culture that celebrates "shipping" and punishes "blocking," and (3) the speed of iteration creates a culture where acknowledging problems feels like admitting failure rather than practicing diligence. The more existential the threat (runway, churn, key departures), the more polished the euphemism becomes.

---

## Translation Table

| # | Official Report Language | Ground Truth | Status Impact |
|:--|:------------------------|:-------------|:-------------|
| 1 | "We're iterating on the architecture" | Core system design is failing under real-world load or requirements; the team is rebuilding fundamental components | 🟡 Yellow -> 🔴 Red — architectural crisis |
| 2 | "Strategic pivot" | Product-market fit has not been found; the current direction is failing; changing course to something unvalidated | 🔴 Red — existential business risk |
| 3 | "Optimizing our burn rate" | Running out of money; cutting costs to extend runway; layoffs or hiring freeze likely imminent | 🔴 Red — financial survival threat |
| 4 | "The team is being restructured for efficiency" | Layoffs. Engineers have been let go. The remaining team is under-resourced for the current workload | 🔴 Red — team capacity crisis |
| 5 | "We deprioritized that feature" | Engineering said it is impossible (or prohibitively expensive) with the current architecture; the feature was abandoned, not deprioritized | 🟡 Yellow — architectural constraint |
| 6 | "Moving to a microservices architecture" | The monolith is unmaintainable; the team cannot ship safely in the current codebase; this migration will consume 3-6 months of engineering capacity | 🟡 Yellow -> 🔴 Red — long-term velocity freeze |
| 7 | "Focusing on core metrics" | Other metrics (churn, NPS, support tickets, response time) are terrible; the team is selectively reporting the few numbers that look good | 🟡 Yellow — selective reporting |
| 8 | "Building internal tooling" | Manual processes are breaking down at current scale; engineers are spending significant time on tasks that should be automated; operational overhead is consuming engineering capacity | 🟡 Yellow — scaling failure |
| 9 | "Customer success optimization" | Churn is high; customers are leaving or failing to renew; the problem has grown large enough to need a named initiative | 🟡 Yellow -> 🔴 Red — retention crisis |
| 10 | "Technical evaluation in progress" | The team is stuck; the current approach has failed and no alternative has been identified; "evaluation" means nobody knows what to do next | 🔴 Red — engineering blocked |
| 11 | "We're investing in platform stability" | Production is unreliable; outages are frequent enough to threaten customer retention; this is emergency repair work disguised as proactive investment | 🔴 Red — reliability crisis |
| 12 | "Aligning engineering and product priorities" | Engineering and product teams are in conflict; they disagree on what to build or how to build it; alignment sessions mean the disagreement has escalated to leadership | 🟡 Yellow — organizational dysfunction |
| 13 | "Scaling the team to meet demand" | The current team is overwhelmed; delivery commitments cannot be met with existing headcount; emergency hiring in progress, but new engineers will not be productive for 3-6 months | 🟡 Yellow — capacity crisis |
| 14 | "Improving developer experience" | The development environment is so broken that engineers spend 20-40% of their time fighting tooling instead of building product; CI is slow or flaky, local dev setup is unreliable | 🟡 Yellow — velocity drag |
| 15 | "We're exploring partnership opportunities" | The company cannot build what it needs alone; either the technology is beyond the team's capability or the go-to-market requires distribution the company does not have | 🟡 Yellow — capability gap |
| 16 | "Sunsetting a legacy component" | A core system has degraded beyond repair; the replacement is not ready; users of the legacy system will experience disruption during transition | 🟡 Yellow -> 🔴 Red — migration risk |
| 17 | "Right-sizing our infrastructure" | Cloud costs have spiraled out of control; the team over-provisioned or architected wastefully; this is cost cutting, not optimization | 🟡 Yellow — financial waste |
| 18 | "The market is taking longer to mature than expected" | Sales are far below plan; the demand the company predicted does not exist yet (and may never); revenue targets will be missed | 🔴 Red — revenue risk |
| 19 | "We're in a competitive evaluation with the customer" | The customer is seriously considering a competitor; the deal is at risk; the product may not be competitive on features, price, or reliability | 🟡 Yellow -> 🔴 Red — deal risk |
| 20 | "Conducting a thorough security review" | A security vulnerability or breach has been discovered; scope and impact are being assessed; customer notification may be required | 🔴 Red — security incident |
| 21 | "Streamlining our release process" | The release process is broken; deployments are painful, slow, or dangerous; engineers dread release day | 🟡 Yellow — deployment friction |
| 22 | "Managing technical debt proactively" | Technical debt has reached a level where it can no longer be ignored; this phrase appears when leadership finally acknowledges a problem engineers have been flagging for months | 🟡 Yellow — debt crisis acknowledged |
| 23 | "Transitioning to a new data architecture" | The current database or data infrastructure cannot handle the workload; a multi-month migration is required; data integrity risks during transition | 🟡 Yellow -> 🔴 Red — data infrastructure crisis |
| 24 | "Refining our go-to-market strategy" | The current GTM approach is not working; sales cycle is too long, conversion is too low, or the target market segment is wrong; this is a restart, not a refinement | 🔴 Red — go-to-market failure |
| 25 | "Building for the long term" | Short-term metrics are bad; the team is reframing underperformance as deliberate strategic patience; used to justify continued spending despite poor results | 🟡 Yellow — potential denial |

---

## Pattern Recognition Guidelines

### Softening Language Indicators

When any of the following words appear in a startup status report, they are softening an underlying problem:

- **"Iterating"** — used to normalize architectural rework as routine product development; signals the current approach is not working
- **"Optimizing"** — used to frame cost cutting or emergency repair as proactive improvement; the thing being "optimized" is probably failing
- **"Investing in"** — used to reframe emergency spending (hiring, infrastructure, tooling) as strategic allocation; the "investment" is usually reactive, not planned
- **"Exploring"** — used to disguise the fact that the planned approach has failed and no replacement exists; "exploring" means the team does not know what to do
- **"Aligning"** — used to hide unresolved conflict between teams, functions, or individuals; alignment sessions mean disagreement has escalated
- **"Focusing on"** — used to draw attention away from metrics or areas that are failing; whatever follows "focusing on" is probably the one good metric
- **"Transitioning to"** — used to normalize a disruptive change as planned evolution; the transition is usually forced by failure of the current approach
- **"Right-sizing"** — used to frame layoffs or cost cuts as rational calibration; the original sizing was wrong and the correction is painful

### Escalation Language (Inverted Signals)

When startup reports use direct, specific language about problems, the situation is often less severe than when the language is polished. Watch for these positive signals:

- **Explicit problem statement with named owner and timeline:** signals healthy risk management; the team is confronting the issue, not hiding it
- **Specific bug IDs, error rates, or incident numbers cited:** signals the team has observability and is tracking against data; this is a well-managed problem
- **"We were wrong about X"** or **"Our assumption about X was incorrect":** signals intellectual honesty and willingness to course-correct; rare and valuable in startup culture
- **Sudden disappearance of a previously tracked risk item:** signals the risk was not resolved; it was removed from the tracker or absorbed into a euphemism; this is the strongest red flag — silence where there should be noise

### Compound Signals

When multiple euphemisms appear in the same report section, the combined signal is almost always worse than any individual phrase:

- "Iterating on the architecture" + "scaling the team" = architecture is failing AND the team is too small to fix it = 🔴 Red
- "Optimizing burn rate" + "strategic pivot" = running out of money AND the current product is not working = 🔴 Red — existential risk
- "Customer success optimization" + "focusing on core metrics" = churn is high AND the team is selectively reporting to hide it = 🔴 Red
- "Improving developer experience" + "streamlining release process" = engineering tooling is broken across the board; velocity is severely impaired = 🟡 Yellow -> 🔴 Red
- "Building internal tooling" + "scaling the team" = operational processes cannot handle current load AND there are not enough people; growing pains that are not being managed = 🟡 Yellow
- "Aligning engineering and product" + "deprioritized feature" = teams disagree and the disagreement is being resolved by cutting scope rather than making a decision = 🟡 Yellow

---

## Domain-Specific Language Categories

### Schedule and Delivery

The most common euphemisms used to disguise delivery problems:
- "Adjusting our roadmap" (severity: 🟡) — schedule has slipped; commitments being walked back
- "Phased rollout" (severity: 🟡) — cannot deliver the full scope; breaking it into smaller pieces to buy time
- "We're being thoughtful about the release" (severity: 🟡 -> 🔴) — the release is not ready; quality is too low to ship
- "Moving to bi-weekly releases" (from weekly) (severity: 🟡) — deployment pipeline or code quality makes frequent releases too risky

### Quality and Technical

The most common euphemisms used to disguise quality problems:
- "Hardening sprint" (severity: 🟡 -> 🔴) — production stability is poor enough to warrant stopping feature work
- "Paying down technical debt" (severity: 🟡) — debt has accumulated to the point where it is blocking feature delivery
- "Performance optimization" (severity: 🟡) — the product is too slow for users; latency is likely causing churn
- "Improving test coverage" (severity: 🟡) — test coverage is dangerously low; the team has been shipping without adequate testing

### Team and Organizational

The most common euphemisms used to disguise people problems:
- "Organizational restructuring" (severity: 🟡 -> 🔴) — layoffs, reorgs, or leadership changes; team stability disrupted
- "Bringing in senior leadership" (severity: 🟡) — current leadership is overwhelmed or has lost the confidence of the board
- "Distributed team growing pains" (severity: 🟡) — remote collaboration is not working; communication breakdowns causing delivery problems
- "Investing in engineering culture" (severity: 🟡) — engineer morale or retention is poor; likely responding to exit interview feedback

### Financial and Business

The most common euphemisms used to disguise financial problems:
- "Extending our runway" (severity: 🔴) — cutting costs because money is running out
- "Efficient growth" (severity: 🟡) — growth has slowed or stopped; reframing as intentional discipline
- "Revenue diversification" (severity: 🟡) — primary revenue source is declining or unreliable
- "Bridge financing" (severity: 🔴) — the company needs emergency funding to survive until the next round

### Customer and Market

The most common euphemisms used to disguise customer problems:
- "Evolving customer needs" (severity: 🟡) — customers want something different from what was built; product-market fit issue
- "Customer education initiative" (severity: 🟡) — customers cannot figure out how to use the product; UX or onboarding failure
- "Strategic account management" (severity: 🟡 -> 🔴) — key accounts are at risk; dedicated resources assigned to prevent churn
- "Market repositioning" (severity: 🔴) — the target market was wrong; starting over with positioning and messaging

---

## Usage in Analysis

When The King's Hand encounters any phrase from the translation table or any softening language indicator:

1. **Translate immediately** — replace the startup language with the ground truth in internal reasoning. "We're iterating on the architecture" becomes "core system design is failing."
2. **Assess status impact** — apply the classification from the table. If the translation yields a Red signal, the status is Red regardless of other positive signals.
3. **Look for compound signals** — check if multiple euphemisms cluster in the same report section or the same reporting period. Compound signals are almost always worse than individual ones.
4. **Cross-reference with evidence** — verify the translation against sprint data, deployment logs, customer metrics, and financial data. A euphemism confirmed by data becomes a high-confidence finding. A euphemism without supporting data is a flag for investigation.
5. **Check for missing topics** — note areas that should be discussed but are absent from the report. A startup that talks about features but never mentions churn, runway, or technical debt is omitting critical information. Silence is often the strongest signal.
6. **Report in Module 3** — include the translation explicitly in the cross-layer friction analysis, naming the specific language used and what it actually means. Quote the original language from the document alongside its translation so the reader can verify the interpretation.
