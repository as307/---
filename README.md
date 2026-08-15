# AI Agent + Automation Combo Tool

This repository contains a practical shortlist and a composable stack definition for building an AI-agent automation system.

## What This Repository Is (and Is Not)

- This repository is a **blueprint + governance** reference.
- It defines architecture, integration order, and validation criteria.
- It does **not** include a fully integrated runnable environment for all tools yet.
- You only need another repository when you begin implementing/deploying a specific tool stack.

## Top 5 Repositories by Use Case

1. **Dify** — https://github.com/langgenius/dify
   Best all-around platform for workflows, agents, and RAG.

2. **nanobot** — https://github.com/HKUDS/nanobot
   Lightweight self-hosted Python agent framework.

3. **gpt-researcher** — https://github.com/assafelovic/gpt-researcher
   Research-focused autonomous agent for deep web analysis.

4. **agent-browser** — https://github.com/vercel-labs/agent-browser
   Browser automation layer for reliable web actions.

5. **khoj** — https://github.com/khoj-ai/khoj
   Memory and scheduled automation layer (“second brain”).

## Optional Advanced Memory Backend

- **TencentDB Agent Memory** — https://github.com/TencentCloud/TencentDB-Agent-Memory  
  Use this when you need team memory governance, asset sharing, skill extraction, wiki, and code graph capabilities.

## Recommended Combo Group

- **Core Orchestrator:** Dify
- **Research Engine:** gpt-researcher
- **Browser Action Layer:** agent-browser
- **Knowledge/Memory Layer:** khoj
- **Execution Runtime (Optional):** nanobot

## Included Implementation Artifact

- [`combo-tool-stack.yaml`](./combo-tool-stack.yaml)

This YAML file provides:
- the top-5 shortlist,
- grouped tool roles,
- upgrade roadmap (router, approval, QA, monitoring, fallback),
- a plug-and-play skill matrix (name, owner tool, I/O schema, fallback, risk level),
- ready pipeline patterns,
- MVP-to-production build order.



## Upgrade Skills Included

- Router skill for automatic request path selection
- Human approval gate for high-risk actions
- Evaluation/QA scoring skill
- Monitoring skill for latency/failure/cost
- Retry + fallback skill for resilience
- Arabic-first NLP, OCR ingestion, knowledge sync, scheduling, and security/compliance skills

## Ready-to-Copy Integration Checklist

- [`INTEGRATION_CHECKLIST.md`](./INTEGRATION_CHECKLIST.md) (English + Arabic)

## Recommended Implementation Order

1. Deploy **Dify** as the single workflow entrypoint.
2. Integrate **gpt-researcher** as the research engine.
3. Integrate **khoj** for persistent shared memory.
4. Integrate **agent-browser** for deterministic web actions.
5. Integrate **nanobot** only where custom Python runtime skills are needed (Arabic NLP, OCR, compliance).
6. Add router/approval/monitoring/fallback upgrades after MVP stability.

## How to Use This Repo

1. Use Dify as the entrypoint for all workflows.
2. Register gpt-researcher as a research tool in your orchestration flow.
3. Store reusable outputs and context in khoj.
4. Route website tasks to agent-browser.
5. Add nanobot only for custom Python runtime tasks where needed.
6. Use `combo-tool-stack.yaml` as the implementation contract for skill ownership, I/O schemas, and pipeline definitions.
7. Execute `INTEGRATION_CHECKLIST.md` phase-by-phase (MVP first, then reliability, then production).
8. Run the Quick Validation checklist before marking any phase complete.

## One-Command Runner (TencentDB Agent Memory)

If you want a single command from this repository to start the TencentDB Agent Memory stack:

```bash
./run_tencent_memory.sh
```

Optional flags:
- `--clone-if-missing` to clone the external TencentDB Agent Memory repository if it is not already present.
- `--approve-external-run` to explicitly allow running the external `start-all.sh` after review.
- `--base-dir <path>` to choose where the external repository should exist.

This runner launches TencentDB Agent Memory from its official `deploy/global-images/start-all.sh`.

## When You Should Use Another Repository

Use this repository alone when you are planning and governing architecture.

Create/use another repository only when you need to:
- deploy Dify or infrastructure artifacts,
- run integration code, adapters, or automation services,
- manage environment-specific runtime configuration.

## Team Operating Guidance

- Keep this repository as the single source of truth for architecture decisions.
- Update checklist status as implementation progresses.
- Update `combo-tool-stack.yaml` whenever skill ownership, schemas, or pipeline steps change.
