#!/usr/bin/env bash

set -euo pipefail

REPO_URL="https://github.com/TencentCloud/TencentDB-Agent-Memory.git"
BASE_DIR="$(pwd)"
TARGET_DIR="${BASE_DIR}/TencentDB-Agent-Memory"
CLONE_IF_MISSING=0
APPROVE_EXTERNAL_RUN=0

print_help() {
  cat <<'EOF'
Usage: run_tencent_memory.sh [--clone-if-missing] [--approve-external-run] [--base-dir <path>] [--help]

Starts TencentDB Agent Memory using the official deploy script.

Options:
  --clone-if-missing    Clone TencentDB-Agent-Memory if not found.
  --approve-external-run  Allow execution of external start-all.sh after review.
  --base-dir <path>     Parent directory where TencentDB-Agent-Memory should exist.
  --help                Show this help.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --clone-if-missing)
      CLONE_IF_MISSING=1
      shift
      ;;
    --base-dir)
      BASE_DIR="${2:?Missing value for --base-dir}"
      TARGET_DIR="${BASE_DIR}/TencentDB-Agent-Memory"
      shift 2
      ;;
    --approve-external-run)
      APPROVE_EXTERNAL_RUN=1
      shift
      ;;
    --help|-h)
      print_help
      exit 0
      ;;
    *)
      echo "Unknown argument: $1"
      print_help
      exit 1
      ;;
  esac
done

if [[ ! -d "${TARGET_DIR}" ]]; then
  if (( CLONE_IF_MISSING )); then
    echo "Cloning TencentDB-Agent-Memory into ${TARGET_DIR}..."
    git clone "${REPO_URL}" "${TARGET_DIR}"
  else
    echo "TencentDB-Agent-Memory not found at: ${TARGET_DIR}"
    echo "Run with --clone-if-missing or clone manually:"
    echo "  git clone ${REPO_URL} ${TARGET_DIR}"
    exit 1
  fi
fi

DEPLOY_DIR="${TARGET_DIR}/deploy/global-images"
ENV_FILE="${DEPLOY_DIR}/.env"
ENV_EXAMPLE="${DEPLOY_DIR}/.env.example"
START_SCRIPT="${DEPLOY_DIR}/start-all.sh"

if [[ ! -d "${DEPLOY_DIR}" ]]; then
  echo "Missing deploy directory: ${DEPLOY_DIR}"
  exit 1
fi

if [[ ! -f "${ENV_FILE}" ]]; then
  if [[ -f "${ENV_EXAMPLE}" ]]; then
    cp "${ENV_EXAMPLE}" "${ENV_FILE}"
    echo "Created ${ENV_FILE} from .env.example"
    echo "Please edit ${ENV_FILE} with your LLM settings, then rerun."
    exit 2
  fi
  echo "Missing ${ENV_FILE} and .env.example"
  exit 1
fi

if (( ! APPROVE_EXTERNAL_RUN )); then
  echo "External script review required before execution:"
  echo "  ${START_SCRIPT}"
  echo "Verify repository integrity (trusted commit/tag/signature) before approval."
  echo "Re-run with --approve-external-run after reviewing that script."
  exit 2
fi

if [[ ! -f "${START_SCRIPT}" ]]; then
  echo "Missing start script: ${START_SCRIPT}"
  exit 1
fi

if [[ ! -x "${START_SCRIPT}" ]]; then
  echo "External start script is not executable:"
  echo "  ${START_SCRIPT}"
  echo "Please review it and make it executable manually:"
  echo "  chmod +x ${START_SCRIPT}"
  exit 2
fi

echo "Starting TencentDB Agent Memory..."
status=0
( cd "${DEPLOY_DIR}" && "${START_SCRIPT}" ) || status=$?
if [[ ${status} -ne 0 ]]; then
  echo "TencentDB Agent Memory startup failed with exit code ${status}."
  exit "${status}"
fi

echo "TencentDB Agent Memory started successfully."
exit 0
