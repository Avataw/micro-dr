# micro-dr store

## Layout

The store is `$MICRO_DR_HOME`, else `~/.micro-dr`. It's a git repo of its own and never part of a project. Resolve it once with `echo "${MICRO_DR_HOME:-$HOME/.micro-dr}"` and use that absolute path everywhere. When that lookup fails or is denied, stop and say so; never create a store anywhere else.

```
~/.micro-dr/
├── config.yml                  # learnings: user-level agent files or skills; tracking: auto (default) or offer
├── global/                     # decisions that hold across projects
│   ├── technical.md
│   ├── product.md
│   └── design.md
└── projects/<key>/
    ├── project.yml
    ├── technical.md            # architectural decisions too, tagged `architecture`
    ├── product.md
    ├── design.md
    └── archive.md              # superseded and rejected entries
```

`<key>` comes from `git remote get-url origin`: drop the protocol, credentials (`user@`, `user:token@`), a port and a trailing `.git` or `/`, turn `:` into `/`, and lowercase the host, e.g. `github.com/acme/shop`. Without a remote, or with a local path or `file:` remote: `local/<repo folder name>`.

`project.yml`:

```yaml
root: 3f2a1c9e8d7b6a5f4e3d2c1b0a9f8e7d6c5b4a39   # full sha: last line of `git rev-list --max-parents=0 HEAD`
adr: docs/adr         # the repo's ADR folder, or null
learnings: []         # repo files that receive learnings; empty: the root agent file
```

To find the project, look for `projects/<key>/` and check that its `root` matches. When it's missing or doesn't match, search `projects/**/project.yml` for this repo's `root`; a match means the remote changed, so use that folder and tell the user. In a shallow clone the root is wrong; say so instead of creating a project.

## Entries

A type file is a list of entries, nothing else. Each entry:

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

Type files:

- `technical`: how code is built, and how areas fit together (tag those `architecture`).
- `product`: what the product does and for whom (scope, pricing, limits, support).
- `design`: what users see and how the UI behaves.

Heading: `## <id> · <status> · <title>`.

- `id`: `mdr-<YYYYMMDD>-<slug>`, slug matching `[a-z0-9-]+`, unique across the whole store. Never changes.
- `status`: `proposed`, `accepted`, `rejected`, or `superseded by <id>`.

Lines, in this order. `applies-to`, `tags`, `recorded` and `distilled` are filled in by the skill; every other line only when someone stated it:

| Line | Holds |
|---|---|
| `applies-to` | Repo paths or globs the decision governs; `*` for the whole repo |
| `tags` | Short lowercase words; reuse existing ones |
| `supersedes`, `narrows`, `builds-on` | Ids, only when the user stated the relation. `narrows` means an exception to that entry for this entry's `applies-to` |
| `decision` | What was decided, as concrete checkable claims |
| `why` | The reason, or `<reason?>` while it's missing |
| `rejected` | Alternatives and why they lost |
| `accepting` | The downside taken on |
| `decided-by` | Who decided, when it wasn't the user |
| `decided` | `<YYYY-MM-DD>`, when the decision predates the entry |
| `pending` | What still has to change in the code or docs |
| `recorded` | `<YYYY-MM-DD> · <branch> · <short project HEAD sha>` |
| `distilled` | `<target> "<section>" (<YYYY-MM-DD>)`, one line per target, or `none (<YYYY-MM-DD>)`, or `withdrawn (<YYYY-MM-DD>)` |

Find entries with `grep -n '^## ' <files>`: the headings are the index. Read an entry from its heading to the next `## `.

## Writing

- When the store has a remote, `git -C <store> pull --rebase` before reading. On a conflict, stop and show it to the user.
- Append new entries at the end of the type file. Change an existing entry by editing its lines in place, found by its heading. Never rewrite a whole file, with any tool.
- Re-read an entry right before editing it; another session may have changed it.
- After every change, commit only the files you changed, with the user's git identity: `git -C <store> add -- <files>`, then `git -C <store> commit -m "<subcommand>: <ids>" -- <files>`. Skip when nothing changed. When the store has a remote, `git -C <store> push`; on failure, tell the user and go on.
