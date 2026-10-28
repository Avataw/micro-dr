# micro-dr

An agent skill for micro decision records.

Most decisions in a project are small, e.g. which library to use or how a button behaves. They rarely get an ADR, so the reason behind them is gone once the PR is merged.
micro-dr records them while you work, in a personal store outside the repo, and distills them into the repo before you push: learnings for your agent files, ADRs, doc updates and a decisions section for the PR. Decisions that hold across projects are copied into a global part of the store and travel with you.

The skill follows the [Agent Skills](https://agentskills.io) format, so any agent that supports it can use it. It needs git, and your agent needs write access to the store.

## Install

```
npx skills add Avataw/micro-dr
```

## Usage

`micro-dr` is one skill with six subcommands, e.g. `/micro-dr track` in Claude Code. In agents without slash commands, ask in plain words, e.g. "use micro-dr to record that we picked SQLite over IndexedDB because ...".

| Subcommand | What it does |
|---|---|
| `track` | Records decisions automatically as they come up while you work, or when you ask, and lists them at the end of the task. Also accepts, rejects or drops one. |
| `inspect` | Explains why something was decided, and on request its full history and related decisions. |
| `list` | Lists decisions by text, status, type, tag, path, date or branch, or exports them. |
| `distill` | Before you push: turns undistilled decisions into learnings, ADRs, doc updates and a PR section, and proposes global decisions. `distill global` compares all your projects. |
| `verify` | Lints the store and checks every accepted decision against the current code. |
| `setup` | Creates the store, registers the project, offers a line for your user-level agent file so your agent knows to use micro-dr, and offers a reminder before `git push`. |

## The store

```
~/.micro-dr/                    # or $MICRO_DR_HOME; a git repo of its own
├── config.yml
├── global/{technical,product,design}.md
└── projects/github.com/acme/shop/
    ├── project.yml
    ├── technical.md
    ├── product.md
    ├── design.md
    └── archive.md
```

No store file, id or mention of micro-dr ever lands in the repo. The repo only changes where you agree to it, mostly through `distill`, in the repo's own words.

Each file is a list of entries in a fixed shape, written for agents to grep and edit:

```markdown
## mdr-20261028-ky-client · accepted · Use ky as the shared HTTP client
- applies-to: src/api/**
- tags: http, retry
- decision: All HTTP calls go through the ky instance in src/api/client.ts, retrying 3x with backoff, POST included.
- why: The upstream rate-limits us; ky adds retries on fetch for 4 kB.
- rejected: axios (no built-in retry), got (Node-only)
- accepting: A retried POST can run twice.
- recorded: 2026-10-28 · feat/retrying-client · 3f2a1c9
```

Give the store a private remote: it holds what you decided for clients and employers.

## License

MIT
