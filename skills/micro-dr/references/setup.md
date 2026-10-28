# setup

Ask one question at a time, default preselected, each skippable:

1. Storage: `colocated`, `central` or `private`.
2. Default format from `assets/templates/`, then per-type overrides.
3. Per-type fixed locations, e.g. product decisions in `docs/product`.
4. Learning targets, suggesting the agent files the repo already has.
5. ADR folder, proposing an existing one.

Write `.micro-dr/config.yml` with only non-default keys. For `private`, add `.micro-dr/` to `.git/info/exclude`.
