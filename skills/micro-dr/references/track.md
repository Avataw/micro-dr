# track

When the user didn't ask, offer the record in one line and continue only on yes.

1. Pick the type. Ask only when it's ambiguous.
2. Pick the scope: `location.<type>` if set, else the narrowest folder whose code the decision governs, else the repo root.
3. Read accepted records in that scope, its parent scopes, and those sharing a tag. On a contradiction the user picks: adjust the new decision, supersede the old one (status `superseded` plus the `graph.yml` edge), or state the exception in the new record.
4. Write the record from the type's template. Status `accepted`, or `proposed` while the user is still deciding.
5. Propose a `builds-on` edge when it clearly builds on an existing record.

Done when the record exists at its scope's path and no contradiction is open.
