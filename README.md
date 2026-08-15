# AI Agent + Automation Combo Tool

This repository contains a practical shortlist and a composable stack definition for building an AI-agent automation system.

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
- ready pipeline patterns,
- MVP-to-production build order.


## Ready-to-Copy Integration Checklist

- [`INTEGRATION_CHECKLIST.md`](./INTEGRATION_CHECKLIST.md) (English + Arabic)

## How to Use

1. Use Dify as the entrypoint for all workflows.
2. Register gpt-researcher as a research tool in your orchestration flow.
3. Store reusable outputs and context in khoj.
4. Route website tasks to agent-browser.
5. Add nanobot only for custom Python runtime tasks where needed.
