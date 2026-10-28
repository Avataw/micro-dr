# distill

1. Collect records added or changed since this branch left the base branch. In `private` storage: records whose `recorded` branch is the current one.
2. Read them alongside the existing records in their scopes.
3. Build two lists:
   - **Learnings**: rules worth keeping beyond these decisions, each with its backing records and its `learnings` target. More backing records rank higher.
   - **Promotions**: records whose effect reaches past their scope, with the wider scope, or an ADR in `adr` when the reach is architectural.
4. Apply only the items the user picks: insert learnings where they fit in the target file, move promoted records, write ADRs in the format `adr` already uses.
