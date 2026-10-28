#!/bin/sh
# micro-dr: warns about accepted decisions not yet distilled into the repo. Never blocks.
store="${MICRO_DR_HOME:-$HOME/.micro-dr}"
[ -d "$store/projects" ] || exit 0
root=$(git rev-list --max-parents=0 HEAD 2>/dev/null | tail -n 1)
[ -n "$root" ] || exit 0
project=$(grep -rl --include=project.yml "^root: $root" "$store/projects" 2>/dev/null | head -n 1)
[ -n "$project" ] || exit 0
dir=$(dirname "$project")
set --
for f in "$dir"/technical.md "$dir"/product.md "$dir"/design.md; do
  [ -f "$f" ] && set -- "$@" "$f"
done
[ $# -gt 0 ] || exit 0
count=$(awk '
  /^## / { if (open && !done) n++; open = ($0 ~ / · accepted · /); done = 0; next }
  /^- distilled:/ { done = 1 }
  END { if (open && !done) n++; print n + 0 }
' "$@")
[ "${count:-0}" -gt 0 ] && echo "micro-dr: $count accepted decision(s) not distilled yet. Run micro-dr distill before opening the PR." >&2
exit 0
