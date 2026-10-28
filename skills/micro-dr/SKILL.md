---
name: micro-dr
description: Keeps the user's small engineering, product and design decisions (microdrs) in a personal store outside the repo, checks them against the code, and distills them into the repo's agent files, ADRs, docs and PR descriptions. Use when a choice between real alternatives is settled while working ("X rather than Y", "we picked X because"), the user asks to record or log a decision, asks why something was decided, is about to push or open a pull request, or runs micro-dr track, inspect, list, distill, verify or setup. Project-wide architecture decisions belong in the repo's ADRs; micro-dr feeds them.
license: MIT
compatibility: Requires git, and write access to the store outside the workspace (~/.micro-dr or $MICRO_DR_HOME). Uses gh or glab for PR links when available.
---

`references/` and `assets/` paths are relative to this skill's folder.

1. Read `references/store.md`.
2. Find the store and this repo's project folder as it describes. When either is missing, `track` creates it, `inspect` searches `global/` and the repo, and `distill global` needs only the store; every other subcommand says so and offers `setup`.
3. Read the subcommand's file and follow it.

| Subcommand | File | Runs when |
|---|---|---|
| `track` | `references/track.md` | A decision is made, the user asks to record one, or an entry's status changes |
| `inspect` | `references/inspect.md` | The user asks why something was decided, or names a microdr |
| `list` | `references/list.md` | The user asks which decisions exist, or for an export |
| `distill` | `references/distill.md` | The user is about to push or open a PR, or asks for it |
| `verify` | `references/verify.md` | The user asks whether decisions still hold |
| `setup` | `references/setup.md` | The user asks for it |

Without a subcommand, pick from the table. When it's unclear, ask, describing each option by what it does for the user rather than by its name.

Never write a microdr id, or the name micro-dr, into the repo.
