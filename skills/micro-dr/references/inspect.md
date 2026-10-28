# inspect

Find the record by id, path or description, then report:

- **Decision**: claim and reason in two sentences.
- **Origin**: the commit that added it, and its PR when `gh` or `glab` finds one. In `private` storage: the `recorded` line.
- **History**: later commits to the file, and the `supersedes` chain both ways.
- **Related**: `builds-on` edges both ways, records in the same or a parent scope, records sharing a tag.
- **Alternatives**: options the body names, and superseded or rejected records on the same question.
