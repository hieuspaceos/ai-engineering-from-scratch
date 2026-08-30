# Learn with this fork

This fork adds an `omp-plugin/` adapter so the upstream skills work
with the omp coding CLI in addition to Claude Code and Codex. It also
adds `LEARNING.md`, a personal study plan covering 17 lessons across
five depth questions.

## Quick start

```bash
git clone https://github.com/hieuspaceos/ai-engineering-from-scratch.git
cd ai-engineering-from-scratch
./omp-plugin/setup.sh    # creates symlinks in ~/.omp/agent/skills
```

Open omp and start a lesson:

```
/start-learning          # onboarding + placement quiz
/learn ai-engineering    # next lesson from LEARNING.md
```

For a curated path through the curriculum, read `LEARNING.md` directly —
the 17 lessons there are mapped onto the five things you need to walk
away with to debug an LLM-backed system in production.

## Other AI hosts

| Host | Install | Slash command |
|---|---|---|
| omp | `./omp-plugin/setup.sh` | `/start-learning`, `/learn ai-engineering` |
| Claude Code | nothing — auto-loads `.claude/skills/` | `/start-learning`, `/learn ai-engineering` |
| Codex | nothing — auto-loads `.codex/skills/` | `start-learning`, `learn ai-engineering` |
| Other | read `LEARNING.md` and run lessons manually | n/a |

## What this fork adds on top of upstream

- `omp-plugin/setup.sh` — symlinks the 8 skills into omp's user-level
  skills directory. omp discovers them at startup.
- `omp-plugin/skills/` — exact copies of the upstream skills so omp
  loads them without depending on Claude Code.
- `omp-plugin/README.md` — adapter-specific documentation.
- `LEARNING.md` — a curated 17-lesson plan organised around five depth
  questions, with a stop condition tied to debugging an LLM-backed
  chatbot in production.

## Updating the fork

Pull from upstream to sync with `rohitg00/ai-engineering-from-scratch`:

```bash
git fetch upstream
git merge upstream/main
```

Then re-run the omp setup if any skill files changed:

```bash
./omp-plugin/setup.sh
```

## License

Same as upstream — MIT.