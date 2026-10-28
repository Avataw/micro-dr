# track

## When to record

Record without asking whenever a choice between real alternatives is settled that the code alone won't explain. Don't interrupt the task for it. At the end of the task, list what was recorded, one line each, with any open question: a missing reason or a contradiction. When the user says to drop one, delete it.

With `tracking: offer` in the store's `config.yml`, offer instead of writing: once, in one line at the end of the task, batching every decision. After a no, don't offer that decision again.

## Recording

When the store or the project folder is missing, create it as `setup` would, with defaults. Then tell the user once, in plain words:

- The store lives outside the repo and needs write access there.
- It has no backup until it gets a private remote; offer to add one as in `setup` step 2.
- Offer to add this line, shown word for word, to their user-level agent file: "Decisions are kept with the micro-dr skill. Use it to answer why something was decided, record decisions with micro-dr track whenever a change settles a choice between options, and run micro-dr distill before pushing or opening a pull request."

1. Pick the type file: `technical`, `product` or `design`. Tag decisions about how areas fit together (boundaries, protocols, data ownership) `architecture`. Ask only when it's ambiguous.
2. Take the reason from the user. When they gave none and asked you to record it, ask. Otherwise, or when you can't ask, write status `proposed` with `why: <reason?>` and ask in the end-of-task list. When they decline, leave `why` out. Never invent a reason, alternative or downside.
3. Set `applies-to` to the paths the decision governs, from the code and docs it touches.
4. Pick tags, reusing existing ones: `grep -h '^- tags:' <store>/projects/<key>/*.md`.
5. Look for contradictions:
   - accepted entries in the project whose `applies-to` overlaps or that share a tag;
   - the repo: ADRs in `adr`, and a grep for the values and names the decision changes, e.g. a limit in a PRD or a config file;
   - `global/`. A conflict there is only worth mentioning; the project's decision wins.
6. On a contradiction, when the user asked you to record it, stop and ask in plain words. When recording on your own, or when you can't ask, write status `proposed`, name the conflict in `why`, and raise it in the end-of-task list. An explicit instruction like "replace X with Y" already picks the replacement. The options:
   - Change the new decision.
   - Edit the old entry.
   - Replace it: the new entry lists it in `supersedes` and restates whatever of it still holds.
   - Make an exception: the new entry lists it in `narrows`, and its `applies-to` covers only the exception.
   - Update the repo's doc, or write a new ADR superseding the old one in the ADR folder's convention.
7. When the code or docs will follow later, add `pending`.
8. Append the entry, `accepted` unless step 2 or 6 made it `proposed`, with `recorded` filled in. When it's accepted, do the status bookkeeping below. Commit, and tell the user in plain words what was recorded; when recording on your own, in the end-of-task list.

## Changing status

On "drop", delete an entry that has no `distilled` line. On "accept" or "reject", change the heading's status; before accepting, make sure `why` has no `<reason?>` and rerun step 5. When an entry becomes `accepted`, set each entry it `supersedes` to `superseded by <id>` and move those to `archive.md`. Move rejected entries there too.

Done when the entry is written or edited, committed, and every contradiction is resolved or named in a `proposed` entry.
