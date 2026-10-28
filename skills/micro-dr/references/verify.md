# verify

Accepts paths or tags, to check only entries whose `applies-to` or tags match.

## 1. Lint

Across the store, report:

- Headings not matching `## mdr-<YYYYMMDD>-[a-z0-9-]+ · <status> · <title>`, unknown status, unknown lines.
- Duplicate ids.
- Ids in `supersedes`, `narrows`, `builds-on` or `superseded by` that no entry has.
- An accepted entry whose `supersedes` targets aren't `superseded by` it, and a `superseded by <id>` whose entry isn't accepted or doesn't list it in `supersedes`.
- Cycles along `supersedes`, `narrows` and `builds-on`.
- Accepted entries with `<reason?>`, and proposed entries whose id date is more than 30 days old.

## 2. Claims

Check each accepted entry of the project in `technical.md`, `product.md` and `design.md`. Start at its `applies-to`, then follow what `decision` names across the repo: callers, routes, config, docs. An exception stated by an accepted entry that `narrows` it is not a finding.

Every failing result names the entry's `recorded` branch, so the user can tell work from another branch apart from real drift.

| Result | Meaning |
|---|---|
| violated | Code or docs contradict a claim, and the entry has no `pending` |
| orphaned | `applies-to` matches nothing and the claims hold nowhere |
| moved | `applies-to` matches nothing, but the claims hold elsewhere |
| pending | The entry has `pending` and the claims don't hold yet |
| holds | Every claim holds |
| unverifiable | No checkable claim |

An entry takes the first result in this table that fits. Also flag entries that build on a superseded entry, and accepted entries with overlapping `applies-to` or a shared tag that decide the same question differently.

## 3. Report

One line per entry, problems first, with `file:line` evidence or the project commit that changed the code. A `pending` entry whose claims already hold gets "pending done". Then ask once which fixes to apply:

| Finding | Offer |
|---|---|
| lint | fix the heading, line or edge |
| violated | fix the code, update the doc, add `pending`, or replace the decision |
| orphaned | reject it |
| moved | update `applies-to` |
| pending done | remove `pending` |
| builds on superseded, conflict | replace, narrow or edit one of the entries |

Change files only on the user's pick, and commit the store.

Done when every checked entry has a result.
