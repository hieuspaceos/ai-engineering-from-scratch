# AI Engineering from Scratch — omp plugin

Adapter that exposes the upstream
[`rohitg00/ai-engineering-from-scratch`](https://github.com/rohitg00/ai-engineering-from-scratch)
skills as an omp plugin. Source skills live in
`~/.claude/skills/<skill>/SKILL.md` (Claude Code format). They are copied
verbatim into `skills/<skill>/SKILL.md` so omp can load them.

## Install

From this directory:

```bash
omp plugin install .
```

The 8 skills become available as slash commands:

| Skill | Slash form | Purpose |
|---|---|---|
| `start-learning` | `/start-learning` | one-time onboarding + placement quiz |
| `learn` | `/learn` | next-lesson tutor loop |
| `learn-mcp` | `/learn-mcp` | focused Model Context Protocol path |
| `course-guide` | `/course-guide` | topic router |
| `check-understanding` | `/check-understanding <phase>` | per-phase quiz |
| `find-your-level` | `/find-your-level` | 10-question placement quiz |
| `learn-agent-skills` | `/learn-agent-skills` | Agent Skills focused path |
| `claude-certification` | `/claude-certification` | Claude cert prep |

## Update

When upstream changes:

```bash
cd skills
for s in start-learning learn learn-mcp course-guide check-understanding find-your-level learn-agent-skills claude-certification; do
  cp ~/.claude/skills/$s/SKILL.md $s/SKILL.md
done
```

## Notes

- Invocation syntax in the upstream `SKILL.md` files mentions Claude Code
  and Codex specifically. Omp falls under "Other compatible hosts" — use
  the slash form (`/start-learning`) or natural-language form ("Use
  start-learning to begin").
- The upstream `learn` skill produces a question with structured options.
  omp exposes the `ask` tool, so the tutor will use it automatically.