# setup

Ask one question at a time in plain words, proposing the default; the user may skip any.

## Store

1. When the store doesn't exist, create it with `git init` and an empty `config.yml`. Commit.
2. When it has no remote, offer to add one, then `git -C <store> push -u origin HEAD`. It holds client and company knowledge, so it should be private.

## This project

3. Create `projects/<key>/project.yml` with the full `root` sha.
4. The ADR folder, proposing an existing one.
5. Which repo files receive learnings, suggesting the agent files the repo has.
6. When a project decision and a global one disagree, which wins: the project (default) or the global one. Save `precedence: global` in `project.yml` only for the latter.

## Agent

7. Writing to the store needs access outside the workspace. Tell the user how their agent grants it, e.g. Claude Code's `additionalDirectories` setting or `/add-dir`.
8. Which user-level agent files or skills receive global learnings; save them as `learnings` in the store's `config.yml`.
9. Offer to add this line to the user-level agent file, never to a repo file: "Decisions are kept with the micro-dr skill. Use it to answer why something was decided, record decisions with micro-dr track whenever a change settles a choice between options, and run micro-dr distill before pushing or opening a pull request."
10. Whether decisions are recorded automatically (default) or only offered; save `tracking: offer` in the store's `config.yml` for the latter.
11. Offer a reminder before `git push`: copy `assets/pre-push.sh` to `$(git rev-parse --git-path hooks)/pre-push` and make it executable. Skip this when a pre-push hook exists or `core.hooksPath` is set, and say why. The hook only warns, never blocks, and is never committed.
12. Whether they keep kinds of decisions beyond technical, product, design, practice and team, e.g. ops or legal. Save each as `<name>: <what it holds>` under `types` in the store's `config.yml`.

Commit the store.

Done when the store and `project.yml` exist and every answered question is applied.
