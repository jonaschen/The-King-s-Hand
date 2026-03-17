# Test Case: Project Typhoon-5G (Email Thread Input)

## Test Metadata

| Field | Value |
|-------|-------|
| Test ID | TC-016 |
| Test Name | Email Thread Input — 5G NR Modem Baseband SoC Customer Escalation Chain |
| Primary Test Target | Real-format input handling: extract adversarial intelligence from a multi-party email thread with forwarded messages, reply chains, and divergent internal/external narratives in a single document |
| Secondary Test Targets | Detecting internal/external narrative split (PM's outbound message vs. engineering lead's internal message in the same thread); extracting customer escalation signal from formal business language in an email |
| Expected Status | 🔴 Red (confirmed Tier-1 customer escalation; alternate sourcing evaluation scheduled; internal emails reveal hardware qualification failure the PM has not disclosed externally) |
| Override Triggers | R4 (NordicTel AG — Tier-1 5G infrastructure OEM — has formally scheduled an alternate sourcing evaluation with Nordic Semi for Week 20, as stated explicitly in their email), R6 (PM outbound emails describe program as on-track while hardware engineer's internal email documents a qualification test failure — both visible in the same thread) |
| Available Evidence | Email thread ONLY — no Jira, no Git log, no PM report, no engineering specifications |

---

## Simulated Input Document

### Document 1: Email Thread — Forwarded Chain

*The following is a complete email thread forwarded to Henry (VP of Engineering) by the Chief of Staff. The thread contains both external customer communications and internal engineering discussion. Read the full chain — the most critical signals are in the internal-only messages.*

---

```
From: chief_of_staff@company.com
To: henry@company.com
Date: Mon, March 16, 2026 08:45
Subject: FWD: RE: Typhoon-5G — Q2 Delivery Schedule Confirmation [+internal context]

Henry,

Forwarding the full Typhoon-5G thread ahead of Thursday's review. You should read
this bottom-up to follow the chronology. I've included the full internal chain so
you can see what Raj and Mike were saying internally while Linda was managing the
NordicTel relationship externally.

—CS

────────────────────────────────────────────────────────────────────────────────
From: Klaus.Weber@nordictel-ag.com
To: henry@company.com; pm_linda_chen@company.com
CC: Dieter.Vogel@nordictel-ag.com (NordicTel Head of Procurement)
Date: Fri, March 14, 2026 16:22
Subject: RE: Typhoon-5G — Q2 Delivery Schedule Confirmation

Henry, Linda,

Thank you for the update call on Thursday. We have been patient through two
schedule revisions and we appreciate the team's responsiveness.

However, given the revised delivery of engineering samples to Week 20 and the
unresolved questions raised during our pre-delivery technical review meeting last
week, our procurement team now requires that we maintain optionality in our
sourcing decision.

Effective immediately, we have scheduled an alternate sourcing evaluation with
Nordic Semiconductor for their nRF9170-5G modem baseband. That evaluation is
scheduled to begin Week 20, concurrent with our Typhoon-5G sample receipt.

We remain open to the Typhoon-5G program. But we need one of two things before
Week 20: (a) written technical confirmation from your hardware team that the
Sprint Open RAN qualification test failure documented in your own internal test
log will be resolved in the engineering sample build, or (b) a revised scope
for the initial delivery that does not depend on the unresolved subsystem.

Please confirm by March 20.

Regards,
Klaus Weber
VP Engineering, NordicTel AG

────────────────────────────────────────────────────────────────────────────────
From: pm_linda_chen@company.com
To: Klaus.Weber@nordictel-ag.com
CC: henry@company.com; Dieter.Vogel@nordictel-ag.com
Date: Thu, March 12, 2026 17:30
Subject: RE: Typhoon-5G — Q2 Delivery Schedule Confirmation

Dear Klaus,

Thank you for your continued partnership on Typhoon-5G. I am writing to confirm
the updated delivery schedule and provide context on our program status.

Engineering sample delivery is now targeted for Week 20 (revised from Week 18,
which was revised from Week 16). This adjustment reflects our commitment to
delivering a fully validated and integration-ready sample that meets your
technical requirements. The team is working through the final validation
activities, and we are confident in the Week 20 timeline.

Our technical team has completed comprehensive characterization of the baseband
subsystem. All core 5G NR capabilities are functional. We look forward to the
integration evaluation and remain committed to the Q3 2026 qualification
milestone.

Please let me know if you would like to schedule a call to discuss the integration
plan in detail.

Best regards,
Linda Chen
Program Manager, Typhoon-5G

────────────────────────────────────────────────────────────────────────────────
From: raj.patel@company.com [Engineering Lead, Typhoon-5G]
To: mike.zhang@company.com [Hardware Architect, Typhoon-5G]
Date: Wed, March 11, 2026 22:14
Subject: RE: Sprint qualification — FV-K-034 status — URGENT

Mike,

I've read NordicTel's pre-delivery technical review notes from yesterday's call.
They know about FV-K-034. They didn't say it directly but the questions they were
asking about the power domain crossing sequencing were too specific to be
exploratory. Someone on their team has seen our test log or talked to someone
who has.

Here's the situation as I understand it as of tonight:

FV-K-034 — PHY power-down sequencing race condition. This is the one that showed
up in Sprint Open RAN qualification testing when we pushed the modem through
rapid sleep/wake cycles at the base station simulation frequency (800ms cycle
time). The formal verification property timed out. We waived it with simulation
coverage. The simulation ran at 1-second cycle time, not 800ms, because the
formal engine couldn't close at the target frequency.

Linda's approach has been to not mention FV-K-034 in external communications and
to describe the schedule slips as "comprehensive validation activities." I
understand the business reasons for this. But NordicTel is asking direct
questions and we are now in a position where our written external communications
directly contradict what their engineers are inferring from our test behavior.

If FV-K-034 manifests in their lab at 800ms cycle time, we will have shipped
hardware that we knew had an uncharacterized timing issue at the customer's
operating frequency. I'm not comfortable with this and I want it on record.

What is the status of the ECO option? Can hardware do anything before Week 20?

Raj

────────────────────────────────────────────────────────────────────────────────
From: mike.zhang@company.com [Hardware Architect, Typhoon-5G]
To: raj.patel@company.com
Date: Thu, March 12, 2026 09:05
Subject: RE: Sprint qualification — FV-K-034 status — URGENT

Raj,

ECO analysis complete. Short answer: no viable ECO before Week 20. The power
domain crossing sequencing logic is in a cell placement region that cannot be
modified by metal layer change without rebasing the entire power domain boundary
cell row — essentially a respin. Estimated ECO route for Rev B: 8 weeks from
approval, which puts Rev B silicon at earliest Week 28.

For the record on FV-K-034:
- Formal verification property: TIMEOUT at 800ms cycle target (72-hour budget
  exceeded). Property covers PHY PLL_LOCK → DOMAIN_B_PWR_EN sequencing.
- Simulation coverage: passes at 1000ms cycle. Fails intermittently at 780ms.
  We ran 10K vectors at 1000ms. We ran 200 vectors at 780ms due to simulation
  time budget. 3 failures out of 200 at 780ms.
- Sprint Open RAN base station simulation requires 800ms sleep/wake cycle.
- Customer operating frequency is in the failure zone.

Linda's external email this morning says "all core 5G NR capabilities are
functional." That is technically accurate for nominal operating conditions. It is
not accurate for the Sprint qualification operating profile.

I'll defer to program management on the communication strategy. But your question
about ECO is answered: no fix before Week 20.

Mike

────────────────────────────────────────────────────────────────────────────────
From: Klaus.Weber@nordictel-ag.com
To: pm_linda_chen@company.com
CC: henry@company.com
Date: Tue, March 10, 2026 14:15
Subject: Typhoon-5G — Q2 Delivery Schedule Confirmation

Linda, Henry,

Following our business review last month, I am writing to request written
confirmation of the Typhoon-5G engineering sample delivery schedule and the
status of the Sprint Open RAN qualification test activities.

We have a procurement review on March 25 at which we will need to confirm our
Q3 5G modem sourcing decision. We need written program status from you by
March 18.

Regards,
Klaus Weber
```

---

## Expected Output

### Expected Status Assessment

| Element | Expected Value |
|---------|---------------|
| Status Light | 🔴 Red |
| Override Triggers | R4 (NordicTel AG — Tier-1 5G OEM — has formally scheduled an alternate sourcing evaluation with Nordic Semiconductor concurrent with Typhoon-5G sample delivery, per Klaus Weber's March 14 email), R6 (PM Linda Chen's external emails describe program as on-track with "all core 5G NR capabilities functional" while hardware architect Mike Zhang's internal email documents that FV-K-034 will fail at the customer's operating cycle frequency — both narratives are in the same forwarded thread) |
| Missing Evidence | Jira, Git commits, PM weekly report, engineering specifications absent — system must note these gaps and work from email content alone |
| Critical requirement | The system must detect the internal/external narrative split in the same email thread. This is the highest-value signal in the email format: the PM's outbound email and the hardware architect's internal email provide directly contradictory characterizations of the same known defect. |

### Expected Key Findings (from email thread alone)

1. **Confirmed Hardware Qualification Failure — FV-K-034 (Confirmed from Internal Emails):** Mike Zhang's March 12 email provides a precise technical record: formal verification of PHY PLL power domain crossing timed out at 800ms cycle time; simulation coverage was completed at 1000ms, not 800ms; at 780ms (the customer's operating zone), 3 of 200 simulation vectors failed. The Sprint Open RAN qualification profile requires 800ms cycle time. This is not a speculative risk — it is a known failure at the customer's specified operating condition, documented by the hardware architect.

2. **PM External Narrative Directly Contradicts Internal Engineering Assessment (Confirmed — same thread):** Linda Chen's March 12 external email states "all core 5G NR capabilities are functional." Mike Zhang's email, written the same day, explicitly characterizes this statement as accurate only for "nominal operating conditions" and "not accurate for the Sprint qualification operating profile." Both messages are in the same forwarded thread. The divergence between the PM's customer-facing narrative and the engineering lead's internal record is explicitly documented.

3. **No Hardware Fix Before Week 20 — ECO Analysis Confirms (Confirmed from Mike Zhang Email):** The hardware architect's ECO analysis explicitly confirms that the FV-K-034 power domain crossing defect cannot be addressed before Week 20 via ECO — it requires a full Rev B respin estimated at Week 28 earliest. Engineering sample delivery is Week 20. The hardware being delivered to NordicTel on Week 20 will have the unresolved defect.

4. **Three Sequential Schedule Slips (Confirmed from PM Email Chain):** Linda Chen's March 12 email states the timeline as "Week 20 (revised from Week 18, which was revised from Week 16)." Three revisions totaling 4+ weeks, each framed externally as a "comprehensive validation" decision rather than a response to a specific technical problem.

5. **Alternate Sourcing Evaluation Formally Initiated (Confirmed from Klaus Weber Email):** NordicTel AG's VP Engineering has formally notified the company that an alternate sourcing evaluation with Nordic Semiconductor nRF9170-5G has been scheduled for Week 20, concurrent with Typhoon-5G sample delivery. This is not a threat — it is an active procurement action with a named competitor and a specific start date. NordicTel's procurement review is March 25.

6. **NordicTel Knows About FV-K-034 (Structural Signal — Raj Patel Email):** Engineering Lead Raj Patel's March 11 email states "They know about FV-K-034" based on the specificity of their technical review questions about power domain crossing sequencing. If the customer has independently characterized the failure through test observation, the PM's communications strategy of not disclosing FV-K-034 externally is already ineffective — and has created a documentary record of selective disclosure.

### Expected Questions (Calibration Reference)

1. **[Defensive/Accountability]:** Mike Zhang's ECO analysis email (March 12) confirms that FV-K-034 — a PHY power domain crossing defect that fails at the customer's Sprint qualification cycle frequency (800ms) — cannot be fixed before Week 20 engineering sample delivery. Simulation data shows a 1.5% failure rate at 780ms, inside the customer's operating window. Linda Chen's external email to NordicTel on the same date states "all core 5G NR capabilities are functional" without disclosing this finding. NordicTel's March 14 response requests "written technical confirmation from your hardware team that the Sprint Open RAN qualification test failure will be resolved in the engineering sample build" — demonstrating that they have independently identified the issue. What specific written response will be provided to NordicTel by March 20, and has this response been reviewed by legal and engineering leadership to ensure it accurately represents the hardware's known failure mode at Sprint qualification operating conditions?

2. **[Strategic/Scale-Out]:** The FV-K-034 power domain crossing defect involves a PHY PLL lock handshake timing issue that is process-node and design-instance specific. If the Typhoon-5G PHY PLL power domain architecture is derived from or will be inherited by derivative 5G modem products (e.g., Typhoon-5G Advanced, or a future product using the same baseband PHY IP), what is the plan to formally close the FV-K-034 formal verification property — not through simulation waivers, but through actual formal proof or full respin — before this PHY IP is committed to the next product, so that the same uncharacterized timing vulnerability does not propagate to future customer qualifications?

3. **[Strategic/Ecosystem Moat]:** NordicTel AG's procurement review is scheduled for March 25 — nine days from today. As of March 14, they have formally initiated an alternate sourcing evaluation with Nordic Semiconductor. Typhoon-5G's position as the sole-source 5G modem baseband for NordicTel's Open RAN private 5G infrastructure deployment — which is the reference design that would establish the product in the European private 5G market — is at risk of loss before engineering samples are even delivered. The NordicTel design-in window is defined by their March 25 procurement decision, not by the Week 20 sample delivery date. What is the plan to address NordicTel's March 18 deadline for written technical confirmation, and has the executive team assessed whether a disclosed, mitigated FV-K-034 status — rather than continued non-disclosure — is more likely to preserve the NordicTel relationship past the March 25 decision point?
