# The King's Hand (國王之手)

[English Version](#english) | [中文版本](#中文)

---

<a name="english"></a>
## English Version

### Project Concept: Your Persistent Working Partner

**The King's Hand** is an AI Agent Skill Set that acts as a persistent working partner — a senior chief of staff who is there every day, understands your world, tracks your reality, and deploys adversarial analysis when you need to cut through the fog. Originally built for IC design executives, it now works across any domain — semiconductor, software startup, medical device, construction, finance, and beyond.

It is not a document-in, report-out machine. It's a colleague who listens when you say "boss gave me a new project," remembers it, tracks progress, and at the end of the week helps you write your weekly report. When you need the blade — to analyze a status report, to detect hidden risks, to arm yourself with unanswerable questions — it's ready.

#### The "Watermelon Effect"
In complex matrix organizations, project reports are often "Green" on the outside (on track) but "Red" on the inside (in crisis). This is the **Watermelon Effect**. It is not unique to semiconductors — it is the fate of every organization with layered reporting structures. The King's Hand exists to pierce through this corporate fog.

It analyzes raw data — Jira logs, Git commits, meeting notes, status reports, email threads — to surface the truth that doesn't make it into the official slides.

#### Key Capabilities
- **Persistent Presence:** Tracks your tasks, projects, commitments, and deadlines through natural daily conversation. Maintains a Living Work State that knows what's on your plate.
- **Proactive Intelligence:** Detects stagnant tasks, approaching deadlines, and tone drift in your descriptions. Offers to help write your weekly report on Fridays.
- **Adversarial Analysis (The Blade):** On demand, runs The King's Hand's full five-module adversarial analysis — contradiction detection, euphemism translation, cost quantification, and three unanswerable soul questions.
- **Domain Self-Adaptation:** Automatically infers your domain, constructs an analytical framework, and calibrates confidence based on knowledge depth (L1 thin → L3 deep). Pre-built Domain Packs for IC design, software startups, and medical devices.
- **Four Operating Modes:** Calibration (first meeting), Daily Conversation (ongoing updates), Quick Scan (specific question about a document), Full Analysis (complete adversarial report).
- **Continuous Learning:** Gets smarter with every interaction — learns your preferences, vocabulary, and priorities. Never acts on a single data point; accumulates evidence before adjusting.

#### Current State
- **IC Design domain:** Fully operational with 16 verified test cases, complete domain knowledge pack, and battle-tested question patterns.
- **Software Startup domain:** Complete Domain Pack (value chain, 10 patch patterns, override triggers, 25 euphemisms).
- **Medical Device domain:** Complete Domain Pack (regulatory value chain, 10 patch patterns, override triggers, 25 euphemisms).
- **Other domains:** Zero-config analysis via automatic domain inference and dynamic framework construction. Quality improves with each interaction.

---

## Usage Guide for the Executive Team

This section is written for the executive team and the executive assistant preparing documents for The King's Hand. No technical background is required to operate the system.

---

### Recommended Cadence

Run The King's Hand **once per week, the day before the cross-functional project review meeting.**

The optimal submission window is 24–36 hours before the meeting. This gives you time to read the report, select which of the three questions to ask, and decide whether any findings require a pre-meeting conversation with a specific team lead.

Do not run it the morning of the meeting — you will not have time to act on what it finds.

---

### What to Submit

For each project under review, collect as many of the following documents as available. The system is designed to work with partial evidence — you do not need all of them. More evidence produces a more confident analysis.

| Document Type | What to Submit | Why It Matters |
|---|---|---|
| **Weekly PM status report** | The project manager's weekly update, any format | Establishes the official narrative the system will interrogate |
| **Jira export** | Raw CSV export directly from Jira, no preprocessing | Bug labels, priorities, and comment histories contain the engineering truth |
| **Git commit log** | Paste of `git log --oneline -50` output, or a recent commit summary | Commit messages reveal when workarounds were introduced |
| **Cross-functional meeting notes** | Minutes or action items from the most recent engineering sync | Where disagreements between teams appear in plain language |
| **Customer communications** | Forwarded emails or FAE escalation summaries | Tier-1 customer escalations are the strongest Red signal |
| **Internal engineering reports** | Verification closure reports, characterization summaries, DV sign-off docs | Technical documents that PMs rarely include in upward reports |
| **PowerPoint presentation** | Use the automated tools below — no manual export required | Program reviews often contain technical data slides that contradict the executive summary |
| **PDF / Word / Excel** | Use the automated tools below | Many organizations distribute reports in PDF; Excel may contain Jira-like data exports |

**Minimum viable submission:** A weekly PM report alone is sufficient to produce a useful output. The system will flag what is missing and adjust its confidence levels accordingly.

---

### Automated Document Processing Tools

The `tools/` directory contains scripts that convert PowerPoint and other formats directly to a King's Hand report — no manual copy-paste required.

#### One-command end-to-end analysis (recommended)

```bash
# Analyze a PowerPoint deck — produces a full 5-module report
./tools/analyze_pptx.sh quarterly_review.pptx

# Save the report to a file
./tools/analyze_pptx.sh quarterly_review.pptx --output report_week11.md

# Analyze PDF, Word, or Excel (install markitdown first)
pip install markitdown
./tools/markitdown_analyze.sh project_review.pdf
./tools/markitdown_analyze.sh status_report.docx
```

These scripts extract text from the file. Paste the output into your King's Hand agent session for analysis.

#### Extract text only (for pasting into Claude or another interface)

```bash
# Install python-pptx first (better extraction quality than LibreOffice)
pip install python-pptx

# Extract to stdout
python3 tools/pptx_to_text.py quarterly_review.pptx

# Extract to file
python3 tools/pptx_to_text.py quarterly_review.pptx --output extracted.txt

# Include speaker notes
python3 tools/pptx_to_text.py quarterly_review.pptx --notes
```

#### Tool selection guide

| Tool | When to use | Dependencies |
|---|---|---|
| `analyze_pptx.sh` | .pptx → full report, one command | `soffice` (already installed); optionally `pip install python-pptx` for better extraction |
| `markitdown_analyze.sh` | PDF, Word, Excel, or mixed formats → full report | `pip install markitdown` |
| `pptx_to_text.py` | Extract .pptx text for pasting manually | `pip install python-pptx` |

The `analyze_pptx.sh` script works immediately with no installation (uses LibreOffice which is already present). Installing `python-pptx` improves slide structure and table formatting.

---

### How to Prepare Each Document Type

#### PM Status Reports and Meeting Notes
Copy and paste the text directly. Any format is acceptable — plain text, Markdown, copied from email, copied from a shared document. Preserve the original structure.

#### Jira CSV Export
In Jira: go to the project board → select **Issues** → use the **Export** function → choose **Export Excel CSV (all fields)** or **Export CSV (current fields)** depending on your Jira version. Do not open or edit the CSV. Paste its raw contents into the submission. The system reads the raw CSV format directly.

#### PowerPoint Slide Deck
Use `./tools/analyze_pptx.sh` for automated processing (see above). If manual extraction is needed: open the presentation in PowerPoint, go to **File → Save As → Plain Text (.txt)**, and paste the text file contents. Preserve slide titles and the order of slides.

#### Email Threads
Forward the email thread to a text file, or copy the full email chain including **From**, **To**, **Date**, and **Subject** headers. Preserve the thread chronology. If an email has been forwarded internally with additional commentary, include all layers — the internal comments are often the most valuable input.

---

### How to Submit

Open a new conversation with The King's Hand agent. Paste the documents one after another with a brief label identifying what each document is:

```
--- DOCUMENT 1: Weekly PM Report (Project Ares, Week 11) ---
[paste document here]

--- DOCUMENT 2: Jira CSV Export (Project Ares, exported 2026-03-15) ---
[paste CSV here]

--- DOCUMENT 3: Email thread (Customer escalation, NordicTel, forwarded 2026-03-14) ---
[paste email here]
```

No further instruction is needed. The system knows what to do.

---

### Understanding the Output

The system produces a five-module report in Traditional Chinese (繁體中文). Here is what each module contains:

| Module | Chinese Title | What It Tells You |
|---|---|---|
| **Module 1** | 專案光譜定位與賦能價值 | Why this project matters commercially — connects the technical work to a specific market outcome |
| **Module 2** | 專案穿透性摘要與紅綠燈 | The status light (🟢/🟡/🔴) and a single-sentence verdict. If this overrides the PM's official status, the reason is stated explicitly. |
| **Module 3** | 跨層級協作摩擦力與風險 | The full adversarial analysis — every workaround found, its cost, which team is responsible, and what is being concealed. Ends with a friction table. |
| **Module 4** | 客戶/市場連動效應 | The commercial consequence if the project fails — which customer commitment is at risk, which competitor benefits. |
| **Module 5** | 國王的靈魂三問 | Three questions to ask in the review meeting. Each one is designed to be unanswerable with a reassuring generality — forcing the team to confront a specific problem. |

#### How to Use Module 5 in the Review Meeting

You do not need to ask all three questions. The three question types are:
- **[Defensive/Accountability]:** For when you suspect a team is concealing a crisis
- **[Strategic/Scale-Out]:** For when you want to know if a problem will infect the next product
- **[Strategic/Ecosystem Moat]:** For when a customer relationship or market position is at risk

Choose the one most relevant to what you are seeing, and read it as written. Do not soften or rephrase it — the specificity is the point.

---

### What the System Will Tell You When Evidence Is Incomplete

If critical documents (especially Jira or commit logs) are absent, the system will open Module 3 with an **Evidence Inventory** section that states:
- Which document types are missing
- What each missing source would have revealed
- Whether each finding in the analysis is **Confirmed** (supported by available evidence), **Suspected** (consistent with available evidence but unverified), or **Undetectable without [X]** (requires a specific missing source to verify)

This is by design. A suspected finding with an evidence gap is more valuable than a confident finding with no acknowledgment of uncertainty. The evidence inventory tells you exactly what to ask the team to provide at the next review.

---

### What the System Will Not Do

- It will **not** invent specific bugs, measurements, or data points not present in the submitted documents. If it cannot find evidence, it will say so.
- It will **not** reassure you. If the evidence is damning, the output will be damning.
- It will **not** softened its language to protect someone's feelings. Module 3 names teams and decisions.
- It will **not** assign Red status without evidence. A clean project with clean evidence will receive a 🟢 Green.

---

<a name="中文"></a>
## 中文版本

### 專案概念：持續在場的工作夥伴

**「國王之手 (The King's Hand)」** 是一套 AI 幕僚系統——一位持續在場的資深幕僚長，每天都在你身邊、理解你的世界、追蹤你的現實，在你需要刺穿迷霧時拿出敵對性分析這把利刃。最初為 IC 設計高階主管打造，現已適用於半導體、軟體新創、醫療器材、營建工程、金融等任何領域。

它不是一台文件進、報告出的分析機器。它是一位同事——你跟他說「老闆給了新專案」，他記住；你說「build study 卡住了」，他更新狀態；週五到了，他幫你整理週報。當你需要那把刀時——分析一份狀態報告、偵測隱藏的風險、帶著無法迴避的問題走進會議室——它隨時準備好了。

#### 「西瓜效應」的終結者
在複雜的矩陣組織中，專案報告往往呈現「外綠內紅」的**西瓜效應**：表面上進度超前，實則危機四伏。西瓜效應不是半導體業的專利——它是所有存在層級彙報結構的組織的宿命。「國王之手」的使命是刺破這層資訊迷霧。

它直接分析原始資料（Jira 日誌、Git 提交紀錄、會議記錄、狀態報告、郵件往來），挖掘出那些永遠不會出現在官方簡報中的真實情況。

#### 核心能力
- **持續在場：** 透過日常自然對話追蹤你的任務、專案、承諾與截止日期。維護一份「活的工作狀態」，隨時知道你手上有什麼。
- **主動式智慧：** 偵測停滯的任務、即將到期的承諾、描述語氣的漂移。週五主動提議幫你整理週報。
- **敵對性分析（那把刀）：** 按需執行完整五模組敵對性分析——矛盾偵測、術語翻譯、成本量化、三個無法迴避的靈魂提問。
- **領域自適應：** 自動推斷領域、建構分析框架，根據知識厚度（L1 淺薄 → L3 深厚）校準信心。內建 IC 設計、軟體新創、醫療器材三套完整領域知識包。
- **四種運作模式：** 校準對話（初識）、日常對話（持續更新）、快速掃描（針對特定文件的問題）、完整分析（敵對性報告）。
- **持續進化：** 每次互動都讓系統更懂你——學習你的偏好、術語、優先順序。不會根據單一數據點調整，累積證據後才行動。

#### 目前狀態
- **IC 設計領域：** 已全面運作，具備 16 個驗證測試案例、完整領域知識包、經實戰校準的提問模板。
- **軟體新創領域：** 完整領域知識包（價值鏈、10 種補丁模式、覆寫觸發規則、25 條術語翻譯）。
- **醫療器材領域：** 完整領域知識包（法規價值鏈、10 種補丁模式、覆寫觸發規則、25 條術語翻譯）。
- **其他領域：** 透過自動領域推斷與動態框架建構提供零配置分析。品質隨每次互動持續提升。

---

## 使用指南（給主管團隊）

本節專為執行團隊及負責準備文件的執行助理撰寫，無需任何技術背景即可操作本系統。

---

### 建議使用頻率

建議於**每週跨職能專案審查會議的前一天**執行「國王之手」。

最佳提交時間為會議前 24–36 小時。這樣您將有充分時間閱讀報告、選取最適合在會議中提出的問題，並決定是否需要在會前與特定團隊負責人進行預先溝通。

請勿在會議當天早晨才提交——您將沒有足夠時間根據分析結果採取行動。

---

### 提交文件類型

針對每個待審查專案，請盡可能蒐集以下文件。本系統設計為可處理不完整的證據——您無需備齊所有文件。文件愈完整，分析結果的可信度愈高。

| 文件類型 | 提交內容 | 重要性說明 |
|---|---|---|
| **專案週報（PM 狀態報告）** | 專案經理的週度更新，任何格式均可 | 建立系統將進行深度審查的官方敘述基線 |
| **Jira 匯出檔** | 直接從 Jira 匯出的原始 CSV，無需預處理 | Bug 標籤、優先級及評論歷史中隱藏著工程實況 |
| **Git 提交記錄** | `git log --oneline -50` 輸出內容，或近期提交摘要 | 提交訊息揭示了臨時修補方案（Workaround）的引入時間點 |
| **跨職能會議記錄** | 最近一次工程同步會議的記錄或行動項目 | 團隊間的分歧往往以直白的語言呈現於此 |
| **客戶往來郵件** | 轉發的郵件或 FAE 升級摘要 | 一級客戶的升級（Escalation）是最強烈的紅燈信號 |
| **內部工程報告** | 驗證完成報告、矽片特性量測摘要、DV 簽核文件 | 此類技術文件通常不會出現在 PM 向上匯報的摘要中 |
| **PowerPoint 簡報** | 匯出為純文字的投影片內容（詳見下方說明） | 程序審查會的技術數據投影片，往往與執行摘要的結論相互矛盾 |

**最低可行提交：** 僅憑一份每週 PM 報告，系統即可產出有用的分析結果。系統將明確標示缺少哪些資料，並據此調整各項發現的信心等級。

---

### 提交方式

開啟與「國王之手」代理的新對話，依序貼上各份文件，並以簡短標籤標明每份文件的性質：

```
--- 文件 1：每週 PM 報告（Ares 專案，第 11 週）---
[貼上文件內容]

--- 文件 2：Jira CSV 匯出（Ares 專案，匯出日期：2026-03-15）---
[貼上 CSV 內容]

--- 文件 3：郵件往來記錄（客戶升級，NordicTel，轉發日期：2026-03-14）---
[貼上郵件內容]
```

無需提供任何額外指示，系統將自動進行完整分析。

---

## Technical Core / 技術核心

- **System Prompt:** `skills/universal-kings-hand/SKILL.md` (719 lines) — unified prompt with four operating modes, Living Work State, and full analytical engine.
- **Operating Modes:** Calibration → Daily Conversation → Quick Scan → Full Analysis (四種運作模式：校準 → 日常 → 快速掃描 → 完整分析).
- **Analysis Engine:** Steps 0 → 0.5 → 1 → 2 → 3 → 4 → 5 → 6 — domain inference, knowledge depth assessment, deconstruction, value chain positioning, contradiction detection, impact extrapolation, soul questions, Living Work State writeback.
- **Domain Framework:** Six-element universal framework — Hard Constraint, Patch Pattern, Irreversible Milestone, Trade-off Axes, Tier-1 Relationship, Blame Transfer Seam.
- **Domain Packs:** IC Design (16 test cases) / Software Startup / Medical Device (三套完整領域知識包).
- **Calibration Engine:** `CALIBRATE.md` (487 lines) — incremental profile updates, confidence decay, cross-domain migration, Domain Pack candidate generation.
- **Proactive Intelligence:** Stagnation detection, deadline alerts, tone drift detection, weekly report auto-generation, trend tracking.
- **Goal:** Be your persistent working partner. Transform hidden risks into accountability — in any domain.
