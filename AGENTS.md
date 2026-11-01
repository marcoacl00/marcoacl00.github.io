# AGENTS.md — instructions for AI agents

Read this whole file before doing anything in this repository.

## 1. Get context first

1. Find and read **`PROJECT.md`** — how the project is structured.
2. Find and read **`UPDATES.md`** — what has changed, what is pending on branch `a`, and what was reverted.
3. Only then plan and make changes. Keep `PROJECT.md` up to date whenever you change the structure
   (new files, new conventions, moved sections).

## 2. Rules

> These rules are maintained by the repository owner and may change over time.
> Always follow the current version of this file.

### 2.1 Branches
- Work **only on branch `a`**. If it does not exist, create it from `main`. Never commit to `main` directly.
- You may **commit to `a` without asking**. Commit messages should be short and descriptive.
- Do not push to any remote unless the owner explicitly asks.

### 2.2 Merging into `main`
- A merge into `main` happens **only when the owner orders it**.
- When asked to merge, first reply with exactly: **"Are you sure you want to merge?"** and wait.
  Merge only after an explicit confirmation.
- Merge procedure (after confirmation):
  1. On branch `a`, rewrite `UPDATES.md`: replace all pending (unmerged) entries — which may have
     different dates — with **one single entry** dated with the date and hour of the merge.
     It contains every pending modification **except the reverted ones**, renumbered from 1.
     Its heading is `## [YYYY-MM-DD HH:MM] (merged into main)` — this marker separates merged
     history from pending entries.
     Older, already-merged entries stay untouched below it.
  2. Commit that on `a`, then merge `a` into `main` (`git checkout main && git merge a`), and switch back to `a`.
  3. `main` and `a` now share the same consolidated `UPDATES.md`.

### 2.3 Logging changes in `UPDATES.md`
- Every individual modification must be logged, together with its **practical impact**
  (what a visitor or the owner will notice).
- Each work session/batch is one entry, newest entry at the top, in this format:

  ```
  ## [YYYY-MM-DD HH:MM]
  1. <modification> — Impact: <practical impact>
  2. <modification> — Impact: <practical impact>
  ```

- Numbering is **continuous across all pending entries** (since the last merge), so every pending
  modification has a unique number the owner can refer to. After a merge, the next entry starts again at 1.
- Use the local date and hour (`date "+%Y-%m-%d %H:%M"`).

### 2.4 Reverting
- The owner may ask to revert one or more numbered modifications.
- Undo them in the code and commit on `a`.
- Do **not** delete them from `UPDATES.md`. Strike them through and add a note, e.g.:

  ```
  3. ~~Added a News section — Impact: ...~~ **(reverted YYYY-MM-DD HH:MM)**
  ```

- Reverted items are only dropped from the log when the next merge into `main` consolidates the entries.

### 2.5 After an update

- Run "preview.sh" immediately after proposing your changes, so that the owner sees the website right away.
Keep it running until the owner closes the tab on the browser.

### 2.6 Markdown files are git-ignored

- Except for `README.md`, every `.md` file — `AGENTS.md`, `PROJECT.md`, `UPDATES.md`, `CLAUDE.md`,
  and any other `.md` file — is listed in `.gitignore` and untracked. They are not staged, not
  committed, and not part of what `main` publishes.
- They still live on disk and must still be read, kept up to date, and logged exactly as described
  in sections 1, 2.3 and 2.4. "Git-ignored" only means `git status`/`git diff`/`git log` won't show
  them; edit them normally, just don't expect `git add`/`git commit` to pick them up.
- A fresh clone of this repository will **not** include them (git history has nothing to restore
  them from). If one is missing locally, recreate it before proceeding.