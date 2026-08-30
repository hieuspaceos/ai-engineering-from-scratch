#!/usr/bin/env bash
# setup.sh — symlink the 8 skills into omp's user-level skills directory
# so omp discovers them automatically.
#
# Usage:
#   ./setup.sh           # symlink from ~/.omp/agent/skills
#   ./setup.sh --unlink  # remove symlinks

set -euo pipefail

OMPDIR="${OMPDIR:-$HOME/.omp/agent/skills}"
HERE="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="${HERE}/skills"

if [[ ! -d "${SKILLS_DIR}" ]]; then
  echo "Error: ${SKILLS_DIR} not found. Run from the omp-plugin directory." >&2
  exit 1
fi

mkdir -p "${OMPDIR}"

action="${1:-link}"

for s in start-learning learn learn-mcp course-guide check-understanding find-your-level learn-agent-skills claude-certification; do
  src="${SKILLS_DIR}/${s}"
  dst="${OMPDIR}/${s}"
  case "${action}" in
    --unlink|unlink)
      if [[ -L "${dst}" ]]; then
        rm "${dst}"
        echo "removed ${dst}"
      fi
      ;;
    *)
      if [[ ! -d "${src}" ]]; then
        echo "skip ${s}: ${src} not found"
        continue
      fi
      if [[ -e "${dst}" && ! -L "${dst}" ]]; then
        echo "skip ${s}: ${dst} exists and is not a symlink"
        continue
      fi
      ln -sfn "${src}" "${dst}"
      echo "linked ${dst} -> ${src}"
      ;;
  esac
done

echo ""
echo "Done. Open omp and try /start-learning."