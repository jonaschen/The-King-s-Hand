# Domain Inference Signals

Multi-signal domain classification system used by Step 0B (Domain Inference). When the system receives a document without an explicit domain designation, it applies the following signal hierarchy to determine which domain framework to load. Signals are evaluated in priority order; higher-confidence signals override lower ones.

---

## Signal Types (Priority Order)

### 1. User Explicit Statement

| Attribute | Value |
|-----------|-------|
| **Confidence Weight** | Highest (direct override) |
| **Detection Method** | Pattern-match first-person domain declarations in user prompt or document preamble. Triggers on phrases like "I'm a...", "Our team does...", "This is our..." combined with domain-indicative nouns. |

**Examples:**
- "I'm a medical device QA manager" --> Medical Device
- "This is our Series B startup" --> Software Startup
- "We're building a 5nm SoC for automotive" --> IC Design / Semiconductor
- "I manage a construction portfolio in Taipei" --> Construction
- "Our fund's compliance team flagged this" --> Financial Services
- "We run a Tier-1 supplier for EV battery modules" --> Manufacturing / Supply Chain

When a user explicit statement is present, it takes absolute precedence. No further signal evaluation is required for primary domain assignment, though secondary signals may still enrich the analysis.

---

### 2. Manager Profile Domain Tag

| Attribute | Value |
|-----------|-------|
| **Confidence Weight** | High |
| **Detection Method** | Read the `domain` field from the active manager profile loaded during Step 0A. The profile is stored in `manager_profiles/` and contains a pre-configured domain designation set during profile creation or calibration. |

If the manager profile has a domain tag, use it as the presumptive domain unless a user explicit statement in the current session contradicts it. A contradiction triggers a profile update prompt.

---

### 3. Terminology Density

| Attribute | Value |
|-----------|-------|
| **Confidence Weight** | Medium-High |
| **Detection Method** | Count domain-specific keywords per 1,000 words of input text. Normalize counts. The domain with the highest keyword density wins. A minimum threshold of 5 unique domain keywords per 1,000 words is required for classification; below this threshold, this signal is treated as inconclusive. |

#### Keyword Clusters by Domain

**IC Design / Semiconductor:**
tape-out, DRC, LVS, PPA, silicon errata, metal spin, ECO, netlist, GDS, foundry, process node, RTL, verification, DV, characterization, IP block, SoC, ASIC, FPGA, BSP, firmware, bootloader, AXI, PCIe, DDR, JTAG, boundary scan, wafer sort, die, package, ball map, thermal throttle, leakage, Vdd, clock tree

**Software / SaaS:**
sprint, burndown, deployment, CI/CD, technical debt, refactor, microservice, API, endpoint, latency, SLA, uptime, container, Kubernetes, pull request, code review, feature flag, A/B test, rollback, database migration, cache, load balancer, serverless, webhook, SDK, REST, GraphQL

**Medical Device / Pharma:**
FDA, 510(k), PMA, TFDA, CE mark, ISO 13485, IEC 62304, V&V, IFU, DHF, DMR, clinical trial, biocompatibility, sterilization, risk management (ISO 14971), CAPA, post-market surveillance, recall, adverse event, GMP, GCP, regulatory submission, notified body, predicate device

**Construction:**
building permit, zoning, structural engineering, concrete pour, rebar, formwork, geotechnical, foundation, load-bearing, HVAC, MEP, change order, punch list, certificate of occupancy, inspection, general contractor, subcontractor, architect of record, shop drawing, RFI, submittal

**Manufacturing / Supply Chain:**
PPAP, FMEA, SPC, OEE, yield, scrap rate, rework, cycle time, takt time, lean, Six Sigma, Kanban, MRP, BOM, ECN, incoming inspection, supplier audit, first article inspection, tooling, fixture, process capability, Cpk, control chart, safety stock, lead time, MOQ

**Financial Services:**
AUM, NAV, Sharpe ratio, Basel III, MiFID, SOX, KYC, AML, P&L, VaR, mark-to-market, settlement, clearing, custody, compliance, audit trail, fiduciary, portfolio, derivative, hedge, collateral, credit risk, market risk, operational risk, regulatory capital

---

### 4. Job Titles and Organizational Keywords

| Attribute | Value |
|-----------|-------|
| **Confidence Weight** | Medium |
| **Detection Method** | Scan for job titles, role names, and organizational unit names in the document. Match against domain-associated title patterns. Titles alone may be ambiguous (e.g., "VP of Engineering" spans multiple domains), so this signal is most useful as a corroborating factor alongside terminology density. |

**Domain Mappings:**

| Signal Keywords | Inferred Domain |
|----------------|-----------------|
| 護理長, 主治醫師, clinical director, regulatory affairs specialist, RA manager | Medical Device / Pharma |
| VP of Engineering, CTO, tech lead, SRE, DevOps engineer | Technology (requires additional signals to disambiguate IC vs. Software) |
| 基金經理, 風控, portfolio manager, compliance officer, risk analyst | Financial Services |
| 工地主任, 監造, site engineer, project architect, MEP coordinator | Construction |
| 採購經理, 供應鏈, procurement lead, plant manager, quality engineer | Manufacturing / Supply Chain |
| design engineer, DV lead, FAE, AE, layout engineer, silicon architect | IC Design / Semiconductor |

---

### 5. Metrics and KPI Types

| Attribute | Value |
|-----------|-------|
| **Confidence Weight** | Medium |
| **Detection Method** | Identify quantitative metrics, units of measurement, and KPI names in the document. Different domains use characteristic measurement vocabularies. Match observed metrics against the domain-specific sets below. |

**Domain Metric Signatures:**

| Metrics / Units | Inferred Domain |
|-----------------|-----------------|
| dB, TOPS, nm, mW, MHz, GHz, um, mm^2, Vdd, leakage current | IC Design / Semiconductor |
| DAU, MAU, MRR, ARR, churn, p99 latency, error rate, MTTR | Software / SaaS |
| AUM, Sharpe ratio, alpha, beta, drawdown, NAV, basis points | Financial Services |
| Cpk, OEE, yield%, PPM, DPMO, cycle time, takt time | Manufacturing / Supply Chain |
| bed occupancy, readmission rate, adverse event rate, MTBF (device) | Medical Device / Pharma |
| m^2, PSI, load capacity, concrete strength, story height | Construction |

---

### 6. Document Structure and Format

| Attribute | Value |
|-----------|-------|
| **Confidence Weight** | Low |
| **Detection Method** | Analyze the document's structural format, field names, and layout conventions. Different domains produce characteristically different document types. This signal is supplementary and should not drive classification alone. |

**Structural Indicators:**

| Document Format | Inferred Domain |
|----------------|-----------------|
| Jira CSV with hardware-related labels (RTL, DV, silicon, tapeout) | IC Design / Semiconductor |
| Jira CSV or sprint board format with software labels (backend, frontend, deploy) | Software / SaaS |
| Construction schedule / Gantt chart with trade breakdown structure | Construction |
| Financial statements, regulatory filing format, fund fact sheets | Financial Services |
| DHF structure, design history, V&V protocol documents | Medical Device / Pharma |
| PPAP documentation package, control plans, inspection records | Manufacturing / Supply Chain |

---

## Classification Output

After evaluating all available signals, the system produces one of three classification results:

### Recognized Domain

A matching domain pack exists at `domain_packs/{domain}/`. The system loads all reference files from the pack (anomaly keywords, framework templates, status criteria, code-word translations). Classification confidence is high. No user confirmation is required.

### Inferable Domain

No domain pack exists for the identified domain, but enough signals converge to construct the six-element analytical framework dynamically. The system uses `framework_templates.md` examples combined with domain-specific content extracted from the submitted document to build an ad-hoc framework. Classification confidence is medium. The system notes in its output that it is operating without a curated domain pack and flags areas where domain expertise may be thin.

### Unknown Domain

Insufficient signals for reliable classification. Fewer than two signal types returned a result, or signal types conflict without a clear winner. The system falls back to the generic analytical framework. If operating in interactive mode, the system proactively asks the user for domain context before proceeding. If operating in batch mode, the system proceeds with the generic framework and flags the classification uncertainty in its output.

---

## Multi-Domain Documents

When a document contains significant signals from multiple domains (e.g., a hardware-software co-development project, a medical device with supply chain issues, or a fintech product), the system applies the following rules:

1. **Identify the primary domain** based on the highest-weighted signal that resolves unambiguously. If terminology density is the deciding factor, the domain with the highest normalized keyword count is primary.

2. **Note secondary domains** explicitly in the analysis metadata. Secondary domains are those with keyword density above the minimum threshold but below the primary domain's count.

3. **Apply the primary domain's framework** for the core analytical structure (status criteria, override triggers, output modules).

4. **Extend anomaly signals** by merging the primary domain's anomaly keyword list with relevant keywords from secondary domain vocabularies. This ensures that cross-domain risk indicators (e.g., a firmware workaround in a medical device project) are not missed.

5. **Flag cross-domain friction points** as high-priority findings, since inter-domain boundaries are common sources of hidden project risk (e.g., hardware constraints forcing software workarounds, regulatory requirements conflicting with engineering timelines).
