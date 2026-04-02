# Framework Templates: Six-Element Domain Mappings

This reference provides concrete examples for each of the six universal framework elements across multiple domains. When constructing a dynamic framework for a new project, use these mappings as seed patterns. Each element should be populated with domain-specific instances drawn from the tables below or analogous items discovered in the input data.

---

## Element Definitions

| # | Element | Purpose |
|---|---------|---------|
| 1 | **Hard Constraint** | Inviolable limits that cannot be negotiated away -- physics, law, regulation, signed contracts. If violated, consequences are irreversible or catastrophic. |
| 2 | **Patch Pattern** | Short-term fixes that mask structural problems. They buy time but accumulate hidden cost. Detecting these is core to watermelon-effect analysis. |
| 3 | **Irreversible Milestone** | Points of no return. Once crossed, the cost of reversal is prohibitive. Urgency and risk assessments hinge on proximity to these gates. |
| 4 | **Trade-off Axes** | The two or three core resource dimensions that are in perpetual tension. Every "optimization" sacrifices one axis for another. |
| 5 | **Tier-1 Relationship** | Critical external stakeholders whose actions or opinions can make or break the project. Loss of confidence here triggers cascading consequences. |
| 6 | **Blame Transfer Seam** | Organizational boundaries where responsibility shifts between teams. Problems that land on a seam are systematically under-reported because no single team owns them. |

---

## 1. Semiconductor IC Design

### Hard Constraint

| # | Constraint | Why It Is Inviolable |
|---|-----------|----------------------|
| 1 | Process node physics (transistor leakage, wire RC) | Governed by semiconductor physics; no schedule pressure changes them |
| 2 | Foundry DRC/LVS rules | GDS that violates design rules is rejected by the foundry -- no exceptions |
| 3 | Tape-out committed netlist (post-signoff) | Metal masks are fabricated; changing logic requires a respin costing months and millions |
| 4 | Thermal design envelope (TDP) | Exceeding thermal limits causes throttling or device failure in customer systems |
| 5 | Customer-qualified interface specs (e.g., PCIe, DDR) | Protocol compliance is verified by industry certification; non-compliant silicon is non-shippable |

### Patch Pattern

| # | Pattern | What It Masks |
|---|---------|--------------|
| 1 | Firmware spinlock / busy-wait loop | Hardware race condition or missing interrupt; burns power, hides timing bug |
| 2 | NOP insertion in boot sequence | Setup/hold violation or initialization ordering defect in RTL |
| 3 | Data path throttling (clock gating workaround) | Throughput spec failure; traded performance to avoid silicon respin |
| 4 | GPIO polling instead of interrupt-driven I/O | Broken interrupt controller or routing error; increases CPU load and power |
| 5 | Retry logic / packet replay | Intermittent signal integrity or protocol-layer bug; hides error rate behind retransmissions |
| 6 | Header padding / alignment workaround | DMA or bus-width mismatch in hardware; software compensates at bandwidth cost |
| 7 | Software PLL (phase tracking in firmware) | Analog PLL lock failure or jitter out of spec; consumes CPU cycles |
| 8 | Watchdog timer disable | System hang root cause unknown; disabling watchdog prevents resets but hides instability |

### Irreversible Milestone

| # | Milestone | Why It Is Irreversible |
|---|-----------|----------------------|
| 1 | GDS tape-out to foundry | Mask set fabrication begins; cost of respin is $2M--$50M+ depending on node |
| 2 | Customer qualification start (qual samples shipped) | Customer begins months-long validation; restarting resets the qualification clock |
| 3 | Mass production ramp (HVM commitment) | Foundry capacity reserved, supply chain committed; halting triggers contractual penalties |

### Trade-off Axes

| Axis | Unit / Metric | Typical Tension |
|------|--------------|----------------|
| **Power** | mW, TDP | Lower power demands smaller logic or lower frequency, reducing performance |
| **Performance** | MHz, TOPS, Gbps | Higher performance increases switching power and die area |
| **Area** | mm^2, gate count | Smaller area limits available logic and memory, constraining both power and performance options |

### Tier-1 Relationship

| # | Stakeholder | Impact of Losing Confidence |
|---|------------|----------------------------|
| 1 | Tier-1 OEM customer (automotive, mobile) | Design-out eliminates years of revenue; automotive qualification loss is near-permanent |
| 2 | Foundry partner (TSMC, Samsung, etc.) | Capacity allocation reduced; advanced node access delayed or lost |
| 3 | Key FAE / field engineering contact | Customer escalation path breaks; issues go undetected until crisis |

### Blame Transfer Seam

| # | Seam Boundary | What Falls Through |
|---|--------------|-------------------|
| 1 | HW design vs. FW/SW team | Errata ownership disputes; HW declares "met spec," SW absorbs workarounds silently |
| 2 | Front-end (RTL) vs. back-end (P&R) design | Timing closure failures blamed on either synthesis constraints or floorplan; root cause unowned |
| 3 | Design verification (DV) vs. design | Coverage gaps: DV says "tested per spec," design says "spec was correct" -- escaped bugs are orphaned |
| 4 | Silicon (die) vs. package/board | Signal integrity and thermal issues at the die-package interface; neither team fully models the other's domain |

---

## 2. Software Startup

### Hard Constraint

| # | Constraint | Why It Is Inviolable |
|---|-----------|----------------------|
| 1 | Cash runway (months of operating capital) | When cash hits zero, operations stop -- no amount of product vision changes arithmetic |
| 2 | Key customer SLA commitments (uptime, response time) | Contractual with financial penalties; breaches trigger churn of anchor accounts |
| 3 | Public API contracts (v1 compatibility) | External developers have built on the API; breaking changes destroy ecosystem trust |
| 4 | Data privacy regulations (GDPR, CCPA) | Non-compliance triggers fines and injunctions; cannot be deferred |
| 5 | Platform store policies (Apple, Google) | App rejection blocks the primary distribution channel |

### Patch Pattern

| # | Pattern | What It Masks |
|---|---------|--------------|
| 1 | "Ship it and fix later" tech debt accumulation | Architectural deficiency; each patch increases coupling and future change cost |
| 2 | Hardcoded customer-specific logic | Product/market fit failure; product cannot generalize, but nobody wants to admit it |
| 3 | Skipping automated tests to hit sprint deadline | Quality process breakdown; defect escape rate rises silently |
| 4 | Feature flags used as permanent state | Incomplete feature delivery; flags become entangled, creating untestable combinatorial states |
| 5 | Manual data migration scripts | Missing data layer abstraction; each migration is a one-off risk with no rollback |

### Irreversible Milestone

| # | Milestone | Why It Is Irreversible |
|---|-----------|----------------------|
| 1 | Public product launch | Market perception is set; first impressions with users and press cannot be re-done |
| 2 | Series A/B Demo Day | Investor narrative is locked; failing to deliver on demo promises poisons future fundraising |
| 3 | Key customer POC deadline | Customer evaluation window closes; missing it means waiting for next budget cycle (6--12 months) |
| 4 | Public API v1 release | External integrations begin building; breaking changes post-release destroy developer trust |

### Trade-off Axes

| Axis | Unit / Metric | Typical Tension |
|------|--------------|----------------|
| **Speed** | Time-to-feature, sprint velocity | Faster delivery increases tech debt and defect rate |
| **Quality** | Bug count, test coverage, uptime | Higher quality requires more time and slows feature throughput |
| **Technical Debt** | Refactor backlog, coupling metrics | Paying down debt slows visible feature delivery but reduces future cost |

### Tier-1 Relationship

| # | Stakeholder | Impact of Losing Confidence |
|---|------------|----------------------------|
| 1 | Lead VC investor | Follow-on funding jeopardized; board dynamics shift adversarially |
| 2 | Flagship customer | Logo loss undermines sales pipeline; reference selling collapses |
| 3 | Key technology partner (cloud provider, platform) | Integration support withdrawn; competitive advantage erodes |

### Blame Transfer Seam

| # | Seam Boundary | What Falls Through |
|---|--------------|-------------------|
| 1 | Frontend vs. backend engineering | Performance issues at the API boundary; each side claims the other is the bottleneck |
| 2 | Product management vs. engineering | Scope creep vs. "engineering is slow" -- neither owns the priority-vs-capacity mismatch |
| 3 | New feature development vs. ops/reliability (SRE) | Reliability debt accumulates because feature teams ship and move on; SRE inherits instability |

---

## 3. Medical Device / Pharmaceutical

### Hard Constraint

| # | Constraint | Why It Is Inviolable |
|---|-----------|----------------------|
| 1 | FDA/TFDA/CE regulatory approval requirements | Product cannot be legally sold without clearance; shortcuts trigger enforcement action |
| 2 | ISO 13485 quality management system | Certification prerequisite for market access; loss shuts down commercial operations |
| 3 | Clinical trial ethics (IRB/ICH-GCP) | Patient safety and informed consent are non-negotiable; violations trigger trial halt |
| 4 | Patient safety thresholds (biocompatibility, radiation limits) | Exceeding limits causes direct harm; no commercial justification overrides this |
| 5 | Design History File (DHF) traceability | Regulatory submissions require complete traceability; gaps invalidate the filing |

### Patch Pattern

| # | Pattern | What It Masks |
|---|---------|--------------|
| 1 | Software Change Notice (SCN) to avoid full V&V cycle | Design deficiency requiring a proper design change; SCN bypasses validation rigor |
| 2 | IFU (Instructions for Use) modification instead of design fix | Device does not perform as intended; labeling change transfers risk to the user |
| 3 | Post-market surveillance deferral ("monitoring the situation") | Known field issue lacking root cause; deferral delays CAPA and accumulates patient risk |
| 4 | 510(k) predicate stretching | Substantial equivalence argument is weak; regulatory strategy masks novelty to avoid PMA |
| 5 | Risk file score manipulation (reducing severity or probability) | Actual risk exceeds acceptable threshold; score adjustment avoids triggering design mitigation |

### Irreversible Milestone

| # | Milestone | Why It Is Irreversible |
|---|-----------|----------------------|
| 1 | 510(k)/PMA submission deadline | Regulatory queue position lost; resubmission adds 6--18 months |
| 2 | Clinical trial initiation (first patient enrolled) | Protocol changes require amendment and re-approval; patient data collected under original protocol |
| 3 | Product recall decision | Public disclosure triggers; market confidence and brand damage are immediate and lasting |

### Trade-off Axes

| Axis | Unit / Metric | Typical Tension |
|------|--------------|----------------|
| **Safety** | Risk score (severity x probability), adverse events | Higher safety margins increase development time and cost |
| **Time-to-Market** | Months to clearance/approval | Faster timelines pressure verification and validation thoroughness |
| **Development Cost** | R&D spend, clinical trial cost | Lower cost tempts shortcuts in testing, documentation, and design controls |

### Tier-1 Relationship

| # | Stakeholder | Impact of Losing Confidence |
|---|------------|----------------------------|
| 1 | FDA reviewer / notified body auditor | Submission rejected or audit finding escalated; market access blocked |
| 2 | KOL clinical physician | Clinical adoption stalls; peer influence turns negative |
| 3 | Distribution partner | Channel to market constricts; geographic expansion halted |
| 4 | Notified body (CE marking) | Certificate suspended; European market access revoked |

### Blame Transfer Seam

| # | Seam Boundary | What Falls Through |
|---|--------------|-------------------|
| 1 | R&D engineering vs. RA/QA (Regulatory Affairs / Quality) | Design decisions made without regulatory input; RA discovers compliance gaps late |
| 2 | Clinical affairs vs. engineering | Clinical feedback on usability or efficacy not translated into design requirements |
| 3 | Design control process vs. project schedule | Design reviews become rubber stamps under schedule pressure; verification gaps are papered over |

---

## 4. Construction Engineering

### Hard Constraint

| # | Constraint | Why It Is Inviolable |
|---|-----------|----------------------|
| 1 | Building codes (structural, fire, seismic) | Legal minimum for occupant safety; non-compliance halts construction or triggers demolition |
| 2 | Structural safety factors (load-bearing calculations) | Physics-based; under-designed structures fail catastrophically |
| 3 | Environmental assessment / impact requirements | Regulatory prerequisite for permit; violations trigger stop-work orders and fines |
| 4 | Zoning and land-use laws | Determine what can be built where; violations void permits retroactively |
| 5 | Contractual completion date with liquidated damages | Financial penalty per day of delay; non-negotiable once contract is signed |

### Patch Pattern

| # | Pattern | What It Masks |
|---|---------|--------------|
| 1 | Build first, apply for permit retroactively | Planning or approval process failure; creates legal exposure and rework risk |
| 2 | Design change orders (DCOs) to mask original defects | Original design was inadequate; DCO reframes defect as "enhancement" |
| 3 | Weather blame for schedule delays | Poor planning or resource management; weather becomes a universal excuse |
| 4 | Value engineering that removes safety margin | Cost overrun; "optimization" reduces structural or material quality to stay on budget |
| 5 | Temporary shoring left as permanent structure | Structural design incomplete; temporary fix becomes hidden permanent load path |

### Irreversible Milestone

| # | Milestone | Why It Is Irreversible |
|---|-----------|----------------------|
| 1 | Building permit issuance (approved plans) | Design is legally committed; changes require re-approval cycle |
| 2 | Foundation pour (concrete placement) | Structural geometry is set in concrete -- literally; correction requires demolition |
| 3 | Structural completion (topping out) | Load paths are fixed; modifying structure post-completion is extremely costly |
| 4 | Occupancy permit application | Regulatory inspection triggered; deficiencies discovered at this stage delay handover |

### Trade-off Axes

| Axis | Unit / Metric | Typical Tension |
|------|--------------|----------------|
| **Cost** | Total project cost, cost per sqm | Lower cost pressures material quality and safety margins |
| **Schedule** | Months to completion, milestone dates | Faster schedule increases error rate and requires more concurrent trades |
| **Quality** | Defect rate, rework percentage, material grade | Higher quality increases cost and may extend schedule |

### Tier-1 Relationship

| # | Stakeholder | Impact of Losing Confidence |
|---|------------|----------------------------|
| 1 | Property owner / developer | Project funding and decisions; loss of confidence triggers scope freeze or project halt |
| 2 | Regulatory authority (building department) | Permit revocation or enhanced inspection regime; project timeline extends |
| 3 | Financing bank | Loan covenant breach; draw-down frozen, project stalls |
| 4 | Insurance underwriter | Coverage withdrawn; project cannot proceed without liability insurance |

### Blame Transfer Seam

| # | Seam Boundary | What Falls Through |
|---|--------------|-------------------|
| 1 | Architect / design firm vs. general contractor | Constructability issues: design says "per spec," GC says "unbuildable as drawn" |
| 2 | General contractor vs. subcontractors | Defect ownership disputed at trade boundaries (e.g., MEP penetrations through structure) |
| 3 | Construction supervision vs. site execution | Quality escapes: supervisor approved inspection, crew deviated from method statement |

---

## 5. Manufacturing / Supply Chain

### Hard Constraint

| # | Constraint | Why It Is Inviolable |
|---|-----------|----------------------|
| 1 | Process qualification (PPAP/FMEA) | Customer and regulatory requirement; unqualified process cannot ship product |
| 2 | Contractual volume commitments (take-or-pay) | Financial obligation regardless of demand; breach triggers penalties |
| 3 | Material certifications (RoHS, REACH, conflict minerals) | Non-compliant materials cannot be used in regulated markets |
| 4 | Safety standards (ISO 45001, OSHA) | Worker safety is non-negotiable; violations trigger shutdown and prosecution |
| 5 | Customer-approved BOM (Bill of Materials) | Substitutions without customer re-qualification void the contract |

### Patch Pattern

| # | Pattern | What It Masks |
|---|---------|--------------|
| 1 | Rework stations added to production line | Process capability (Cpk) is insufficient; rework hides yield loss |
| 2 | Additional inspection gates (100% inspection) | Statistical process control has failed; inspection substitutes for process quality |
| 3 | Manual override of automated quality checks | Automation parameters are wrong or process is out of control; overrides hide reject rate |
| 4 | Safety stock hoarding (excess buffer inventory) | Supply chain fragility or demand forecast failure; hoarding masks planning dysfunction |
| 5 | Spot market purchases at premium pricing | Procurement planning failure or supplier relationship breakdown; cost impact hidden in variance |

### Irreversible Milestone

| # | Milestone | Why It Is Irreversible |
|---|-----------|----------------------|
| 1 | Production line changeover (tooling installed) | Capital committed; reverting to old configuration wastes investment and time |
| 2 | Tooling investment (molds, dies, fixtures) | Custom tooling is sunk cost; design changes require new tooling |
| 3 | Long-lead-time material order (specialty alloys, custom ICs) | Lead times of 6--18 months; cancellation incurs liability and restarts the clock |
| 4 | Contract execution with volume commitment | Legal obligation locked in; renegotiation is costly and damages relationship |

### Trade-off Axes

| Axis | Unit / Metric | Typical Tension |
|------|--------------|----------------|
| **Cost** | Unit cost, total cost of ownership | Lower cost pressures quality and increases supply chain risk |
| **Quality** | Defect PPM, Cpk, first-pass yield | Higher quality requires tighter process control, increasing cost and potentially reducing throughput |
| **Throughput** | Units per hour, OEE | Higher throughput pressures quality controls and increases wear on tooling |

*For supply chain specifically:*

| Axis | Unit / Metric | Typical Tension |
|------|--------------|----------------|
| **Cost** | Landed cost, freight cost | Lower cost increases lead time (sea vs. air) and concentrates supplier risk |
| **Lead Time** | Days from order to delivery | Shorter lead time increases cost (expedite fees) or requires higher inventory |
| **Risk** | Supplier concentration, geographic exposure | Risk mitigation (dual-source, nearshoring) increases cost and complexity |

### Tier-1 Relationship

| # | Stakeholder | Impact of Losing Confidence |
|---|------------|----------------------------|
| 1 | Key OEM customer | Volume pulled; qualification for next-gen product at risk |
| 2 | Sole-source supplier | Supply disruption with no alternative; production halts |
| 3 | Logistics partner (3PL) | Distribution capability degraded; delivery commitments missed |
| 4 | Certification body (ISO, UL, TUV) | Certification suspended; product cannot ship to regulated markets |

### Blame Transfer Seam

| # | Seam Boundary | What Falls Through |
|---|--------------|-------------------|
| 1 | Design engineering vs. manufacturing engineering | Design-for-manufacturability gaps; design says "per spec," manufacturing says "unproducible at yield" |
| 2 | Procurement vs. production planning | Material shortages: procurement blames forecast, planning blames lead-time data |
| 3 | Quality assurance vs. operations | Yield and defect ownership: QA sets standards, operations owns output -- neither owns the gap |

---

## 6. Financial Services

### Hard Constraint

| # | Constraint | Why It Is Inviolable |
|---|-----------|----------------------|
| 1 | Regulatory compliance (Basel III, MiFID II, SOX, Dodd-Frank) | Non-compliance triggers fines, license revocation, and personal liability for officers |
| 2 | Fiduciary duty to clients | Legal obligation; breach exposes firm to litigation and reputational destruction |
| 3 | Capital adequacy requirements (CET1, leverage ratio) | Falling below thresholds triggers regulatory intervention and restricts business activities |
| 4 | Anti-money laundering (AML/KYC) requirements | Violations carry criminal penalties; license to operate revoked |
| 5 | Market conduct rules (insider trading, market manipulation) | Criminal prosecution and firm-level sanctions; no commercial justification |

### Patch Pattern

| # | Pattern | What It Masks |
|---|---------|--------------|
| 1 | Manual reconciliation instead of system fix | System architecture deficiency; manual process is error-prone and unscalable |
| 2 | Exception processing (manual overrides) | Business rules or system logic failure; exceptions become the norm, hiding systemic issues |
| 3 | Regulatory interpretation stretching ("aggressive but defensible") | Compliance gap; creative reading of rules delays proper remediation |
| 4 | Retroactive booking adjustments | Process or control failure; adjustments hide the timing and nature of errors |
| 5 | Spreadsheet-based risk calculations outside official systems | Model infrastructure inadequacy; shadow IT creates unauditable risk exposure |

### Irreversible Milestone

| # | Milestone | Why It Is Irreversible |
|---|-----------|----------------------|
| 1 | Regulatory filing deadline (annual report, stress test submission) | Missing deadline triggers enforcement action; resubmission does not undo the violation |
| 2 | Audit completion and opinion issuance | Qualified opinion or material weakness disclosure is public; reputational impact is immediate |
| 3 | Product launch to market (fund launch, new instrument) | Client money is invested; unwinding positions has market impact and client notification requirements |
| 4 | M&A closing | Legal transfer of ownership; post-close discovery of issues must be resolved within the merged entity |

### Trade-off Axes

| Axis | Unit / Metric | Typical Tension |
|------|--------------|----------------|
| **Risk** | VaR, credit exposure, operational loss events | Lower risk reduces return potential and competitive positioning |
| **Return** | ROE, revenue, P&L | Higher return requires accepting more risk or reducing compliance investment |
| **Compliance Cost** | Regulatory spend, control overhead, FTE | Higher compliance investment reduces operational risk but directly reduces profitability |

### Tier-1 Relationship

| # | Stakeholder | Impact of Losing Confidence |
|---|------------|----------------------------|
| 1 | Regulator (SEC, FCA, FSC) | Enhanced supervision, consent orders, restrictions on business activities |
| 2 | Institutional investor (pension funds, sovereign wealth) | AUM outflows; redemption pressure forces asset liquidation at unfavorable prices |
| 3 | Rating agency (Moody's, S&P, Fitch) | Downgrade increases funding costs and triggers collateral calls |
| 4 | External audit firm | Qualified opinion or relationship termination signals market distrust |

### Blame Transfer Seam

| # | Seam Boundary | What Falls Through |
|---|--------------|-------------------|
| 1 | Front office (trading, sales) vs. risk management | Risk limits breached; front office says "within spirit of limit," risk says "letter of policy violated" |
| 2 | Compliance vs. business lines | New product compliance review: business says "revenue critical," compliance says "unreviewed risk" |
| 3 | IT / technology vs. operations | System outages and processing failures: IT blames change requests, ops blames system reliability |
| 4 | Portfolio management vs. trading execution | Performance attribution disputes; PM blames execution quality, trading blames allocation timing |

---

## Usage Notes

1. **Domain detection:** The system infers the project domain from input data (technology keywords, organizational structure, regulatory references) and selects the matching template above.
2. **Hybrid domains:** Many projects span two domains (e.g., automotive IC design touches both Semiconductor and Manufacturing). In such cases, merge the relevant elements from both templates.
3. **Extension:** If a project falls outside these six domains, use the closest analog as a starting template and adapt the elements based on evidence found in the input data.
4. **Patch pattern priority:** During analysis, detected patch patterns should be mapped to this reference to confirm they are genuine workarounds (not legitimate engineering decisions) and to estimate their hidden cost.
