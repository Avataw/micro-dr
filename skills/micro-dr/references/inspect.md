# inspect

Find the entry by id, title or topic in the project's files, `archive.md` and `global/`.

For a "why" question, answer in two sentences: the decision and its reason, whether it's superseded, narrowed or pending, and when it was recorded or `decided`. Offer the full report.

For a named entry, or on request, report each section, writing "none" when it's empty:

- **Decision**: `decision` and `why`.
- **Origin**: `decided`, `decided-by`, and `recorded`. For the recorded sha, the project commit and its PR when `gh` or `glab` finds one.
- **History**: `supersedes` and `narrows` both ways; edits via `git -C <store> log --oneline -s -L <first>,<last>:<file>` with the entry's current line numbers; status changes and moves via `git -C <store> log --oneline -G'^## <id> ' -- projects global`.
- **Related**: `builds-on` both ways, entries whose `applies-to` overlaps, entries sharing a tag.
- **Alternatives**: `rejected`, and rejected or superseded entries on the same question.
- **Distilled**: where it went in the repo.

When nothing matches, or there is no store, look in the repo: the ADRs, the agent files, and the commits that touched the topic (`git log -S`) with their PR descriptions when `gh` or `glab` finds them. Report what they say without guessing a reason. Offer to `track` it with `decided` only when the repo doesn't answer it either.

Done when the question is answered.
