# Patch Pattern Library — Software Startup

> Reference knowledge base for The King's Hand. Classifies the 10 most common
> patterns where surface-level engineering fixes mask deeper structural problems
> in software startups, with cost estimates and technical debt classification.

---

## Core Principle

A patch in a software startup is not a fix. It is a debt instrument. The team avoided a hard architectural decision today. The engineers accepted the cost instead — paid in degraded reliability, in compounding complexity, in velocity loss that accumulates sprint over sprint, and in customer-visible quality problems that erode trust. Unlike hardware, where bugs are frozen in silicon, software patches have a uniquely dangerous property: they can be applied invisibly, without formal approval, and their costs are diffuse enough that no single person feels responsible until the system collapses.

**Technical Debt Multiplier:** Industry research (Stripe Developer Coefficient Report, McKinsey) indicates that engineering teams spend 33-42% of their time on technical debt and maintenance. Every pattern listed below contributes to this tax. A startup carrying heavy patch debt will ship 2-4x slower than a clean codebase, and the gap widens with every sprint.

---

## Pattern Summary

| # | Pattern Name | Root Cause Masked | Cost Impact | Debt Class |
|:--|:------------|:------------------|:-----------|:-----------|
| 1 | Ship It and Fix Later | Schedule pressure overriding quality gates | Speed +short-term / Quality -severe / Debt +high | Spreading |
| 2 | Hardcoded Customer Logic | Architecture cannot express customer-specific requirements | Speed +short-term / Quality -moderate / Debt +severe | Architectural |
| 3 | Feature Flag Permanence | No process for flag lifecycle management; fear of removing flags | Speed -moderate / Quality -moderate / Debt +high | Spreading |
| 4 | Skip-the-Tests Deploy | CI pipeline too slow or test suite too flaky to trust | Speed +short-term / Quality -severe / Debt +moderate | Spreading |
| 5 | Manual Data Migration | No migration tooling; schema evolution not designed | Speed -high / Quality -severe / Debt +moderate | Isolated |
| 6 | Retry Storm Mitigation | Underlying service reliability problem not addressed | Speed neutral / Quality -high / Debt +high | Spreading |
| 7 | Monolith Bypass | Monolith too risky to change; new service duplicates logic | Speed +short-term / Quality -high / Debt +severe | Architectural |
| 8 | Shadow IT Integration | Proper API/integration path too slow or does not exist | Speed +short-term / Quality -moderate / Debt +high | Spreading |
| 9 | Cache-Everything Band-Aid | Database or API cannot handle production load | Speed +short-term / Quality -high / Debt +high | Architectural |
| 10 | Copy-Paste Service | Team does not understand shared code; easier to duplicate | Speed +short-term / Quality -moderate / Debt +severe | Spreading |

---

## Debt Classification Guide

- **Isolated Patch:** A contained fix that does not spread to other parts of the system. Cost is bounded and predictable. Example: a manual data migration script that runs once and is discarded. The risk is low if the fix is truly one-time, but isolated patches have a tendency to be reused and extended beyond their original scope.

- **Spreading Contamination:** A fix that forces changes elsewhere or creates patterns that other engineers copy. Other teams or modules must adapt to the workaround's existence. Cost grows over time as the workaround's assumptions spread through the codebase. Example: a retry-everywhere pattern that masks a reliability problem — every new service copies the retry logic, and none of them address the root cause.

- **Architectural Debt:** A fix that conflicts with the system's fundamental design. The workaround creates a parallel path that diverges from the intended architecture. Eventually requires a full rework — a "replatforming" effort that can consume 3-6 months of engineering time. Example: a monolith bypass service that duplicates core business logic, creating two sources of truth that inevitably diverge.

## Cost Trade-off Axes

| Axis | What It Measures | Unit of Measurement |
|:-----|:----------------|:-------------------|
| Speed | Impact on feature delivery velocity — how fast can the team ship new functionality | Sprints lost or gained; deployment frequency change; lead time for changes |
| Quality | Impact on product reliability, correctness, and user experience | Bug rate (bugs per sprint); incident frequency; customer-reported issues; error rates |
| Technical Debt | Accumulated maintenance burden that slows future development | Estimated engineering-months to remediate; percentage of sprint capacity consumed by debt work |

---

## Detailed Patterns

### Pattern 1 — Ship It and Fix Later

**Root Cause:** Schedule pressure from leadership, investors, or sales commitments forces the team to deploy code that is known to be incomplete, buggy, or poorly tested. The root problem is either unrealistic planning, scope creep that was not pushed back on, or a culture where shipping dates are treated as immovable while quality is treated as negotiable.

**What Happens:** Engineers merge code with known issues, TODO comments, and skipped edge cases. The PR may include comments like "will address in follow-up" or "tracking in JIRA-1234." A follow-up ticket is created but immediately deprioritized as the next deadline approaches. The "temporary" code becomes permanent because there is always something more urgent than fixing working-but-fragile code.

**Why It Persists:** The cost of shipping late is visible (missed demo, angry customer, delayed launch). The cost of shipping buggy is invisible until incidents occur. Management incentivizes shipping; nobody is evaluated on code quality or debt reduction. The follow-up tickets accumulate in the backlog and become "backlog bankruptcy" — so many that triaging them would itself take a sprint.

**Cost Along Trade-off Axes:**

| Axis | Impact | Estimate |
|:-----|:-------|:---------|
| Speed | Short-term velocity increase; long-term velocity decrease as bugs require emergency fixes | +20-30% short-term velocity; -15-25% sustained velocity over next 3-6 months |
| Quality | Known bugs in production; edge cases that fail for specific users; error rates elevated | 2-5x increase in production incidents within 30 days of deploy |
| Technical Debt | Follow-up tickets accumulate; each one represents a promise to fix that is never kept | 1-3 engineering-weeks of remediation per major "ship it" decision; compounds quarterly |

**Debt Classification:** **Spreading Contamination.** Once the team learns that shipping with known issues is acceptable, the pattern spreads culturally. Other engineers lower their quality bar. Code review rigor decreases. The threshold for "good enough" drops continuously.

**Detection Keywords:** `ship it`, `fix later`, `follow-up ticket`, `known issue`, `will address in next sprint`, `tracking in backlog`, `tech debt ticket created`, `MVP version`, `good enough for now`, `we can iterate`

**Escalation Risk:** After 3-4 cycles of "ship and fix later," the backlog of deferred fixes becomes so large that the team can no longer estimate how long a "stabilization sprint" would take. At this point, the codebase enters a death spiral: every new feature introduces more bugs than the team can fix, and velocity asymptotically approaches zero. Recovery requires a dedicated 4-8 week stabilization effort with zero feature work — which is extremely hard to justify to stakeholders who have been trained to expect continuous feature delivery.

---

### Pattern 2 — Hardcoded Customer Logic

**Root Cause:** The product's architecture cannot express customer-specific requirements (custom fields, unique workflows, tenant-specific business rules) through configuration or a rules engine. Instead of building the abstraction, engineers write `if (customer_id === 'acme')` blocks to handle each customer's needs.

**What Happens:** A key customer (often the first enterprise deal or the largest account) requests behavior that the product does not support generically. Under sales pressure, an engineer adds a conditional code path specific to that customer. The code ships. The next enterprise customer needs a different variation. Another conditional. Within 6-12 months, the codebase contains dozens of customer-specific branches, each with slightly different behavior, none of which is tested against the others.

**Why It Persists:** The sales team needs to close the deal now. Building a generic configuration system takes 4-8 weeks. The hardcoded fix takes 2 days. The cost of the hardcode is invisible to sales; the cost of the lost deal is immediate and quantifiable. Engineering never gets the time to build the proper abstraction because there is always another customer requesting another one-off.

**Cost Along Trade-off Axes:**

| Axis | Impact | Estimate |
|:-----|:-------|:---------|
| Speed | Each new customer customization takes longer as engineers must navigate existing conditionals | +50% time per customization after the 5th hardcode; +100% after the 10th |
| Quality | Customer-specific code paths are rarely tested against each other; interactions cause bugs | 1-2 customer-impacting bugs per quarter per 10 hardcoded paths |
| Technical Debt | Eventually requires a full configuration/rules engine rewrite to become maintainable | 3-6 engineering-months to build the abstraction that should have been built first |

**Debt Classification:** **Architectural Debt.** Customer-specific logic fundamentally violates multi-tenant architecture principles. The divergent code paths make it impossible to reason about system behavior, test comprehensively, or refactor safely. The fix is not incremental — it requires designing and migrating to a proper configuration system.

**Detection Keywords:** `customer-specific`, `one-off`, `special case for`, `custom logic`, `tenant override`, `per-customer`, `hardcoded`, `if customer`, `client customization`, `bespoke implementation`

**Escalation Risk:** At approximately 15-20 hardcoded customer paths, the system becomes untestable. Engineers cannot predict the interaction effects between customer-specific code branches. Bug fixes for one customer break another. At this point, the team faces a choice: build the configuration system (3-6 months, zero feature delivery) or continue hardcoding (accelerating quality degradation). Many startups choose to continue hardcoding until a major customer-facing incident forces the reckoning.

---

### Pattern 3 — Feature Flag Permanence

**Root Cause:** Feature flags are introduced for safe rollout (good practice), but no lifecycle management process exists. Flags are never removed after full rollout because (a) nobody owns flag cleanup, (b) removing a flag requires understanding all code paths it touches, and (c) there is always something more urgent.

**What Happens:** The feature flag system accumulates 100, 200, 500+ active flags. Many are fully rolled out to 100% of users but remain in the code. Some flags interact with other flags in untested combinations. The effective configuration space of the application becomes 2^N where N is the number of active flags — making comprehensive testing impossible.

**Why It Persists:** Adding a flag is a 5-minute task. Removing a flag requires understanding the flag's full scope, updating tests, and deploying a change that removes code — all with the risk that some user segment was still on the old path. The asymmetry between the cost of adding and removing flags guarantees accumulation.

**Cost Along Trade-off Axes:**

| Axis | Impact | Estimate |
|:-----|:-------|:---------|
| Speed | Engineers must reason about flag states when making changes; increases cognitive load and change risk | -10-20% velocity when >50 active flags; -25-40% when >200 |
| Quality | Flag interaction bugs appear in combinations nobody tested; intermittent, hard to reproduce | 1-3 "flag interaction" bugs per month when >100 active flags |
| Technical Debt | Dead code behind fully-rolled-out flags clutters the codebase; removal becomes a project in itself | 2-4 engineering-weeks to clean up 100 stale flags; often deferred indefinitely |

**Debt Classification:** **Spreading Contamination.** Every new feature that interacts with flagged code must consider the flag states. Test suites grow to cover flag combinations. Code review becomes harder. The complexity tax spreads to every team and every module.

**Detection Keywords:** `feature flag`, `feature toggle`, `flag cleanup`, `stale flags`, `flag audit`, `flag debt`, `too many flags`, `flag interaction`, `A/B test still running`, `experiment cleanup`, `flag lifecycle`

**Escalation Risk:** Beyond approximately 200 active flags, the flag system itself becomes a source of production incidents. Flags that were meant to be temporary become load-bearing parts of the architecture. At this point, a "flag cleanup sprint" is insufficient — the team needs a systematic flag lifecycle policy and tooling to enforce it, plus a dedicated cleanup effort that may take 4-8 weeks.

---

### Pattern 4 — Skip-the-Tests Deploy

**Root Cause:** The CI/CD pipeline is too slow (30+ minute build times), the test suite is too flaky (>5% of test runs fail for non-code reasons), or a production incident requires an immediate fix. Engineers bypass CI to push directly to production.

**What Happens:** An engineer pushes code to production without running the full test suite, either by (a) merging with failing CI, (b) deploying from a branch that has not been through CI, or (c) SSH-ing into production and making changes directly. The immediate problem is fixed. The untested change introduces a subtle regression that surfaces hours or days later.

**Why It Persists:** The CI pipeline is broken in a way that makes it an obstacle rather than a safety net. If CI takes 45 minutes and fails 20% of the time for flaky reasons, engineers rationally conclude that CI is not worth the time cost. The organizational failure is not the bypassed deploy — it is the neglected CI pipeline that made bypassing rational.

**Cost Along Trade-off Axes:**

| Axis | Impact | Estimate |
|:-----|:-------|:---------|
| Speed | Immediate speed boost for the hotfix; long-term speed loss from regressions and debugging | +100% speed for the immediate fix; -30-50% over the next sprint from regression fallout |
| Quality | Untested code in production; regressions that only surface under specific conditions | 3-5x higher defect rate for code deployed without CI; 40-60% of hotfixes introduce new issues |
| Technical Debt | Sets a cultural precedent that CI is optional; others begin bypassing for non-emergency reasons | Moderate — mainly cultural; CI discipline can be restored with pipeline investment |

**Debt Classification:** **Spreading Contamination.** Once one engineer bypasses CI successfully, others learn the trick. The norm shifts from "CI must pass" to "CI is nice to have." Restoring CI discipline requires both fixing the pipeline and resetting cultural expectations.

**Detection Keywords:** `hotfix`, `emergency deploy`, `skip CI`, `deploy without tests`, `force push to production`, `manual deploy`, `SSH to prod`, `bypass pipeline`, `green-light override`, `deploy anyway`, `flaky tests`

**Escalation Risk:** If CI bypasses become routine (more than once per week), the test suite stops being maintained because it is no longer the gatekeeper. Flaky tests proliferate because nobody fixes them. Within 2-3 months, the test suite is so unreliable that re-enabling CI enforcement would block all deployments until the suite is repaired — a 2-4 week effort that nobody wants to prioritize.

---

### Pattern 5 — Manual Data Migration

**Root Cause:** The application lacks automated schema migration tooling (or the tooling is broken), and a data change is needed urgently — fixing a corrupted record, backfilling a new column, merging duplicate accounts, or transforming data for a schema change.

**What Happens:** An engineer connects to the production database directly and runs SQL statements to modify data. The changes are not version-controlled, not tested in staging, and not reproducible. In the best case, a SQL script is saved in a Slack message. In the worst case, the engineer types queries into a production console from memory.

**Why It Persists:** Building proper migration tooling (Flyway, Alembic, Rails migrations) and a safe migration pipeline takes 2-4 weeks. The manual fix takes 30 minutes. The cost of getting it wrong (data corruption, data loss) is catastrophic but feels unlikely in the moment. The engineer has done it before and "it was fine."

**Cost Along Trade-off Axes:**

| Axis | Impact | Estimate |
|:-----|:-------|:---------|
| Speed | Immediate time savings vs. building tooling; recurring time cost each time a migration is needed | -2-4 hours per manual migration; becomes weekly as the product grows |
| Quality | Risk of data corruption, data loss, or inconsistency between environments | 10-20% chance of error per manual migration; consequences range from minor to catastrophic |
| Technical Debt | No migration history; impossible to reproduce the production database state from code alone | 2-4 engineering-weeks to build proper migration tooling and reconstruct migration history |

**Debt Classification:** **Isolated Patch.** Each manual migration is a one-time event. However, the pattern encourages more manual migrations because the tooling never gets built. The risk compounds with data volume — manually migrating 1,000 rows is recoverable; manually migrating 10 million rows is not.

**Detection Keywords:** `manual migration`, `production SQL`, `database fix`, `data backfill`, `run this query on prod`, `hotfix data`, `correct data manually`, `direct database access`, `prod console`, `one-time script`

**Escalation Risk:** A single mistaken WHERE clause in a manual production query can corrupt or delete data irreversibly. If backups are not tested regularly (they often are not), the data loss may be permanent. The most dangerous escalation is when manual migrations become the normal way to handle schema changes — at that point, the production database has diverged from any schema definition in code, and nobody knows the true state of the production schema.

---

### Pattern 6 — Retry Storm Mitigation

**Root Cause:** An upstream service or external dependency is unreliable — it times out, returns errors, or drops connections under load. Instead of fixing the reliability problem (which may require architectural changes or vendor replacement), the team adds retry logic with exponential backoff.

**What Happens:** Every call to the unreliable service gets wrapped in a retry loop (typically 3-5 retries with exponential backoff and jitter). The surface-level reliability improves — most requests eventually succeed. But the retries multiply load on the already-struggling service, making its reliability worse, which triggers more retries. Under peak load, this creates a retry storm that can amplify traffic 3-5x and cascade into a full system outage.

**Why It Persists:** Retries are a best practice in distributed systems — when used correctly. The problem is that retries are being used to mask a chronic reliability problem rather than as a defense against transient failures. Fixing the root cause (rewriting the unreliable service, adding circuit breakers, switching vendors) is expensive. Adding retries takes an afternoon.

**Cost Along Trade-off Axes:**

| Axis | Impact | Estimate |
|:-----|:-------|:---------|
| Speed | No velocity impact — retries are quick to implement | Neutral |
| Quality | System appears reliable under normal load; collapses catastrophically under peak load | Latency P99 increased 3-10x; retry storms cause 2-5 outages per year |
| Technical Debt | Retry logic proliferates to every service; nobody knows the true reliability of any dependency | 2-4 engineering-weeks to add proper circuit breakers and fix underlying reliability |

**Debt Classification:** **Spreading Contamination.** Retry patterns get copy-pasted across services. Each service adds its own retry policy, often without coordination. The combined retry amplification can turn a minor upstream hiccup into a system-wide outage. The pattern is especially dangerous because it works fine under normal load and only fails catastrophically under stress — exactly when reliability matters most.

**Detection Keywords:** `retry`, `exponential backoff`, `retry storm`, `timeout`, `circuit breaker`, `service reliability`, `upstream timeout`, `retry policy`, `graceful degradation`, `fallback`, `resilience pattern`

**Escalation Risk:** Retry storms are a leading cause of cascading failures in microservice architectures. Under peak load (product launch, viral moment, Black Friday), the retry amplification can multiply traffic by 3-5x, overwhelming downstream services that were already at capacity. The resulting outage happens at the worst possible moment — when the most users are watching. Recovery requires not just fixing the immediate outage but redesigning the retry strategy across all services.

---

### Pattern 7 — Monolith Bypass

**Root Cause:** The monolith application has become too complex, too fragile, or too poorly understood for engineers to safely make changes. Rather than refactoring the monolith (expensive, risky, long), a new microservice is created that duplicates some of the monolith's logic to serve a new feature or use case.

**What Happens:** A new service is deployed alongside the monolith. It reads from the same database (or replicates data via events) and implements business logic that overlaps with the monolith's. Both the monolith and the new service process the same domain events, sometimes reaching different conclusions. Data consistency becomes probabilistic rather than guaranteed.

**Why It Persists:** Changing the monolith is terrifying. The monolith has years of accumulated business logic, no tests, and tribal knowledge concentrated in engineers who may have left the company. Building a new service feels safe, modern, and fast. The duplicated logic "only covers our specific use case" — until it grows to cover more and more of the monolith's surface area.

**Cost Along Trade-off Axes:**

| Axis | Impact | Estimate |
|:-----|:-------|:---------|
| Speed | Short-term velocity increase for the new service team; long-term velocity decrease for everyone | +30-50% for new feature delivery; -20-30% sustained as teams coordinate between monolith and services |
| Quality | Two systems processing the same data produce inconsistent results; users see different behavior depending on which code path runs | 2-5 data consistency bugs per quarter; some are silent and only caught by customers |
| Technical Debt | Two codebases implementing the same business logic; changes must be made in both places or they diverge | 4-8 engineering-months to properly decompose the monolith; grows by 1-2 months per quarter if bypass continues |

**Debt Classification:** **Architectural Debt.** The bypass creates a parallel architecture that diverges from the monolith over time. Both the monolith and the bypass service must be maintained indefinitely because neither is complete on its own. This is the textbook "distributed monolith" — all the complexity of microservices with none of the independence benefits.

**Detection Keywords:** `new service`, `alongside the monolith`, `monolith decomposition`, `strangler pattern`, `parallel implementation`, `migration service`, `read from the same database`, `event-driven sync`, `dual-write`, `data consistency issue`, `which system is the source of truth`

**Escalation Risk:** Each bypass service adds another dimension to the "which system is the source of truth" problem. After 3-5 bypass services, data consistency becomes the team's primary engineering challenge. Engineers spend more time debugging data discrepancies than building features. The original monolith becomes a "legacy system" that nobody dares touch but cannot be removed because it still handles critical paths. At this point, a full decomposition project (6-12 months) becomes unavoidable.

---

### Pattern 8 — Shadow IT Integration

**Root Cause:** A team needs data or functionality from another system (internal or external), but the official integration path is too slow (requires another team's prioritization), does not exist (no API available), or is blocked (vendor contract negotiation in progress).

**What Happens:** The team builds an unofficial integration — scraping a web interface, calling an undocumented API, reading directly from another service's database, or using personal API keys for a third-party service. The integration works and delivers immediate value. It is also completely invisible to the teams that own the systems being accessed.

**Why It Persists:** The official process for requesting an API or integration takes weeks or months. The shadow integration takes days. The team that builds it gets immediate value and looks productive. The risks (breaking changes, rate limiting, security exposure, data staleness) are future problems.

**Cost Along Trade-off Axes:**

| Axis | Impact | Estimate |
|:-----|:-------|:---------|
| Speed | Immediate unblocking; recurring maintenance cost when the shadow integration breaks | +1-2 weeks saved initially; -1-2 days per month in maintenance and debugging |
| Quality | Undocumented integrations break without warning when the source system changes | 1-3 integration failures per quarter; debugging is slow because the integration is unofficial |
| Technical Debt | No contract or SLA; no versioning; no monitoring; owner of source system unaware of dependency | 1-2 engineering-weeks to replace each shadow integration with a proper one |

**Debt Classification:** **Spreading Contamination.** Shadow integrations create invisible dependencies. When the source system changes, the shadow integration breaks and nobody understands why. The debugging process reveals the shadow integration, creating an emergency. Other teams may build their own shadow integrations when they see the first one working.

**Detection Keywords:** `scraping`, `undocumented API`, `direct database read`, `personal API key`, `workaround integration`, `temporary connector`, `unofficial sync`, `reading from their DB`, `we just call their endpoint`, `not going through the official API`

**Escalation Risk:** Shadow integrations are security risks. Personal API keys in production code, cross-service database reads without access controls, and web scraping that bypasses authentication all create attack surfaces. A security audit will flag these as critical findings. More immediately, when the source system deploys a breaking change, the shadow integration fails with no notice, no migration path, and no support from the source system's team.

---

### Pattern 9 — Cache-Everything Band-Aid

**Root Cause:** The database or primary API cannot handle production query load. Instead of optimizing the database (indexing, query optimization, schema redesign) or scaling the infrastructure, the team adds caching (Redis, Memcached, CDN) in front of every slow endpoint.

**What Happens:** Caching is layered on top of the application. Response times improve dramatically. The team celebrates. The underlying performance problem is forgotten. The cache now becomes a critical infrastructure component — but cache invalidation logic is often incorrect, leading to stale data. When the cache fails (Redis restart, memory pressure, network partition), all traffic hits the database directly, causing immediate overload and cascading failure.

**Why It Persists:** Caching delivers immediate, measurable performance improvement. Database optimization requires understanding query patterns, schema design, and indexing — skills that may not exist on the team. Caching is also a "standard" solution, so it appears in architecture reviews as a reasonable choice rather than a band-aid.

**Cost Along Trade-off Axes:**

| Axis | Impact | Estimate |
|:-----|:-------|:---------|
| Speed | Immediate performance fix; ongoing velocity cost from cache invalidation bugs | +1-2 days saved per slow endpoint; -1-2 days per sprint debugging stale data issues |
| Quality | Stale data visible to users; cache invalidation bugs cause data inconsistency | 2-5 stale-data incidents per month; some silently affect business metrics |
| Technical Debt | Application now has two data paths (cache hit vs. cache miss) with different behavior; cache failure causes outage | 3-6 engineering-weeks to properly optimize the database and remove unnecessary caching |

**Debt Classification:** **Architectural Debt.** The cache layer becomes load-bearing infrastructure that masks a fundamental performance problem. Removing the cache is now impossible without fixing the underlying database issues. The system has two modes of operation: "cache working" (fast, possibly stale) and "cache failed" (catastrophically slow or down).

**Detection Keywords:** `caching`, `Redis`, `Memcached`, `cache invalidation`, `stale data`, `cache miss`, `cache hit ratio`, `TTL`, `cache warming`, `cache stampede`, `cache aside`, `cold cache`

**Escalation Risk:** Cache-related outages follow a predictable pattern: the cache fails (deployment, memory pressure, network), traffic hits the database, the database cannot handle the load, the application goes down. These outages tend to be prolonged because the cache must be restored and warmed before the system can handle normal traffic. If the codebase has grown dependent on the cache for correctness (not just performance), the stale data problems during cache rebuilding can corrupt business state.

---

### Pattern 10 — Copy-Paste Service

**Root Cause:** The team needs to build a new service or feature that requires logic similar to an existing module. Instead of extracting the shared logic into a library, the engineer copies the relevant code from the existing module into the new one, then modifies it for the new use case.

**What Happens:** Two (or more) copies of similar business logic exist in different services. Initially they are identical. Over time, each copy evolves independently as different engineers make changes without knowing about the other copy. Bug fixes applied to one copy are not applied to the other. Behavior diverges silently.

**Why It Persists:** Extracting shared logic into a library requires understanding the abstraction boundary, creating a package/module with its own versioning and tests, and coordinating updates across consuming services. Copying the code takes 10 minutes. The engineer who copies the code often does not know the original exists — they find a working implementation in the codebase and duplicate it.

**Cost Along Trade-off Axes:**

| Axis | Impact | Estimate |
|:-----|:-------|:---------|
| Speed | Immediate time savings; growing maintenance burden as copies diverge | +1-2 days saved initially; -1 day per month per duplicated module for inconsistency debugging |
| Quality | Bug fixes in one copy not applied to others; behavior diverges | 1-3 inconsistency bugs per quarter per duplicated module |
| Technical Debt | N copies of the same logic means N places to update for every business rule change | 2-4 engineering-weeks to extract shared library and migrate all consumers |

**Debt Classification:** **Spreading Contamination.** Each copy is a new surface for bugs, and each copy may be further copied by other engineers. The number of duplicates grows super-linearly as the codebase grows. Code search becomes the only way to find all copies, and even then, copies that have been modified may not match search patterns.

**Detection Keywords:** `copied from`, `based on`, `similar to`, `ported from`, `same logic as`, `forked from`, `duplicated`, `reimplemented`, `rewritten from`, `inspired by the existing`

**Escalation Risk:** After multiple rounds of copying, no single engineer understands all the copies or their differences. A business rule change (pricing logic, permission check, validation rule) must be applied to all copies — but some copies are unknown. The incomplete update causes inconsistent behavior that surfaces as customer-facing bugs. The only reliable fix is extracting the shared logic, but by then the copies have diverged enough that the extraction is a significant reverse-engineering effort.
