# Euphemism Dictionary — [Domain Name]

<!-- TEMPLATE INSTRUCTIONS
     Replace all [bracketed] placeholders with domain-specific content.
     Aim for 15-30 euphemisms in the translation table. These should be
     actual phrases that appear in real project reports, status updates,
     emails, and meeting notes within your domain.

     The purpose of this dictionary is to decode organizational language
     that packages bad news as neutral or positive updates. Every domain
     develops its own dialect of avoidance — this file catalogs it.

     Sources for euphemisms: read real status reports from troubled projects,
     listen to how managers describe problems in reviews, note the language
     used in post-mortems to describe what went wrong "before we knew."

     Delete this comment block when the template is filled in.
-->

## Core Principle

Organizations under pressure develop predictable language patterns to
package bad news as neutral or positive updates. These patterns are not
random — they follow consistent rules tied to the severity of the underlying
problem and the organizational incentives to hide it. The more severe the
problem, the more polished the language becomes.

## Translation Table

| # | Official Report Language | Ground Truth | Status Impact |
|:--|:------------------------|:-------------|:-------------|
| 1 | [Euphemism — exact phrase as it appears in reports] | [What it actually means in plain language] | [Green-to-Yellow / Green-to-Red / Yellow-to-Red] |
| 2 | [Euphemism] | [Ground truth] | [Status impact] |
| 3 | [Euphemism] | [Ground truth] | [Status impact] |
| 4 | [Euphemism] | [Ground truth] | [Status impact] |
| 5 | [Euphemism] | [Ground truth] | [Status impact] |
| 6 | [Euphemism] | [Ground truth] | [Status impact] |
| 7 | [Euphemism] | [Ground truth] | [Status impact] |
| 8 | [Euphemism] | [Ground truth] | [Status impact] |
| 9 | [Euphemism] | [Ground truth] | [Status impact] |
| 10 | [Euphemism] | [Ground truth] | [Status impact] |
| 11 | [Euphemism] | [Ground truth] | [Status impact] |
| 12 | [Euphemism] | [Ground truth] | [Status impact] |
| 13 | [Euphemism] | [Ground truth] | [Status impact] |
| 14 | [Euphemism] | [Ground truth] | [Status impact] |
| 15 | [Euphemism] | [Ground truth] | [Status impact] |

<!-- Add more rows as needed. Aim for 15-30 entries. Group related
     euphemisms together — e.g., all schedule-related euphemisms in a
     block, all quality-related in another. -->

## Pattern Recognition Guidelines

### Softening Language Indicators

<!-- These are general patterns (not exact phrases) that signal bad news
     is being softened. Each pattern describes a linguistic structure. -->

- [Pattern — e.g., "Use of 'minor' or 'slight' before any negative noun"]:
  signals [what it means — e.g., "the problem is neither minor nor slight"]
- [Pattern — e.g., "Passive voice to describe missed deadlines"]:
  signals [meaning — e.g., "accountability is being diffused"]
- [Pattern — e.g., "Future tense for actions that should be past tense"]:
  signals [meaning — e.g., "the action has not been taken yet"]
- [Pattern]:
  signals [meaning]
- [Pattern]:
  signals [meaning]

### Escalation Language (Inverted Signals)

<!-- Sometimes language that sounds urgent is actually a GOOD sign — it
     means the organization is acknowledging problems. Conversely, sudden
     calm after a period of acknowledged problems can signal that issues
     are being buried rather than resolved. -->

- [Pattern — e.g., "Explicit acknowledgment of risk with named owner"]:
  signals [meaning — e.g., "healthy risk management — actually positive"]
- [Pattern — e.g., "Sudden disappearance of a previously tracked risk item"]:
  signals [meaning — e.g., "risk was not resolved, it was removed from the tracker"]
- [Pattern]:
  signals [meaning]
- [Pattern]:
  signals [meaning]

### Compound Signals

<!-- Some phrases are ambiguous in isolation but become diagnostic when
     they appear together. Document the most important combinations. -->

- [Phrase A] + [Phrase B] together signal [meaning — e.g., "schedule has
  slipped and the team is working around a fundamental design flaw"]
- [Phrase A] + [Phrase B] together signal [meaning]
- [Phrase A] + [Phrase B] together signal [meaning]

## Domain-Specific Language Categories

<!-- Organize euphemisms by the type of problem they conceal. This helps
     the analysis engine map detected euphemisms to the correct risk
     category. -->

### Schedule and Timeline

[List the 3-5 most common euphemisms used to disguise schedule problems
in this domain. For each, note the typical severity.]

### Quality and Defects

[List the 3-5 most common euphemisms used to disguise quality problems.]

### Resource and Staffing

[List the 3-5 most common euphemisms used to disguise resource shortages
or team problems.]

### Budget and Cost

[List the 3-5 most common euphemisms used to disguise cost overruns.]

### Stakeholder and Customer

[List the 3-5 most common euphemisms used to disguise customer
dissatisfaction or stakeholder conflict.]

## Usage in Analysis

1. Scan input documents for exact phrase matches against the translation
   table.
2. Scan for semantic equivalents — phrases that convey the same meaning
   using different words.
3. Check for softening language indicators and escalation language
   patterns.
4. Evaluate compound signals — check whether flagged phrases co-occur.
5. Flag all matches with the ground truth translation and status impact.
6. Apply status impacts to the override assessment in the status override
   triggers evaluation.
7. In the analysis output, cite the original language from the document
   alongside its translation so the reader can verify the interpretation.
