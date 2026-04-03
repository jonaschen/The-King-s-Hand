# Value Chain Map — Medical Device / Pharmaceutical

> Reference knowledge base for The King's Hand. Maps each layer of the medical
> device development value chain to its technical scope, failure modes,
> document-language detection patterns, and business value translation.

---

## Overview

Medical device development follows a heavily regulated value chain where each layer depends on the integrity of those below it. Value flows from foundational quality and regulatory infrastructure, through design and engineering, into verification and validation, through clinical evidence and regulatory submission, and finally into manufacturing and post-market surveillance. The defining characteristic of this domain is that regulatory compliance is not a gate at the end — it is woven through every layer. A failure at any layer can trigger a cascade that blocks market access, forces a recall, or exposes the company to criminal liability.

The key transformation at each stage: regulatory requirements become design inputs, design inputs become verified outputs, verified outputs become clinical evidence, clinical evidence becomes market authorization, and market authorization becomes commercial product under continuous surveillance.

## Layer Summary

| Layer | Scope | Business Value |
|:------|:------|:---------------|
| Layer 1 — Regulatory & Quality System Foundation | QMS infrastructure, design controls framework, risk management system, regulatory intelligence | Market access eligibility; audit readiness; liability protection |
| Layer 2 — Design & Development | User needs, design inputs/outputs, architecture, prototyping, design reviews | Product definition; IP creation; competitive differentiation |
| Layer 3 — Verification & Validation | Bench testing, biocompatibility, EMC/EMI, software V&V, usability | Evidence that the device meets specifications and user needs |
| Layer 4 — Clinical & Regulatory Submission | Clinical trials, 510(k)/PMA/CE marking submission, FDA/notified body review | Market authorization; revenue unlock; competitive timing |
| Layer 5 — Manufacturing & Post-Market | Production transfer, process validation, supplier qualification, post-market surveillance, CAPA | Sustained revenue; field safety; regulatory standing |

---

## Layer 1 — Regulatory & Quality System Foundation

### Technical Scope

The foundational infrastructure upon which all device development activities rest. This layer encompasses the Quality Management System (QMS) per ISO 13485, the design controls framework per 21 CFR 820.30 and EU MDR Annex II, the risk management system per ISO 14971, regulatory intelligence (classification, predicate identification, regulatory pathway selection), and the document control and records management systems that provide traceability.

### Key Components

- **Quality Management System (QMS):** ISO 13485-compliant system governing document control, CAPA, management review, internal audits, training, and supplier management. The backbone of regulatory compliance.
- **Design Controls Framework:** The structured process (design input → design output → verification → validation → design transfer → design changes) mandated by FDA and EU MDR. Governs how design decisions are made, documented, and traced.
- **Risk Management System (ISO 14971):** Hazard identification, risk estimation, risk evaluation, risk control, and residual risk assessment. Must be a living system updated throughout the product lifecycle, not a one-time document.
- **Regulatory Intelligence:** Classification determination (Class I/II/III in US; Class I/IIa/IIb/III in EU), predicate device identification for 510(k), regulatory pathway selection (510(k), De Novo, PMA, CE marking under MDR), and standards mapping (IEC 60601, IEC 62304, IEC 62366).
- **Document Control & Traceability:** Design History File (DHF), Device Master Record (DMR), Device History Record (DHR), and the traceability matrix linking user needs → design inputs → design outputs → verification → validation.

### Common Failure Modes

| Failure | Consequence | Severity |
|:--------|:-----------|:---------|
| QMS not maintained or procedurally non-compliant | FDA 483 observations or EU notified body nonconformities; can halt all submissions and ongoing production | Critical |
| Design controls not followed from project inception | Retroactive documentation required; DHF integrity compromised; auditor findings inevitable | Critical |
| Risk management performed retrospectively rather than concurrently | Risk file does not reflect actual design decisions; residual risk justifications are fabricated; FDA/notified body rejection | Critical |
| Incorrect device classification or regulatory pathway | Months of wasted effort on wrong submission type; complete restart of regulatory strategy | High |
| Traceability matrix gaps between user needs and verification | Cannot demonstrate that all user needs are verified; submission incomplete; FDA RTA (Refuse to Accept) | High |

### Detection Language in Documents

- "QMS remediation in progress" → QMS has failed an audit or self-assessment; the foundation is cracked
- "Design controls being applied retroactively" → the team built first, documented later; DHF integrity is fundamentally compromised
- "Risk management file under review" → risk analysis was not maintained alongside design; now being reverse-engineered from design outputs
- "Regulatory pathway under evaluation" → classification is uncertain or the chosen pathway has hit an obstacle; all downstream planning is on sand
- "Updating traceability matrix" → traceability was not maintained; gaps exist between requirements and evidence

### Business Value Translation

**Formula:** QMS/Regulatory Foundation quality = market access eligibility + audit survivability + liability shield.

A compromised foundation means: (1) FDA can issue a Warning Letter that halts all US market shipments and new submissions until the QMS is remediated — this can take 12-24 months and cost $5M-$50M+ in lost revenue and remediation expense, (2) EU notified bodies can suspend or withdraw CE certificates, closing the European market, (3) any device cleared or approved on a defective QMS foundation is retroactively vulnerable — a single audit finding can unravel the legitimacy of every product in the portfolio, (4) personal criminal liability for executives under US federal law (Park Doctrine) and EU MDR Article 15.

---

## Layer 2 — Design & Development

### Technical Scope

The creative and engineering core of device development. This layer transforms user needs and regulatory requirements into a defined, documented product design. It encompasses user needs gathering, design input specification, system architecture, detailed design (mechanical, electrical, software, firmware), prototyping, and formal design reviews (conceptual, preliminary, critical, final).

### Key Components

- **User Needs & Design Inputs:** Capture of intended use, user population, use environment, performance requirements, safety requirements, and regulatory requirements. Design inputs must be unambiguous, verifiable, and traceable to user needs.
- **System Architecture:** Decomposition of the device into subsystems (hardware, software, mechanical, fluidics, optics, etc.), definition of interfaces between subsystems, and allocation of requirements to subsystems.
- **Detailed Design — Hardware/Electrical:** Circuit design, PCB layout, power management, signal integrity, sensor integration, battery management, wireless communication modules.
- **Detailed Design — Software:** Software requirements specification, software architecture, detailed design per IEC 62304 (software lifecycle for medical devices). Software safety classification (Class A/B/C) drives the rigor of documentation and testing required.
- **Detailed Design — Mechanical/Industrial:** Enclosure design, ergonomics, materials selection (biocompatibility considerations), sealing (IP ratings), sterilization compatibility, manufacturability (DFM).
- **Prototyping & Design Reviews:** Iterative prototyping (3D printing, breadboards, alpha/beta units), and formal design reviews at defined milestones with documented decisions, action items, and attendee records.

### Common Failure Modes

| Failure | Consequence | Severity |
|:--------|:-----------|:---------|
| Incomplete or ambiguous design inputs | Verification tests cannot be written; design output traceability is broken; submission will be challenged | Critical |
| Software safety class underestimated | IEC 62304 documentation and testing requirements not met for actual risk level; regulatory rejection or post-market safety issue | Critical |
| No formal design reviews or reviews without documented decisions | Design control violation; DHF gaps; FDA 483 observation | High |
| Requirements creep without formal design change process | Uncontrolled changes propagate through the design; verification plan becomes invalid; schedule and budget destroyed | High |
| Subsystem interfaces not formally defined | Integration failures during V&V; redesign loops; schedule slip of months | High |
| Materials selected without biocompatibility assessment | Failed biocompatibility testing late in development; material change cascades through mechanical, manufacturing, and sterilization validation | Critical |

### Detection Language in Documents

- "Design inputs being refined" → requirements are not frozen; everything downstream is building on a moving target
- "Software classification under discussion" → the team is trying to justify a lower safety class to reduce documentation burden; regulatory risk is being accepted implicitly
- "Informal design review conducted" → the review did not meet design control requirements; DHF will have a gap
- "Requirements evolving based on prototype feedback" → uncontrolled scope creep; no formal change process being followed
- "Architecture being finalized" → late in development, the system architecture is still not defined; a fundamental design problem likely exists
- "Material selection optimization" → a previously selected material has failed a requirement (often biocompatibility); the change will cascade

### Business Value Translation

**Formula:** Design quality = development efficiency + V&V cost predictability + regulatory submission integrity.

Design failures mean: (1) every deficiency in design inputs multiplies into 3-10x rework cost during V&V because tests must be rewritten or redesigned, (2) uncontrolled design changes after design freeze can invalidate completed verification testing — $100K-$1M+ in repeated testing, (3) software safety classification errors can result in FDA rejection and 6-18 months of additional documentation and testing, (4) the Design History File is the primary document FDA reviewers examine — gaps in the DHF are the single most common cause of 510(k) Additional Information requests and PMA deficiency letters.

---

## Layer 3 — Verification & Validation

### Technical Scope

The evidence-generation layer. Verification confirms that design outputs meet design inputs (did we build it right?). Validation confirms that the device meets user needs and intended use (did we build the right thing?). This layer encompasses bench testing, biocompatibility testing (ISO 10993 series), electrical safety testing (IEC 60601-1), EMC/EMI testing (IEC 60601-1-2), software verification and validation per IEC 62304, sterility validation, usability engineering (IEC 62366 / human factors), packaging validation, shelf life/stability testing, and simulated and actual use validation.

### Key Components

- **Bench Testing (Design Verification):** Performance testing against each design input specification. Includes mechanical testing (fatigue, drop, compression), electrical testing (dielectric strength, leakage current, ground bond), environmental testing (temperature, humidity, altitude), and functional testing.
- **Biocompatibility Testing (ISO 10993):** Cytotoxicity, sensitization, irritation, systemic toxicity, genotoxicity, implantation, hemocompatibility — as determined by the biological evaluation plan based on patient contact nature and duration.
- **Electrical Safety & EMC (IEC 60601):** Electrical safety testing per IEC 60601-1 (means of protection, leakage current, mechanical hazards), and electromagnetic compatibility per IEC 60601-1-2 (emissions and immunity).
- **Software V&V (IEC 62304):** Unit testing, integration testing, system testing, and regression testing with coverage requirements determined by software safety classification. Anomaly management and problem resolution per IEC 62304 clause 9.
- **Usability Engineering (IEC 62366):** Formative usability evaluations, summative (human factors validation) testing with representative users performing critical tasks. Use-related risk analysis integration with ISO 14971.
- **Sterilization Validation:** If applicable — sterility assurance level (SAL) demonstration, bioburden testing, process validation for EO, gamma, steam, or other sterilization methods.

### Common Failure Modes

| Failure | Consequence | Severity |
|:--------|:-----------|:---------|
| V&V test failures requiring design changes | Design-test-redesign loop; 3-12 month schedule impact per major failure; budget overrun | Critical |
| Biocompatibility test failure | Material change required; cascades to mechanical design, manufacturing process, and sterilization validation | Critical |
| EMC/EMI test failure | Redesign of PCB layout or shielding; repeat of expensive third-party lab testing ($50K-$200K per round) | High |
| Software anomalies found during system testing with no resolution | Open anomalies must be risk-assessed per IEC 62304; unresolved Class C software anomalies can block submission | High |
| Usability validation failure on critical tasks | Redesign of user interface; repeat of summative testing with new participants ($100K-$300K per round); potential use-related recall risk if shipped | Critical |
| Sterilization validation failure | Process redesign; compatibility testing restart; 6-12 month delay | High |

### Detection Language in Documents

- "V&V test results under review" → test failures have occurred; the team is deciding whether to retest, adjust acceptance criteria, or redesign
- "Biocompatibility testing scope being refined" → a test has failed or the team is trying to justify excluding a required test
- "EMC pre-compliance testing in progress" → the device is failing formal EMC requirements; pre-compliance is being used to iterate before committing to expensive formal testing
- "Software anomaly assessment ongoing" → unresolved software bugs exist; the team is trying to classify them as acceptable rather than fixing them
- "Usability findings being incorporated" → critical use errors were observed; the interface needs redesign before summative validation
- "Sterilization parameters being optimized" → the validated sterilization process is not achieving SAL or is damaging the device

### Business Value Translation

**Formula:** V&V quality = submission readiness + timeline predictability + post-market safety confidence.

V&V failures mean: (1) every major test failure adds 3-12 months to the program schedule — there is no shortcut through physics, biology, or EMC compliance, (2) the cost of repeating third-party testing (biocompatibility suites: $200K-$500K; EMC: $50K-$200K; usability validation: $100K-$300K) directly impacts program budget, (3) V&V evidence is the core of every regulatory submission — incomplete or failed V&V means the submission cannot be filed, (4) shipping a device with unresolved V&V failures creates recall risk and personal liability for the management representative and person responsible for regulatory compliance.

---

## Layer 4 — Clinical & Regulatory Submission

### Technical Scope

The market authorization layer. This is where all preceding work is assembled into a regulatory submission and defended before regulatory authorities. It encompasses clinical evaluation (literature review for 510(k) or clinical investigation for PMA/higher-risk EU MDR), regulatory submission preparation (510(k), De Novo, PMA, EU Technical Documentation per MDR Annex II/III), regulatory authority interactions (pre-submission meetings, FDA review cycles, notified body audits), and the formal market authorization decision.

### Key Components

- **Clinical Evaluation / Investigation:** For 510(k): clinical data from predicate devices and/or literature. For PMA: prospective clinical trial with IDE (Investigational Device Exemption). For EU MDR: Clinical Evaluation Report (CER) per MEDDEV 2.7/1 Rev 4, and potentially a clinical investigation per ISO 14155.
- **510(k) Submission:** Substantial equivalence argument to a predicate device, covering intended use, technological characteristics, and performance data. Includes device description, predicate comparison, performance testing, biocompatibility, software documentation (if applicable), labeling, and sterilization.
- **PMA Submission:** Complete scientific evidence of safety and effectiveness. Includes manufacturing information, non-clinical testing, clinical data, and proposed labeling. The most rigorous US pathway.
- **EU MDR Technical Documentation:** Annex II (technical documentation) and Annex III (post-market surveillance documentation). Includes General Safety and Performance Requirements (GSPR) checklist, clinical evaluation, risk-benefit analysis, and all V&V evidence.
- **Regulatory Authority Interactions:** Pre-submission (Q-Sub) meetings with FDA, responses to Additional Information (AI) requests, panel meetings (for PMA), notified body documentation reviews, and on-site audits.

### Common Failure Modes

| Failure | Consequence | Severity |
|:--------|:-----------|:---------|
| 510(k) RTA (Refuse to Accept) | Submission returned without review; 2-6 month delay while deficiencies are corrected and resubmitted | Critical |
| PMA deficiency letter with major findings | 6-18 month delay for additional clinical data or testing; may require protocol amendment and additional enrollment | Critical |
| Predicate device strategy invalidated | No valid substantial equivalence argument; must pivot to De Novo or PMA pathway; 12-36 month schedule impact | Critical |
| Clinical trial adverse event or protocol deviation | FDA clinical hold; enrollment suspension; potential study termination; company reputation damage | Critical |
| EU MDR notified body rejects Technical Documentation | CE marking denied; no European market access; must remediate and resubmit; 6-18 month delay | Critical |
| Clinical endpoint not met | Pivotal study fails; device cannot be approved on current evidence; may need redesign, new study, or program termination | Critical |

### Detection Language in Documents

- "Regulatory strategy alignment in progress" → FDA or notified body has pushed back; the current approach is not viable
- "Predicate landscape analysis ongoing" → the team cannot find a suitable predicate device; 510(k) pathway may be invalid
- "Clinical protocol refinement" → clinical endpoints are not being met; the team is adjusting success criteria or patient population
- "Pre-submission meeting being scheduled" → a significant question or concern exists that cannot be resolved internally; seeking FDA guidance is an escalation signal
- "Responding to FDA Additional Information request" → the submission had deficiencies; the clock has stopped on the review
- "Clinical enrollment pace being monitored" → enrollment is behind plan; the study is unlikely to meet its timeline
- "Notified body audit preparation" → the team is not confident the QMS and technical documentation will survive scrutiny

### Business Value Translation

**Formula:** Regulatory submission quality = time-to-market + revenue unlock timing + competitive window.

Regulatory failures mean: (1) every month of delay in market authorization is a month of lost revenue — for a device with $50M annual revenue potential, each month of delay costs $4M+, (2) FDA RTA or deficiency letters are visible signals to competitors that the company's regulatory capability is weak, (3) clinical trial failures can cost $10M-$100M+ in sunk investment with no product to show for it, (4) EU MDR has created a capacity bottleneck at notified bodies — a rejected submission means going to the back of a 12-18 month queue, (5) a failed regulatory strategy (wrong pathway, wrong predicate) can add 2-3 years to a program that was expected to take 18 months.

---

## Layer 5 — Manufacturing & Post-Market

### Technical Scope

The commercialization and sustaining layer. This is where a cleared/approved device becomes a manufactured, distributed, and monitored commercial product. It encompasses design transfer, process validation (IQ/OQ/PQ), supplier qualification and management, production quality control (incoming inspection, in-process testing, final release), post-market surveillance (complaint handling, MDR/MAUDE reporting, periodic safety update reports), CAPA (Corrective and Preventive Action), and field safety corrective actions (recalls).

### Key Components

- **Design Transfer:** Translation of the Device Master Record (DMR) into manufacturing instructions, work instructions, process specifications, and inspection procedures. The bridge between R&D and manufacturing.
- **Process Validation (IQ/OQ/PQ):** Installation Qualification, Operational Qualification, and Performance Qualification of all manufacturing processes. Demonstrates that the process consistently produces output meeting predetermined specifications.
- **Supplier Qualification & Management:** Supplier audits, incoming inspection procedures, approved supplier list management, supplier corrective actions, and second-source qualification.
- **Post-Market Surveillance:** Complaint handling, Medical Device Reporting (MDR) to FDA / vigilance reporting in EU, trend analysis, Post-Market Clinical Follow-up (PMCF) studies under EU MDR, and Periodic Safety Update Reports (PSUR).
- **CAPA System:** Corrective and Preventive Action — investigation of nonconformances and complaints, root cause analysis, effectiveness verification, and systemic improvement.
- **Field Safety Corrective Actions (Recalls):** Recall classification (Class I/II/III), health hazard evaluation, customer notification, product retrieval or correction, and FDA/competent authority reporting.

### Common Failure Modes

| Failure | Consequence | Severity |
|:--------|:-----------|:---------|
| Design transfer incomplete — manufacturing cannot reproduce R&D prototypes | Production yield problems; quality nonconformances; shipment delays | Critical |
| Process validation failure (PQ) | Manufacturing process not demonstrated to be capable; cannot release product; redesign of process or product required | Critical |
| Supplier quality failure | Incoming material nonconformance; production line stoppage; customer shipment delay | High |
| Complaint trend undetected | FDA mandatory reporting deadline missed (30 days for death/serious injury, 5 days for emergent); regulatory enforcement action | Critical |
| CAPA effectiveness not verified | Recurring quality problems; audit finding; FDA Warning Letter escalation path | High |
| Recall required due to post-market safety signal | Direct cost of recall ($1M-$100M+); brand damage; stock price impact; potential consent decree | Critical |

### Detection Language in Documents

- "Design transfer challenges being addressed" → manufacturing cannot build the device to spec; R&D-to-production gap is wider than planned
- "Process validation parameters being refined" → the manufacturing process is not capable or not reproducible; PQ is failing
- "Supplier development program in progress" → a critical supplier is failing quality requirements; no qualified alternative exists
- "Complaint trend analysis underway" → complaint volume has increased; the team is determining whether a reportable event threshold has been crossed
- "CAPA root cause investigation ongoing" → root cause has not been identified despite investigation; the CAPA may be reopened or escalated
- "Post-market monitoring plan enhanced" → a safety signal has been detected in the field; the company is increasing surveillance intensity
- "Production yield optimization" → manufacturing yield is below acceptable levels; cost per unit is higher than planned; shipment commitments at risk

### Business Value Translation

**Formula:** Manufacturing & Post-Market quality = revenue continuity + regulatory standing + brand equity.

Failures at this layer mean: (1) a recall can cost $1M-$100M+ in direct costs (retrieval, replacement, investigation) plus immeasurable brand damage — Johnson & Johnson's ASR hip recall cost over $2.5B, (2) FDA Warning Letters are public documents that signal to hospitals, GPOs, and investors that the company has systemic quality problems — they can halt all new submissions until resolved, (3) EU MDR post-market requirements (PMCF, PSUR) are continuous obligations — failure to maintain them results in CE certificate suspension, (4) manufacturing quality directly determines gross margin — a 5% yield reduction on a high-volume device can cost millions annually, (5) supplier failures create single points of failure in the supply chain — during shortages, companies without qualified second sources cannot ship.

---

## Cross-Layer Dependencies

| From Layer | To Layer | Dependency Nature | Failure Propagation |
|:-----------|:---------|:-----------------|:-------------------|
| Layer 1 (QMS/Regulatory) | Layer 2 (Design) | Design controls framework governs how design is conducted and documented | If QMS is deficient, all design documentation is suspect; FDA can reject the entire DHF |
| Layer 1 (QMS/Regulatory) | Layer 5 (Manufacturing) | QMS governs production quality, CAPA, and supplier management | QMS failure at the manufacturing level triggers Warning Letters and production shutdowns |
| Layer 2 (Design) | Layer 3 (V&V) | Design inputs define what must be verified; design outputs define what is tested | Incomplete or changing design inputs make V&V impossible to plan or complete |
| Layer 3 (V&V) | Layer 4 (Submission) | V&V evidence is the core content of every regulatory submission | V&V gaps or failures mean the submission cannot be filed or will be rejected |
| Layer 2 (Design) | Layer 5 (Manufacturing) | Design transfer converts design outputs into manufacturing specifications | If design is not manufacturable, production cannot achieve consistent quality |
| Layer 4 (Submission) | Layer 5 (Post-Market) | Conditions of clearance/approval define post-market obligations | If submission commitments (e.g., post-market studies) are not met, clearance/approval can be withdrawn |
| Layer 5 (Post-Market) | Layer 1 (QMS) | Post-market data feeds back into risk management and CAPA | If post-market surveillance is inadequate, the risk management file becomes stale and the QMS degrades |

## Domain-Specific Terminology

| Term | Meaning | Layer |
|:-----|:--------|:------|
| 510(k) | Premarket notification to FDA demonstrating substantial equivalence to a predicate device | Layer 4 |
| PMA | Premarket Approval — FDA's most rigorous pathway requiring clinical evidence of safety and effectiveness | Layer 4 |
| DHF | Design History File — the complete record of a device's design and development activities | Layer 1-2 |
| DMR | Device Master Record — the complete set of manufacturing specifications and procedures | Layer 5 |
| CAPA | Corrective and Preventive Action — systematic process for investigating and resolving quality issues | Layer 5 |
| ISO 13485 | International standard for medical device quality management systems | Layer 1 |
| ISO 14971 | International standard for risk management of medical devices | Layer 1 |
| IEC 62304 | International standard for medical device software lifecycle processes | Layer 2-3 |
| IEC 60601 | International standard series for safety and essential performance of medical electrical equipment | Layer 3 |
| IEC 62366 | International standard for usability engineering of medical devices | Layer 3 |
| ISO 10993 | International standard series for biological evaluation of medical devices | Layer 3 |
| RTA | Refuse to Accept — FDA returns a submission without substantive review due to administrative deficiencies | Layer 4 |
| IDE | Investigational Device Exemption — FDA authorization to conduct a clinical trial | Layer 4 |
| MDR (EU) | Medical Device Regulation (EU) 2017/745 — European regulatory framework for medical devices | Layer 1-4 |
| MDR (US) | Medical Device Reporting — mandatory reporting of adverse events to FDA | Layer 5 |
| PMCF | Post-Market Clinical Follow-up — ongoing clinical evaluation required under EU MDR | Layer 5 |
| PSUR | Periodic Safety Update Report — regular safety reporting required under EU MDR | Layer 5 |
| SAL | Sterility Assurance Level — probability of a single viable microorganism being present after sterilization | Layer 3-5 |
| V&V | Verification and Validation — the two-part evidence framework proving a device meets specs and user needs | Layer 3 |
| GSPR | General Safety and Performance Requirements — EU MDR checklist of essential requirements | Layer 4 |
