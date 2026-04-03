# Status Override Triggers — Software Startup

> Reference knowledge base for The King's Hand. Defines strict criteria for
> status light assignment in software startups with explicit override triggers
> that supersede official project status reports.

---

## Core Principle

**Evidence-based status always overrides official report status.**

When a startup's status update says "on track" but the sprint data, deployment logs, customer churn numbers, or engineer attrition tell a different story, The King's Hand overrides to the evidence-based status and explains exactly why. Software startups are especially prone to optimistic reporting because: (1) founders have fundraising incentives to project confidence, (2) engineering managers fear being seen as blockers, and (3) the velocity metrics that indicate real health are often poorly tracked or selectively reported.

---

## Status Definitions

### Green — On Track

The project is genuinely healthy. Engineering velocity is sustainable, product quality is high, customer metrics are strong, and the business has adequate runway. No material risks exist without a credible mitigation plan.

**All of the following must be true:**

| Criterion | Requirement |
|:----------|:-----------|
| Sprint velocity | Stable or increasing over the last 4+ sprints; no unexplained drops |
| Deployment frequency | Healthy deployment cadence maintained (daily or better for mature teams); no increase in rollback rate |
| Production stability | No P0/P1 incidents unresolved for >48 hours; incident frequency stable or declining |
| Customer churn | Monthly churn below industry benchmark for stage (<3% for SMB SaaS, <1% for enterprise); no key account at risk |
| Financial runway | >12 months of cash runway at current burn rate |
| Test coverage | Test coverage stable or increasing; no declining trend over 2+ sprints |
| Team stability | No unplanned departures of key engineers in last 90 days; hiring pipeline active for open roles |
| Technical debt | Debt reduction work is scheduled and executed regularly; no "debt sprint" deferred more than once |

**If any single criterion above fails, the project cannot be Green.**

---

### Yellow — Latent Risk

Problems are emerging but have not yet caused irreversible damage. The startup could recover with timely intervention, but the trajectory is concerning. The window for correction is open but narrowing.

**One or more of the following conditions exist:**

| Criterion | Signal |
|:----------|:------|
| Velocity decline | Sprint velocity has declined for 2+ consecutive sprints without a deliberate scope reduction decision |
| Deployment friction | Deployment rollback rate exceeds 10%; or deployment frequency has dropped >30% over 4 weeks |
| Quality regression | Test coverage declining for 2+ sprints; or bug escape rate increasing; or P2/P3 bug backlog growing >20% per sprint |
| Key customer escalation | A top-10 customer has escalated a product or reliability concern to leadership |
| Runway concern | Cash runway between 6 and 12 months at current burn rate; no active fundraise with term sheet |
| Team strain | >1 key engineer expressing burnout or dissatisfaction in 1:1s; or open roles unfilled for >60 days |
| Process erosion | CI bypassed >2 times in last 30 days; or code review turnaround >48 hours regularly |
| Scope instability | Sprint scope changed mid-sprint in 3+ of last 5 sprints |

---

### Red — Critical

Irreversible damage has occurred or is imminent without immediate intervention. The startup's ability to deliver, retain customers, or continue operating is under direct threat.

**Any one of the following conditions triggers Red:**

| Criterion | Signal |
|:----------|:------|
| Production outage | Unresolved production outage affecting >10% of users for >4 hours; or >2 major outages in 30 days |
| Key customer churn | A top-5 customer has communicated intent to cancel or not renew; or >2 key customers churned in a quarter |
| Sprint collapse | Sprint scope cut >30% due to unplanned work (incidents, emergency fixes); happening in 2+ consecutive sprints |
| Security breach | Confirmed data breach, unauthorized access, or critical vulnerability actively exploited |
| Runway crisis | Cash runway <6 months with no signed term sheet; or monthly burn rate exceeding plan by >30% |
| Team attrition | >20% of engineering team departed in a rolling 90-day period; or a sole maintainer of critical system has departed |
| Shipping paralysis | No production deployment in >2 weeks for a team that normally deploys daily; or all deployments are rollbacks |
| Regulatory/legal | Active regulatory investigation, IP litigation, or compliance failure blocking customer acquisition |

---

## Override-to-Red Triggers

These conditions **automatically override any official status to Red**, regardless of what the status report claims:

**R1. Production outage concealed or minimized in postmortem.** The postmortem describes a major outage (>1 hour, customer-affecting) using softening language ("brief service interruption," "minor degradation"), or the incident is omitted from the status report entirely. This indicates the reporting chain is corrupted — the team is hiding the severity of reliability problems from leadership.

**R2. Key engineer departure described as "team restructuring" or "organizational alignment."** When a critical engineer (sole maintainer of a core system, tech lead, or architect) leaves and the departure is framed as a planned organizational change rather than an unplanned loss, the knowledge risk is being concealed. The bus factor for the affected system has dropped to zero.

**R3. Customer churn risk described as "strategic pivot" or "focusing on ICP."** When the loss of a significant customer or customer segment is reframed as an intentional strategic decision rather than a retention failure, the underlying product-market fit or customer satisfaction problem is being hidden. Revenue at risk is being reclassified as "strategic choice."

**R4. Sprint velocity collapse explained away as "investment in quality."** When velocity drops >40% and the explanation is "we are paying down tech debt" or "investing in quality," but there is no corresponding spike in test coverage, no debt tickets being closed, and no measurable quality improvement — the team is stalled, not investing.

**R5. Deployment frequency drop with no acknowledged cause.** When the team goes from deploying daily to deploying weekly (or less) and the status report does not explicitly acknowledge the change and explain why, something is blocking deployments — likely fear of breaking production, a failing CI pipeline, or unresolved merge conflicts.

**R6. Official status is Green or Yellow while 3+ Yellow/Red signals are present in the data.** Watermelon effect confirmed. When sprint data shows declining velocity, deployment logs show increasing rollbacks, customer tickets show rising complaints, and the status report says "on track" — the reporting chain has failed. The status report is fiction.

**R7. Security vulnerability discovered but not disclosed to affected customers within required timeframe.** Active concealment of a security issue that affects customer data. Beyond the ethical problem, this creates regulatory exposure (GDPR, state breach notification laws) and, when discovered, will destroy customer trust more than the original vulnerability would have.

**R8. Runway <6 months with no active fundraise or revenue acceleration plan.** The company is approaching default and leadership is either in denial or has not communicated the urgency to the team. Every day spent on non-essential features is a day closer to running out of money.

---

## Override-to-Yellow Triggers

These conditions **automatically override Green status to Yellow**:

**Y1. "Tech debt sprint" postponed more than once.** When a planned stabilization or debt reduction sprint is repeatedly pushed back in favor of feature work, the team is accumulating debt faster than it can repay. The decision-maker is optimizing for short-term output at the expense of long-term velocity.

**Y2. Deployment frequency declining while team claims "improving process."** A team that deploys less often while describing the change as process improvement (rather than acknowledging a specific problem) is likely struggling with CI/CD reliability, merge conflicts, or deployment fear. Healthy process improvement increases deployment frequency, not decreases it.

**Y3. Test coverage declining for 2+ sprints despite active development.** New code is being shipped without tests. The test suite is becoming a less reliable safety net with each deployment. The team is building on an increasingly unstable foundation.

**Y4. Support ticket volume increasing >30% quarter-over-quarter without corresponding user growth.** Product quality is declining. Existing users are encountering more problems. The support team is absorbing the cost of engineering quality issues. If support cannot keep up, customers will churn instead of filing tickets.

**Y5. Key technical decision deferred for >2 sprints.** A significant architectural or technology decision (database migration, framework upgrade, service decomposition) has been on the agenda for multiple sprints without resolution. Decision paralysis creates planning uncertainty for the entire team and often indicates unresolved disagreement among technical leaders.

**Y6. Single engineer is sole maintainer of >2 critical systems.** Bus factor risk. If this engineer becomes unavailable (illness, departure, burnout), multiple critical systems have no one who can maintain or debug them. This is not a future risk — it is a present fragility.

**Y7. Open roles unfilled for >60 days in a team that is already understaffed.** The hiring pipeline is not working. The existing team is absorbing the workload of missing engineers, leading to burnout and quality degradation. If the roles are unfilled because they are hard to fill, the job description or compensation may be misaligned with market.

---

## Status Assessment Process

When analyzing a software startup project document, The King's Hand follows this sequence:

1. **Collect all evidence** from the input documents (sprint reports, deployment logs, incident postmortems, customer communications, financial data, meeting notes, Jira/Linear data, git commit history).
2. **Check Override-to-Red triggers first** — if any R1-R8 condition is present, the status is Red regardless of all other factors.
3. **Check Override-to-Yellow triggers** — if no Red triggers but any Y1-Y7 condition is present, the status is at least Yellow.
4. **Assess base status** — only if no override triggers are present, evaluate against the Green criteria table. All Green criteria must be met simultaneously.
5. **Compare with official status** — if the assessed status is worse than the official report, override and explain the specific evidence that contradicts the official classification.
6. **Never upgrade** — The King's Hand never assigns a better status than the official report. If official says Yellow and evidence supports Yellow, keep Yellow. The system only overrides in the direction of worse status.

---

## Evidence Quality Requirements

| Evidence Type | What It Reveals | Absence Impact |
|:-------------|:---------------|:---------------|
| Sprint velocity data (Jira, Linear, Shortcut) | Whether the team is delivering at a sustainable pace; trend direction | Cannot assess engineering health — flag as critical data gap |
| Deployment logs (CI/CD pipeline, deploy history) | Deployment frequency, rollback rate, lead time for changes | Cannot assess delivery capability — flag as data gap |
| Incident/postmortem reports | Production reliability, MTTR, incident frequency trends | Cannot assess operational stability — flag as data gap |
| Customer communications (support tickets, NPS, churn data) | Customer satisfaction, product quality perception, retention risk | Cannot assess market risk — flag as data gap |
| Financial data (burn rate, runway, revenue) | Business viability, growth trajectory, fundraising urgency | Cannot assess business survival risk — flag as critical data gap |
| Git commit history and PR data | Team activity patterns, code review quality, contributor distribution | Cannot assess team health or bus factor — flag as data gap |
| Meeting notes and decision logs | Team alignment, decision velocity, unresolved disagreements | Cannot assess organizational health — flag as data gap |
| Hiring pipeline data | Team growth trajectory, role fill rates, attrition backfill | Cannot assess team stability — flag as data gap |

## Confidence Levels

| Level | Evidence Coverage | Recommendation |
|:------|:-----------------|:---------------|
| High | 6+ evidence types present with data from the last 30 days | Assessment is reliable; act on findings |
| Medium | 3-5 evidence types present; some data older than 30 days | Assessment is directional; flag gaps and request missing data before making major decisions |
| Low | Fewer than 3 evidence types present | Assessment is speculative; demand more data before acting; explicitly state which evidence types are missing and why they matter |
