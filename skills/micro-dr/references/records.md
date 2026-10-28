# micro-dr records

## Record

One decision per Markdown file, named `<id>.md`:

```markdown
---
id: mdr-20261028-sqlite-cache
type: technical
status: accepted
tags: [storage, offline]
---

# Use SQLite for the offline cache

<body in the configured format>
```

- `id`: `mdr-<YYYYMMDD>-<slug>`. Never changes, even when the file moves.
- `type`: `technical` | `architectural` | `design` | `product`.
- `status`: `proposed` | `accepted` | `superseded` | `rejected`.
- `tags`: short lowercase words.
- `recorded: <YYYY-MM-DD> on <branch>`: only in `private` storage, where git holds no history.

The body holds the decision, its claims and its reason in full, readable without the PR or git history.

Everything else comes from the environment:

| Fact | Source |
|---|---|
| Scope | The folder holding the record |
| Origin, date, author, history | `git log --follow` on the file |
| Title | The `#` heading |
| Links to other decisions | `.micro-dr/graph.yml` |

## Storage

Scope is the folder a record sits in. Root scope means repo-wide.

| `storage` | Record for scope `src/storage` | In git |
|---|---|---|
| `colocated` (default) | `src/storage/.micro-dr/<id>.md` | yes |
| `central` | `.micro-dr/src/storage/<id>.md` | yes |
| `private` | `.micro-dr/src/storage/<id>.md` | no, `.micro-dr/` is in `.git/info/exclude` |

Repo-wide records live in `.micro-dr/<id>.md` in every mode.

## `.micro-dr/config.yml`

All keys optional. Defaults shown:

```yaml
storage: colocated          # colocated | central | private
format:
  default: y-statement      # a template name
  # product: product        # per-type override
location: {}                # per-type fixed scope, e.g. product: docs/product
learnings: []               # empty: the repo's agent file (AGENTS.md, CLAUDE.md, ...),
                            # or .micro-dr/learnings.md when storage is private
adr: null                   # folder of the project's global ADRs
```

Templates live in `assets/templates/`. A file in `.micro-dr/templates/` with the same name wins.

## `.micro-dr/graph.yml`

Optional. One edge per line:

```yaml
- mdr-20261028-sqlite-cache supersedes mdr-20260412-json-cache
- mdr-20261028-sqlite-cache builds-on mdr-20260901-offline-first
```

Edges: `supersedes`, `builds-on`. A `superseded` record has a matching `supersedes` edge.
