---
name: micro-dr
description: Micro decision records (microdrs). Use when a decision is made while working, the user asks why something was decided, or the user runs micro-dr track, distill, verify, inspect or setup.
license: MIT
---

Paths are relative to this skill's folder. Read `references/records.md`, and `.micro-dr/config.yml` if it exists. Then read the subcommand's file and follow it.

| Subcommand | File | Runs when |
|---|---|---|
| `track` | `references/track.md` | A decision is made, or the user asks to record one |
| `inspect` | `references/inspect.md` | The user asks why something was decided, or names a microdr |
| `distill` | `references/distill.md` | The user asks for it |
| `verify` | `references/verify.md` | The user asks for it |
| `setup` | `references/setup.md` | The user asks for it |

Without a subcommand, pick from the table and ask when it's unclear.
