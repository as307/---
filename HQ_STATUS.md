# Oman AI — HQ Status

Generated: 2026-08-15. This is the single source of truth for "what do we have, what's live, what's next."

## 1. Live Systems (fast links)

| System | URL | What it is | Status |
|---|---|---|---|
| **Memory Hub** (TencentDB Agent Memory) | http://localhost:8125/ | Panel UI — team memory hub: chat memory, skills, wiki, code graph. Chosen memory-layer backend for the HQ stack. | ✅ Running (Panel, Knowledge API :8424, Memory Core :8420, Proxy :8096) |
| **Nexus Executive OS** | http://localhost:8501/ | Chainlit-based executive assistant app (`~/nexus_executive/deployment_package`), Obsidian vault integration. Runs as systemd service `nexus-executive.service`. | ✅ Running (systemd, auto-start enabled) |

Start/stop Memory Hub: `cd ~/tencentdb-agent-memory/deploy/global-images && ./start-all.sh` / `./stop-all.sh`
One-command runner (from HQ repo): `~/OmO/hq/run_tencent_memory.sh --approve-external-run`

## 2. The HQ Blueprint (`as307/---` → `~/OmO/hq`)

Not code — an architecture/governance reference (`README.md`, `combo-tool-stack.yaml`, `INTEGRATION_CHECKLIST.md`). Defines the target stack:

- **Core orchestrator:** Dify — *not installed yet*
- **Research engine:** gpt-researcher — *not installed yet*
- **Browser action layer:** agent-browser — *not installed yet*
- **Memory layer:** khoj (default) or **TencentDB Agent Memory** (chosen — already running, see §1)
- **Execution runtime (optional):** nanobot — *not installed yet*
- **10 upgrade skills** (router, human-approval-gate, QA scoring, monitoring, retry-fallback, Arabic-first NLP, OCR ingestion, knowledge-sync, scheduling, security-compliance) — none built yet, all defined only as I/O schemas in `combo-tool-stack.yaml`.

**Real progress vs. blueprint: Phase 1 memory-layer item is the only checklist box actually earned so far** (memory backend selected + running). Dify/orchestrator, research, browser-action, and all 10 skills are still open.

## 3. Agent / Subagent Inventory (what actually exists on disk)

### 3a. The core roster — `agency-agents`
316 named specialist subagent personas (Markdown, frontmatter-based) across 17 divisions: engineering (58), marketing (36), specialized (57), sales (9), finance, security, academic, healthcare, gis, game-development, product, project-management, paid-media, spatial-computing, support, testing, design.
Upstream: `github.com/msitarzewski/agency-agents`, forked to **`github.com/aj-omanai/agency-agents`**.
This roster is also what's installed as this Claude Code session's live subagents (`~/.claude/agents/*.md`, 216 of the 316).

**⚠️ This roster is duplicated in 4 places on disk** — same content, different freshness:
| Copy | Last updated | Notes |
|---|---|---|
| `~/agency-agents` | 2026-08-13 | Newest, has `fork` remote → `aj-omanai/agency-agents` |
| `~/.agency-agents` | 2026-08-06 | Stale |
| `~/ai_company/agency-agents` | 2026-08-06 | Identical to above, stale |
| `~/.claude/agents/*.md` | 2026-08-12 | Subset (216/316), what this session actually runs |

**Recommendation:** keep `~/agency-agents` (your fork) as the single source of truth; delete `~/.agency-agents` and `~/ai_company/agency-agents`; re-sync `~/.claude/agents/` from the fork when you update it.

### 3b. Orchestration layer — `aaa-agency`
"AI Agency Automation" — command-center wrapper around the `agency-agents` roster. `aaa` launcher script (`plan`, `money`, `org`, `test`, `deploy`), `configs/agents.json` mapping divisions → key agent files, workflow playbooks (lead-gen, content-pipeline, client-onboarding), a "NEXUS" orchestrator mode pointed at `agents-orchestrator.md`, and a basic finance tracker. Actively developed (Aug 13).

### 3c. `ai_company` — bundle of 3 things
- `ai_company_server/` — **"Apex AI Automation"**: Flask+Socket.IO dashboard coordinating an agent swarm (`autopilot.py`). Own repo → `github.com/aj-omanai/apex-ai-automation`, Docker + Render deploy config. Actively developed.
- `semantica/` — vendored **third-party** project (`semantica-agi/semantica`, "Open Source Palantir for AI Agents" — knowledge-graph/provenance framework). Not authored by you; evaluate as a dependency, not an asset.
- another stale copy of `agency-agents` (see 3a).

### 3d. `ai-os` — "Personal Business Operating System"
Separate, coherent product: comms triage (WhatsApp/email), automated finance ledger (bank webhook → P&L), and "G-Brain" shared memory (Postgres+pgvector). Node/Express + React/Vite, Docker Compose, Fly.io deploy config. Actively developed, uncommitted work in progress as of Aug 15.

### 3e. Reference-only (not ours)
`~/500-AI-Agents-Projects` — third-party catalog (`ashishpatel26/500-AI-Agents-Projects`) of ~20 example agent projects (LangGraph/CrewAI/AutoGen). Stale (last commit Jun 2026). Useful as example code, not a product.

### 3f. Dead ends — safe to abandon
`~/private-repo` (github `as307/-`) and `~/nexus-ai-marketing-agency` (github `as307/nexus-ai-marketing-agency`) — both created today via the `freebuff`/manicode tool, both effectively empty (3–27 byte READMEs, no code) despite one chat log running 144MB. Freebuff talked a lot and built nothing in either. Recommend deleting or repurposing — nothing to "resume" here.

## 4. Langflow — installed, unused

Langflow v1.11.3 is installed but has zero saved flows. It overlaps with Dify's role (visual agent-workflow canvas) rather than complementing it.

- **Langflow** = better for fast local prototyping of a single flow/chain, lighter weight, Python-native — good fit if `nanobot`-style custom runtime work (Arabic NLP, OCR, compliance skills from the blueprint) needs a visual builder during development.
- **Dify** = better as the actual production orchestrator named in the blueprint — built-in RAG, API key management, multi-channel deploy (web widget, API, Slack), workflow versioning.
- **Recommendation:** don't run both as competing orchestrators. Use Dify (per blueprint) as the Phase-1 core orchestrator; keep Langflow around only as a scratch tool for prototyping individual `nanobot` skills before wiring them into Dify. Revisit if Dify proves too heavy for your actual usage.

## 5. Recommended Next Steps

1. **Dedupe** the 3 stale `agency-agents` copies (§3a).
2. **Phase 1 (blueprint):** deploy Dify, wire it to the now-running Memory Hub as the memory backend, define one end-to-end workflow entrypoint.
3. Decide whether `aaa-agency`'s NEXUS orchestrator or Dify is the "real" orchestrator going forward — right now you have two candidate orchestration layers (`aaa-agency`'s NEXUS mode vs. the blueprint's Dify) plus a third live app (`nexus-executive.service` / Chainlit) that isn't referenced by the blueprint at all. Worth explicitly deciding which one is customer-facing HQ vs. internal tooling.
4. Archive or delete `private-repo` / `nexus-ai-marketing-agency`.
5. Continue blueprint Phase 2+ (agent-browser, nanobot, skills) only after Phase 1 is solid — checklist is in `INTEGRATION_CHECKLIST.md` (EN + AR).

## 6. Open questions for you

- Is `nexus-executive.service` (Chainlit, :8501) meant to be part of this HQ stack, or a separate personal tool? It's live and auto-starts on boot, but isn't mentioned anywhere in the blueprint.
- Should `apex-ai-automation` (`ai_company_server`) or `ai-os` be folded into the blueprint's stack, or are they separate products?
- Confirm before I push this doc/commit to `github.com/as307/---` — currently only committed locally in `~/OmO/hq`.
