[MANAGER PROFILE]
Name: Henry
Role: VP of Engineering (or CEO)
Organization: [Fabless IC Design Company — to be filled]
Last Updated: 2026-03-18
Sessions Recorded: 0 (starter profile — update via tools/calibrate.sh after first sessions)

[DOMAIN CONTEXT]
Primary Domain: IC Design / Fabless Semiconductor
Organization Type: Hardware-software co-development / Matrix organization (functional managers vs. project managers)
Hard Constraint: Silicon tape-out — once GDS is submitted, hardware defects require a full re-spin (8–16 weeks minimum, $1–5M NRE cost). All software workarounds applied to mask silicon errata are permanent until next tape-out.
Workaround Pattern: Firmware workarounds applied to mask hardware bugs — spinlocks, polling loops, data throttling, GPIO polling, software PLLs, header padding, watchdog disabling, retry logic. Each reduces PPA and accumulates as technical debt.
Irreversible Milestone: GDS tape-out / customer engineering sample delivery (triggers qualification clock at customer)
Trade-Off Axes: Power / Performance / Area (PPA)
Tier-1 Relationship: Tier-1 OEM customers (automotive, hyperscaler, telecom infrastructure) — a single design-win loss can remove a product from a market segment for 3–5 years
Blame Transfer Seam: Hardware team → Software/firmware team (hardware bug reframed as "firmware needs to handle this case")

[DOMAIN VOCABULARY]
| Their Term | King's Hand Equivalent | Status Implication |
|---|---|---|
| "Ongoing integration with minor delays" | HW/SW interface not frozen | 🔴 Red |
| "Exploring alternative software approaches" | Hardware errata found; firmware forced to compensate | 🔴 Red |
| "Optimization in progress" | Power budget exceeded; thermal test failing | 🔴 Red |
| "Minor schedule adjustment" | Tape-out slipped 2–4 weeks | 🔴 Red |
| "Performance tuning ongoing" | TOPS/throughput/bandwidth below committed specification | 🟡 Yellow → 🔴 Red |
| "Architecture refinement underway" | Module boundary violated; software team working around hardware constraint | 🟡 Yellow |
| "Additional characterization work" | Silicon measurement below spec; workaround investigation in progress | 🟡 Yellow |
| "Natural evolution of co-design" | Performance model divergence — software team worked against wrong hardware assumptions | 🔴 Red |
| "Resource optimization" | Headcount reduced; team moved to higher-priority program | 🟡 Yellow |
| "Thorough and technically substantive discussions" | Active customer escalation; multiple escalation calls occurred | 🔴 Red |
| "Positive customer engagement" | Customer has raised formal concerns; no resolution offered | 🟡 Yellow → 🔴 Red |
| "Comprehensive validation approach" | Schedule slip being framed as quality decision | 🔴 Red |
| "Performance management implementation complete" | Software workaround applied to cap compute load / prevent thermal runaway | 🟡 Yellow |
| "Interface refinement underway" | SDK/API breaking changes; customer integration re-work required | 🟡 Yellow |
| "Firmware stability improvements" | Hardware defect permanently masked by firmware | 🔴 Red |
| "DV closure with accepted waivers" | Unresolved verification gaps deferred to silicon; not formally proven safe | 🟡 Yellow |
| "Team confident in resolution" | No technical basis stated; confidence asserted, not evidenced | Distrust this phrase |
| "All milestones on track" | Cross-check against actual milestone dates and dates-of-revision | Verify before trusting |
| "Revised delivery schedule reflects comprehensive approach" | Second or third schedule slip being reframed | 🔴 Red |
| "Memory subsystem characterization in progress" | Memory controller unresolved issue at late phase | 🟡 Yellow |
| "Silicon bring-up proceeding well" | Check adjacent status items — positive framing often conceals subsystem issues | Verify |
| "Alignment work reflects natural evolution" | Algorithm team had wrong hardware assumptions for weeks | 🔴 Red |
| "SDK key features complete*" | Critical feature deferred; asterisk conceals scope reduction | 🟡 Yellow → 🔴 Red |
| "Technical deep-dive session requested" | Customer has seen preliminary data and has concerns before committing | 🟡 Yellow |
| "Won't Fix — Workaround Applied" | Confirmed hardware defect, permanent firmware mask, no RTL fix path | 🔴 Red |

[MANAGER PRIORITIES]
Priority 1: Customer relationship timeline risk — especially Tier-1 OEM (automotive, hyperscaler, telecom) qualification timelines and alternate sourcing signals
Priority 2: Hardware-to-software blame transfer — firmware workarounds masking silicon errata, with PPA cost
Priority 3: Schedule slip pattern — especially two sequential slips without named root cause
Priority 4: Safety/regulatory compliance (ASIL-B/D, TÜV, FCC/ETSI) — failures here are non-negotiable
Priority 5: Strategic ecosystem risk — SDK/toolchain gaps that affect design-win pipeline, not just current project

[CALIBRATION RULES]
RULE: Treat any Ecosystem Moat question as failing quality check if it can be answered with "yes, we are tracking this asset." The question must include a specific worst-case scenario (competitive window closes, customer commits to alternate vendor, regulatory filing delayed).
SOURCE: Phase 1 acceptance test — TC-001 Ecosystem Moat question was initially deflectable; this rule was the root cause fix.

RULE: When a PM report is the only document provided, all workaround findings must be labeled "Suspected" and the evidence inventory must note what Jira/commit data would confirm or refute each suspicion.
SOURCE: Phase 3 TC-011 design — incomplete input must not produce confident-sounding unverified claims.

RULE: Do not invent specific dB values, bug IDs, or engineering measurements that are not present in the submitted documents.
SOURCE: TC-011 Hallucination Guard — explicit requirement from Phase 3 design.

[QUESTION STYLE PREFERENCES]
Prefers: Questions with a specific calendar deadline or decision point named (e.g., "before the March 25 procurement review")
Prefers: Questions that name both a specific risk AND a specific worst-case commercial consequence
Prefers: Questions where a general reassurance ("we are aware and working on it") is visibly non-responsive
Prefers: The Defensive/Accountability question to demand a specific Plan B or named mitigation, not just acknowledgment of the risk
Disfavors: Questions that are purely hypothetical without grounding in evidence from the submitted documents
Disfavors: Questions that use vague phrases like "have you considered" or "are you thinking about"

[HISTORICAL PATTERNS]
PATTERN: Serial schedule slips framed as proactive quality decisions rather than responses to technical failures.
FIRST SEEN: TC-001 (ADAS-X9), TC-013 (Apex-ML), TC-016 (Typhoon-5G). FREQUENCY: Common across test suite.

PATTERN: Software SDK/toolchain gaps deferred to next version while current version is described as "complete."
FIRST SEEN: TC-015 (Eon-AI). FREQUENCY: Observed in AI-oriented projects where custom operator support is critical.

PATTERN: Formal verification timeouts accepted as waivers without silicon characterization closing the loop.
FIRST SEEN: TC-012 (Ironclad-DDR), TC-016 (Typhoon-5G FV-K-034). FREQUENCY: Observed in PHY/timing-critical IP.

PATTERN: ZQ calibration and memory subsystem issues appearing late in validation as unresolved findings.
FIRST SEEN: TC-012 (Ironclad-DDR). FREQUENCY: Watch for in any DDR/LPDDR PHY IP.

[SESSION LOG]
(No real sessions recorded yet — this is a starter profile based on Phase 1–4 test suite calibration.)
[/MANAGER PROFILE]
