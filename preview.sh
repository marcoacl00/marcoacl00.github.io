#!/usr/bin/env bash
# Preview the website as committed on a branch (default: "a") in your browser.
#
#   ./preview.sh            -> serves branch "a" on http://localhost:8000
#   ./preview.sh main 8080  -> serves branch "main" on http://localhost:8080
#   ./preview.sh --local    -> serves the current working directory (uncommitted edits included)
#
# The branch is exported into a temporary folder with `git archive`, so your
# current checkout and uncommitted files are never touched. Stop with Ctrl+C.
set -euo pipefail

BRANCH="${1:-a}"
PORT="${2:-8000}"
REPO="$(git -C "$(dirname "$0")" rev-parse --show-toplevel)"

if [[ "$BRANCH" == "--local" ]]; then
    DIR="$REPO"
    echo "Serving working directory $DIR"
else
    git -C "$REPO" rev-parse --verify --quiet "$BRANCH" >/dev/null \
        || { echo "Branch '$BRANCH' not found." >&2; exit 1; }
    DIR="$(mktemp -d -t site-preview-XXXX)"
    trap 'rm -rf "$DIR"' EXIT
    git -C "$REPO" archive "$BRANCH" | tar -x -C "$DIR"
    echo "Serving branch '$BRANCH' ($(git -C "$REPO" log -1 --format='%h %ci' "$BRANCH"))"
fi

URL="http://localhost:$PORT/index.html"
echo "Open $URL  (Ctrl+C to stop)"
( sleep 1; xdg-open "$URL" >/dev/null 2>&1 || open "$URL" >/dev/null 2>&1 || true ) &
cd "$DIR" && python3 -m http.server "$PORT" --bind 127.0.0.1
