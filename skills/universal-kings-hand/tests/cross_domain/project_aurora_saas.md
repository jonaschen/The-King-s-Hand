# Test Case: Project Aurora (SaaS Platform)

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | XD-001 |
| Test Name | Green-to-Red Override — SaaS Startup Monolith Collapse |
| Domain | Software startup / SaaS |
| Primary Test Target | Status override accuracy (official Green masking Red), cross-document contradiction detection |
| Secondary Test Targets | Skip-CI deploy pattern, executive departure concealment, customer churn risk hidden in strategic language |
| Expected Status | Red (override from official Green) |
| Override Triggers | Critical infrastructure failure pattern (monolith under scale), customer churn risk concealed, key leadership departure hidden, CI/CD safety bypass |
| Detection Difficulty | High — board deck is deliberately sanitized; sprint review contains ground truth signals |
| Knowledge Depth | L3 (software_startup Domain Pack available) |

---

## Simulated Input Documents

### Document 1: Sprint Review Notes — Sprint 47 (Engineering Internal)

**Product:** Aurora — Enterprise Workflow Automation Platform
**Sprint:** 47 (March 16-29, 2026)
**Team Size:** 34 engineers (was 38 at sprint start)
**Velocity:** 62 points (target: 85, previous sprint: 71)
**Sprint Goal:** Complete Tier-2 customer onboarding pipeline + API rate limiting for Enterprise plan

**Sprint Summary (Scrum Master — Priya Vasquez):**

Sprint 47 was a challenging cycle. We carried over 23 story points from Sprint 46, which is the third consecutive sprint with significant carryover. The primary focus shifted mid-sprint from planned feature work to production stability after the March 19th incident.

**Production Incidents:**

On March 19th at 02:14 UTC, the primary workflow execution engine experienced cascading failures under load when HealthFirst Insurance (our largest enterprise customer, $1.2M ARR) triggered their quarterly batch processing run. The batch job spawned approximately 14,000 concurrent workflow executions, which exceeded the connection pool limits on the monolithic application server. The cascading failure propagated to the shared PostgreSQL cluster, causing degraded performance across all tenants for 4 hours and 22 minutes.

Recovery required a manual restart of the application cluster and a database connection pool flush. Marcus Chen (Staff Engineer) deployed a hotfix at 06:38 UTC that increased the connection pool ceiling from 200 to 500 and added a crude queue mechanism for batch operations. This hotfix was deployed directly to production via SSH because the CI pipeline was experiencing intermittent build failures on the integration test suite and the team determined the production outage justified bypassing the standard deployment process.

This is the third time in six sprints that we have deployed a hotfix outside the CI/CD pipeline. Previous instances were on Feb 3 (session management memory leak fix) and Feb 18 (payment webhook timeout patch). In all three cases, the justification was that the CI integration test suite was too slow or flaky to wait for during an active incident.

**HealthFirst Account Status:**

Following the March 19th outage, HealthFirst's VP of IT Operations, Sandra Okonkwo, joined our weekly sync call on March 22nd — she had not previously attended these calls. She asked pointed questions about our infrastructure roadmap and multi-tenancy architecture. Our VP of Customer Success, Derek Huang, characterized this as "deepening the strategic partnership" in his CRM notes.

On March 25th, HealthFirst formally requested a detailed architecture review document and SLA compliance history for the trailing 12 months. Derek's team is preparing this document. Our actual SLA compliance for the past 6 months is 97.2% against a contracted 99.5%. Derek has requested that the architecture review document emphasize our "ongoing modernization initiative" and present the microservices migration as further along than it currently is.

HealthFirst's contract renewal is in 68 days. They represent 18% of total ARR.

**Technical Debt and Architecture:**

The monolith (codenamed "Atlas") is a 340,000-line Django application that was architected for 50 concurrent enterprise customers. We currently serve 187 customers. The application shares a single PostgreSQL cluster across all tenants, with tenant isolation implemented at the application layer via row-level filtering. There is no connection pooling middleware — the application manages connections directly.

The "microservices migration" that was approved in Q3 2025 has extracted exactly two services from the monolith: the notification service and the billing webhook handler. The core workflow execution engine, the API gateway, the user management system, and the data pipeline remain monolithic. At the current rate of extraction (2 services in 6 months), the critical-path services will not be extracted for another 18-24 months.

Marcus Chen has submitted an internal technical assessment (see attached) estimating that Atlas will hit hard scaling limits at approximately 220 concurrent customers. Our current sales pipeline has 40+ accounts in late-stage negotiations. Marcus's recommendation is to pause new enterprise customer onboarding until the workflow execution engine is extracted. This recommendation has not been shared with the sales team or the board.

**CI/CD Pipeline Health:**

The integration test suite currently takes 47 minutes to complete (up from 22 minutes in Q4 2025). The test suite has 312 tests, of which 28 are marked as "flaky" and are configured to retry up to 3 times before failing. On 6 of the last 10 CI runs, at least one integration test failed on the first pass but succeeded on retry. The team has been adding retry annotations rather than investigating root causes because sprint velocity pressure makes debugging flaky tests a low priority.

The deployment pipeline includes a staging environment validation step, but this step was disabled on February 12th after a staging environment configuration drift caused false failures. Staging validation has not been re-enabled. Deployments currently go from passing CI directly to production with a canary rollout to 10% of traffic for 15 minutes.

**Team Changes:**

Rebecca Torres (VP of Engineering) departed the company on March 14th. Her responsibilities have been distributed across the three engineering managers. The CTO, Alan Ng, has taken a "more hands-on role in engineering operations" as the team "optimizes its organizational structure." No backfill has been posted for Rebecca's position.

During Sprint 47, four engineers — two senior backend engineers and two mid-level full-stack engineers — gave notice. Exit interview themes included "unsustainable on-call burden," "architecture direction unclear," and "leadership instability." Current engineering attrition over the trailing 90 days is 10.5%.

**Sprint Retrospective Key Themes:**
- "We keep firefighting instead of building" (7 votes)
- "The monolith is a ticking time bomb" (6 votes)
- "Why are we still selling enterprise contracts when we can't serve the ones we have?" (5 votes)
- "We need a real incident response process, not SSH-into-prod" (4 votes)

---

### Document 2: Board Update Deck — March 2026 (Excerpt)

**Aurora Series B Board Update — March 2026**
**Prepared by:** Alan Ng, CTO & Co-Founder

**Slide 3: Product & Engineering Update**

Status: Green — On Track

Key highlights this quarter:
- Successfully onboarded 22 new enterprise customers in Q1, bringing total customer count to 187 (target: 180). Pipeline remains strong with 40+ late-stage opportunities for Q2.
- Platform reliability remains strong. Completed proactive infrastructure hardening initiative including connection pool optimization and batch processing queue implementation.
- Microservices modernization initiative progressing. Notification service and billing service successfully extracted. Workflow engine extraction planning underway for Q2.
- Engineering organizational optimization completed. Transitioning to a flatter, more agile structure with engineering managers reporting directly to CTO. This change reduces management overhead and increases engineering leadership bandwidth.

**Slide 4: Key Metrics**

| Metric | Q4 2025 | Q1 2026 | Trend |
|--------|---------|---------|-------|
| ARR | $5.8M | $6.7M | +15.5% QoQ |
| Net Revenue Retention | 112% | 108% | Slight decrease |
| Customer Count | 165 | 187 | +13.3% |
| Gross Margin | 71% | 68% | Infrastructure costs increasing |
| Engineering Headcount | 38 | 34 | Organizational optimization |
| Platform Uptime | 99.6% | 99.1% | Within acceptable range |

**Slide 5: Customer Success**

Our strategic account management approach continues to deliver results. Key enterprise relationships are deepening, with senior stakeholders increasingly engaged in architecture and roadmap discussions. HealthFirst Insurance, our flagship enterprise customer, has initiated a comprehensive architecture review process — a strong signal of long-term partnership commitment.

Net Promoter Score: 42 (industry average: 38). Customer health scores remain stable across the portfolio.

**Slide 6: Risk Register**

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|-----------|
| Infrastructure scaling | Low | Medium | Microservices migration underway; batch processing optimization complete |
| Competitive pressure | Medium | Medium | Feature velocity maintained; new API rate limiting for Enterprise tier launching Q2 |
| Talent market | Medium | Low | Organizational optimization reducing management burden; culture initiatives planned for Q2 |

**Slide 7: Q2 Outlook**

Strong momentum entering Q2. Sales pipeline supports 25%+ ARR growth target. Engineering team is focused on platform modernization while maintaining feature delivery velocity. Board should expect continued acceleration in customer acquisition as the platform scales to meet market demand.

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | Red (override from official Green) |
| Override Triggers Activated | Critical infrastructure at scaling limit (monolith serving 187 customers against 220 hard ceiling), largest customer churn risk (18% ARR), CI/CD bypass pattern (3 production deploys outside pipeline in 6 sprints), VP Engineering departure concealed, engineering attrition at 10.5% |

### Expected Key Findings

1. **Monolith Scaling Crisis (Critical):** The core application ("Atlas") was designed for 50 concurrent enterprise customers and now serves 187. A staff engineer's internal assessment identifies a hard ceiling at 220 customers. With 40+ accounts in late-stage sales pipeline, the system will hit architectural failure within 1-2 quarters. The board deck describes this as "microservices modernization initiative progressing" — but only 2 of approximately 6+ critical services have been extracted in 6 months.

2. **CI/CD Safety Bypass Pattern:** Three production hotfixes deployed via direct SSH in six sprints, bypassing the CI/CD pipeline. The integration test suite is degraded (28 of 312 tests flaky, runtime doubled to 47 minutes). Staging environment validation has been disabled since February 12th. The board deck describes this as "proactive infrastructure hardening."

3. **HealthFirst Churn Risk Concealed:** The company's largest customer (18% of ARR, $1.2M) experienced a 4.5-hour outage, their VP of IT Operations escalated to direct involvement, they have formally requested SLA compliance history and architecture documentation, and their contract renews in 68 days. Actual SLA compliance is 97.2% against a contracted 99.5%. The board deck frames this as "senior stakeholders increasingly engaged in architecture and roadmap discussions" and "a strong signal of long-term partnership commitment."

4. **VP Engineering Departure Hidden:** Rebecca Torres (VP of Engineering) left on March 14th. No backfill posted. The board deck describes this as "organizational optimization" and "transitioning to a flatter, more agile structure." Combined with 10.5% trailing-90-day engineering attrition and 4 additional resignations citing "leadership instability," this represents a leadership vacuum, not a structural improvement.

5. **Board Metrics Deception:** Platform uptime reported as 99.1% "within acceptable range" — but contracted SLA with the largest customer is 99.5%. Net revenue retention declined from 112% to 108%. Gross margin declined from 71% to 68%. Engineering headcount dropped from 38 to 34. Each metric individually looks like normal variance; together they show a system under stress.

6. **Sprint Velocity Collapse:** Sprint velocity dropped from 85 (target) to 62 (actual), with three consecutive sprints carrying over significant story points. The retrospective themes — "firefighting instead of building," "ticking time bomb," "SSH-into-prod" — directly contradict the board deck's "feature velocity maintained" claim.

### Expected Questions (Calibration Reference)

1. **[Defensive/Accountability]:** HealthFirst Insurance represents 18% of ARR, their contract renews in 68 days, your actual SLA compliance is 97.2% against their contracted 99.5%, and their VP of IT Operations has escalated to requesting architecture documentation after a 4.5-hour outage. The board deck describes this as "a strong signal of long-term partnership commitment." Who authorized framing an at-risk $1.2M account as a positive engagement signal, and what is the contingency plan if HealthFirst does not renew?

2. **[Strategic/Scale-Out]:** The monolith was designed for 50 customers and now serves 187, with a staff engineer estimating a hard ceiling at 220. The sales pipeline has 40+ late-stage accounts. At current microservices extraction velocity (2 services in 6 months), the critical workflow engine will not be decoupled for 18-24 months. If the team closes even half the pipeline deals, the platform will hit its architectural limit before the migration is complete. Has anyone modeled the revenue impact of a platform-wide outage at 220+ customers, and why has the staff engineer's recommendation to pause enterprise onboarding not been shared with the sales team or the board?

3. **[Strategic/Organizational]:** Three production hotfixes have been deployed via SSH in six sprints, the staging environment has been disabled for six weeks, the VP of Engineering left without a backfill, four engineers resigned citing leadership instability and unsustainable on-call burden, and sprint velocity has collapsed 27% below target. If a production outage occurs during the HealthFirst contract renewal window and the team's incident response is again "SSH into production and hope," what is the probability that HealthFirst renews — and has the board been given the information it needs to assess whether the current engineering organization can reliably operate the platform at its current scale, let alone grow it?
