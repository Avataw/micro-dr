# distill

The store is personal, so the repo learns about decisions mostly through what `distill` writes into it. Run it before pushing or opening a PR.

## Steps

1. Review the proposed entries of the project and of `global/practice.md`, oldest first, one at a time. Show each as its decision, `why`, `rejected` and `decided-by`, plus what keeps it proposed: a missing reason, a conflict, or someone else deciding. Ask the user to accept, reject, drop, edit or skip it; ask for the reason before accepting one with `<reason?>`. Apply the answer as in `track`'s "Changing status". Skipped entries stay proposed and come up again next time. Commit the store after the review. With nothing proposed, go on.
2. Collect the project's accepted entries without a `distilled` line, and those in `global/practice.md`. The user may narrow them to the current branch through `recorded`.
3. Read the targets. With `workspace` set in the store's `config.yml`, the learnings target is `<workspace>/<key>.md`, and the repo gets ADRs, doc edits and a PR section only when the user asks for them in this run. Otherwise the targets are the repo's: the files in `learnings` (empty: the root agent file the others import, else `AGENTS.md`, else `CLAUDE.md`), the ADRs in `adr`, and docs the entries name. Read `global/` and the store's `config.yml`.
4. Build these lists:
   - **Learnings**: rules an agent working in this repo would otherwise get wrong. More entries behind a rule rank it higher. Skip anything that only repeats a value the code or config already states.
   - **ADRs**: technical entries tagged `architecture`, or whose `applies-to` spans several top-level code folders; docs don't count. With `adr` unset, ask for the folder.
   - **Docs**: docs that an entry makes stale, e.g. a PRD still naming the old limit.
   - **PR description**: a "Decisions" section summarising this branch's entries, one bullet each: the decision and why.
   - **User-level learnings**: rules from accepted `global/practice.md` entries for the files in the store's `config.yml` `learnings`, asking for them when empty. Skip a rule those files already state.
   - **Global**: entries whose decision and reason hold outside this project, naming none of its code, domain, team or customers, or the same decision found in another project's files. Skip those a near-identical `global/` entry already covers; offer to note the project there instead.
   - **Stale**: entries, in `archive.md` too, with a `distilled` line naming a target (not `none` or `withdrawn`) that are now superseded or rejected, or whose `decision` changed after the date on that line.
5. Apply only the items the user picks. Everything written into the repo uses the repo's own voice and conventions, without ids and without naming micro-dr:
   - Insert learnings into the section of the target that covers their topic. A workspace file that doesn't exist yet starts with `# <key>` and gets one `##` section per topic.
   - Write ADRs in the format and numbering the folder already uses.
   - Edit docs in place.
   - Show the PR section; with `gh` or `glab` and an open PR, offer to add it to the PR body.
   - User-level learnings: insert each rule into the section of the file that covers its topic, without ids.
   - Global: append an entry to the matching `global/` file, keeping `decision`, `why`, `rejected` and `accepting` and dropping project specifics, with a new id. Offer its learning for the files in the store's `config.yml` `learnings`, asking for them when empty.
   - Stale: fix or remove the line in the target. When fixed, update the date on the entry's `distilled` line; when removed, replace its `distilled` lines with `distilled: withdrawn (<date>)`. Either way it isn't stale again.
6. Add a `distilled` line to every entry handled, and `distilled: none (<date>)` to entries the user declined, so they don't come back. Commit the store.

## Across projects

Run as `distill global`, from anywhere: review the proposed entries of all projects and of `global/`, then compare all projects' accepted entries and propose `global/` entries for decisions made the same way in two or more projects, then offer the user-level learnings above.

Done when every proposed entry was reviewed or skipped, every picked item is applied and every collected entry has a `distilled` line.
