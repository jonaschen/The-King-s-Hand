# Value Chain Map — [Domain Name]

<!-- TEMPLATE INSTRUCTIONS
     Replace all [bracketed] placeholders with domain-specific content.
     Add or remove layers as appropriate for your domain. Most domains have
     3-6 meaningful layers. Layers should be ordered from deepest/most
     foundational to most customer-visible.

     The purpose of this map is to let the analysis engine understand WHERE
     in your domain's value chain a problem sits, so it can trace downstream
     consequences. Each layer should answer: "If this layer fails, what
     breaks above it?"

     Delete this comment block when the template is filled in.
-->

## Overview

[Brief description of this domain's value chain structure. Explain how value
flows from foundational infrastructure through to customer delivery. Identify
the key transformation that happens at each stage — raw materials become
components become products become services, etc.]

## Layer Summary

| Layer | Scope | Business Value |
|:------|:------|:---------------|
| [Layer 1 — Foundation/Infrastructure] | [What this layer provides to everything above it] | [Why it matters commercially] |
| [Layer 2 — Core Operations] | [Primary transformation or processing that occurs here] | [Revenue or cost impact] |
| [Layer 3 — Integration/Middleware] | [How components connect and interoperate] | [What breaks if integration fails] |
| [Layer 4 — Application/Delivery] | [How the product/service reaches usable form] | [Customer-visible quality impact] |
| [Layer 5 — Customer-Facing/Market] | [Final delivery, support, and market interface] | [Direct revenue and reputation impact] |

<!-- Add or remove rows. Not every domain has exactly five layers.
     A pharmaceutical company might have: Discovery -> Preclinical -> Clinical
     -> Manufacturing -> Distribution. A construction firm might have:
     Design -> Permitting -> Foundation -> Structure -> Finishing. -->

## Detailed Layer Descriptions

### Layer 1 — [Name]

**Technical Scope:** [What this layer controls — the resources, processes, or
infrastructure that everything else depends on]

**Key Components:** [Major elements within this layer — list the 3-7 most
important sub-systems, teams, or assets]

**Common Failure Modes:**

| Failure | Consequence | Severity |
|:--------|:-----------|:---------|
| [Failure description] | [What breaks downstream when this fails] | Critical / High / Medium |
| [Failure description] | [What breaks downstream when this fails] | Critical / High / Medium |

<!-- Include at least 2-3 failure modes per layer. Focus on failures that
     are commonly hidden or downplayed in status reports. -->

**Detection Language:** [How problems at this layer typically appear in
project documents, status reports, and meeting notes. Include specific
phrases, euphemisms, or indirect references that signal trouble here.]

**Business Value:** [Why this layer matters commercially. Quantify where
possible — cost of failure, revenue at risk, customer impact timeline.]

---

### Layer 2 — [Name]

**Technical Scope:** [What this layer controls]

**Key Components:** [Major elements]

**Common Failure Modes:**

| Failure | Consequence | Severity |
|:--------|:-----------|:---------|
| [Failure description] | [What breaks downstream] | Critical / High / Medium |
| [Failure description] | [What breaks downstream] | Critical / High / Medium |

**Detection Language:** [How problems appear in documents]

**Business Value:** [Why this layer matters commercially]

---

### Layer 3 — [Name]

**Technical Scope:** [What this layer controls]

**Key Components:** [Major elements]

**Common Failure Modes:**

| Failure | Consequence | Severity |
|:--------|:-----------|:---------|
| [Failure description] | [What breaks downstream] | Critical / High / Medium |
| [Failure description] | [What breaks downstream] | Critical / High / Medium |

**Detection Language:** [How problems appear in documents]

**Business Value:** [Why this layer matters commercially]

---

### Layer 4 — [Name]

**Technical Scope:** [What this layer controls]

**Key Components:** [Major elements]

**Common Failure Modes:**

| Failure | Consequence | Severity |
|:--------|:-----------|:---------|
| [Failure description] | [What breaks downstream] | Critical / High / Medium |
| [Failure description] | [What breaks downstream] | Critical / High / Medium |

**Detection Language:** [How problems appear in documents]

**Business Value:** [Why this layer matters commercially]

---

### Layer 5 — [Name]

**Technical Scope:** [What this layer controls]

**Key Components:** [Major elements]

**Common Failure Modes:**

| Failure | Consequence | Severity |
|:--------|:-----------|:---------|
| [Failure description] | [What breaks downstream] | Critical / High / Medium |
| [Failure description] | [What breaks downstream] | Critical / High / Medium |

**Detection Language:** [How problems appear in documents]

**Business Value:** [Why this layer matters commercially]

---

## Cross-Layer Dependencies

<!-- Document the most critical dependencies between layers. These are the
     paths through which problems propagate. For each dependency, explain
     what happens when the lower layer fails and the upper layer must cope. -->

| From Layer | To Layer | Dependency Nature | Failure Propagation |
|:-----------|:---------|:-----------------|:-------------------|
| [Layer N] | [Layer M] | [What Layer M needs from Layer N] | [What happens when it does not get it] |
| [Layer N] | [Layer M] | [What Layer M needs from Layer N] | [What happens when it does not get it] |

## Domain-Specific Terminology

<!-- List 10-20 key technical terms that appear in project documents for this
     domain. The analysis engine needs these to correctly parse input data. -->

| Term | Meaning | Layer |
|:-----|:--------|:------|
| [term] | [plain-language definition] | [which layer this belongs to] |
