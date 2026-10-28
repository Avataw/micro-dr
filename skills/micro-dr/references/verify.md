# verify

Compare each `accepted` record's claims with the code in its scope:

| Result | Meaning |
|---|---|
| holds | The claims are true |
| drifted | Partly true, or exceptions exist |
| violated | The code contradicts it |
| obsolete | The code in its scope is gone |
| unverifiable | No checkable claim |

Also flag records that build on a superseded record.

Report one line per record, problems first, with `file:line` evidence. Per finding, offer to update the record, supersede it, or fix the code, and change files only on the user's pick.

Done when every accepted record has a result.
