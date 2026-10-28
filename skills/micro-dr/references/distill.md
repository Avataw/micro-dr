# distill

The store is personal, so the repo learns about decisions mostly through what `distill` writes into it. Run it before pushing or opening a PR.

## Steps

1. Collect the project's accepted entries without a `distilled` line. The user may narrow them to the current branch through `recorded`.
2. Read the repo's targets: the files in `learnings` (empty: the root agent file the others import, else `AGENTS.md`, else `CLAUDE.md`), the ADRs in `adr`, and docs the entries name. Read `global/` and the store's `config.yml`.
3. Build these lists:
   - **Learnings**: rules an agent working in this repo would otherwise get wrong. More entries behind a rule rank it higher. Skip anything that only repeats a value the code or config already states.
   - **ADRs**: technical entries tagged `architecture`, or whose `applies-to` spans several top-level code folders; docs don't count. With `adr` unset, ask for the folder.
   - **Docs**: docs that an entry makes stale, e.g. a PRD still naming the old limit.
   - **PR description**: a "Decisions" section summarising this branch's entries, one bullet each: the decision and why.
   - **Global**: entries whose decision and reason hold outside this project, naming none of its code, domain, team or customers, or the same decision found in another project's files. Skip those a near-identical `global/` entry already covers; offer to note the project there instead.
   - **Stale**: entries, in `archive.md` too, with a `distilled` line naming a target (not `none` or `withdrawn`) that are now superseded or rejected, or whose `decision` changed after the date on that line.
4. Apply only the items the user picks. Everything written into the repo uses the repo's own voice and conventions, without ids and without naming micro-dr:
   - Insert learnings into the section of the target that covers their topic.
   - Write ADRs in the format and numbering the folder already uses.
   - Edit docs in place.
   - Show the PR section; with `gh` or `glab` and an open PR, offer to add it to the PR body.
   - Global: append an entry to the matching `global/` file, keeping `decision`, `why`, `rejected` and `accepting` and dropping project specifics, with a new id. Offer its learning for the files in the store's `config.yml` `learnings`, asking for them when empty.
   - Stale: fix or remove the line in the target. When fixed, update the date on the entry's `distilled` line; when removed, replace its `distilled` lines with `distilled: withdrawn (<date>)`. Either way it isn't stale again.
5. Add a `distilled` line to every entry handled, and `distilled: none (<date>)` to entries the user declined, so they don't come back. Commit the store.

## Across projects

Run as `distill global`, from anywhere: compare all projects' accepted entries and propose `global/` entries for decisions made the same way in two or more projects.

Done when every picked item is applied and every collected entry has a `distilled` line.
