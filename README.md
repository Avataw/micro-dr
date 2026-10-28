# micro-dr

Agent skills for micro decision records.

Most decisions in a project are small, e.g. which library to use or how a button behaves. They rarely get an ADR, so the reason behind them is gone once the PR is merged.
micro-dr records them while you work and distills them into learnings your team and your agents can reuse.

The skills follow the [Agent Skills](https://agentskills.io) format, so any agent that supports it can use them.

## Install

```
npx skills add Avataw/micro-dr
```

## Usage

`micro-dr` is one skill with five subcommands, e.g. `/micro-dr track` in Claude Code. The exact syntax depends on your agent.

| Subcommand | What it does |
|---|---|
| `track` | Records a decision. Your agent also offers this when a decision comes up while working. |
| `distill` | Reads the records of the current branch and suggests learnings for your agent file (AGENTS.md, CLAUDE.md, ...), plus decisions that should move up, e.g. into your global ADRs. |
| `verify` | Checks every accepted record against the current code. |
| `inspect` | Explains one decision: where it comes from, its history and related decisions. |
| `setup` | Optional. Sets storage, formats and where learnings go. |

## A record

```markdown
---
id: mdr-20261028-sqlite-cache
type: technical
status: accepted
tags: [storage, offline]
---

# Use SQLite for the offline cache

In the context of offline support, facing unreliable connectivity, we decided to store offline data only in SQLite to keep sync simple, accepting a native dependency.
```

We keep the frontmatter minimal. Everything else comes from where the record lives and from git:

- The folder is the scope. A record in `src/storage/.micro-dr/` is about `src/storage`.
- Origin, author and history come from `git log`.
- Links between decisions are optional and live in `.micro-dr/graph.yml`.

## Formats

Y-statement is the default. Nygard, MADR, product and freeform are included, and each type can use its own.
Custom templates go into `.micro-dr/templates/`.

## Storage

- `colocated` (default): records live next to the code they are about.
- `central`: everything lives in `.micro-dr/`, in folders that mirror the repo.
- `private`: like `central`, but kept out of git via `.git/info/exclude`.

## License

MIT
