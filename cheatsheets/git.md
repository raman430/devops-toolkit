# 🚀 Git Cheatsheet (Senior/Lead DevOps Reference)

## 🗂️ Repository Navigation & Configuration

| Command                                 | Description                              |
|------------------------------------------|------------------------------------------|
| `git --version`                         | Show installed Git version               |
| `git config --global user.name "Name"`  | Set global username                      |
| `git config --global user.email ...`    | Set global email                         |
| `git config -l`                         | List all config                          |
| `git init`                              | Initialize a new repository              |
| `git clone <url>`                       | Clone a repository                       |
| `git status`                            | Show working tree status                 |

---

## 📅 Everyday Commands & Best Practices

| Command                                     | Description                        |
|----------------------------------------------|------------------------------------|
| `git add <file>` / `git add .`              | Stage changes                      |
| `git commit -m "message"`                    | Commit staged changes              |
| `git push [origin] <branch>`                | Push to remote branch              |
| `git pull --rebase`                         | Pull and rebase                    |
| `git fetch`                                 | Update remote refs                 |
| `git diff`                                  | Show unstaged changes              |
| `git log --oneline --graph --decorate`      | Visualize commit graph             |

**Best Practice:**  
- Write clear commit messages.  
- Commit often; keep commits small and focused.

---

## 🌱 Branching & Merging

| Command                                      | Description                           |
|-----------------------------------------------|---------------------------------------|
| `git branch`                                 | List branches                         |
| `git branch <name>`                          | Create new branch                     |
| `git checkout <branch>`                      | Switch to branch                      |
| `git checkout -b <name>`                     | Create and switch to new branch       |
| `git merge <branch>`                         | Merge into current branch             |
| `git merge --no-ff <branch>`                 | No fast-forward merge                 |
| `git branch -d <branch>`                     | Delete local branch                   |
| `git branch -r`                              | List remote branches                  |

---

## 🔄 Rebasing, Cherry-picking & Rescue

| Command                                          | Description                                   |
|--------------------------------------------------|-----------------------------------------------|
| `git rebase <branch>`                            | Rebase current branch onto another            |
| `git rebase -i <base>`                           | Interactive rebase (edit, squash, reorder)    |
| `git cherry-pick <commit>`                       | Apply specific commit(s)                      |
| `git reflog`                                     | Show all recent HEAD moves (recovery gold!)   |
| `git reset --hard HEAD~1`                        | Reset to previous commit, discarding changes  |
| `git revert <commit>`                            | Revert a commit (creates new commit)          |

**Gotcha:**  
- Rebasing rewrites history—**never rebase shared branches**!

---

## 📜 Diff, Log, and Blame

| Command                                       | Description                               |
|-----------------------------------------------|-------------------------------------------|
| `git diff [<base>..<target>]`                 | Show differences between refs             |
| `git log --oneline --graph --all`             | Visualize entire branch graph             |
| `git show <commit>`                           | Show details for a specific commit        |
| `git blame <file>`                            | Show who last modified each line          |
| `git shortlog -sn`                            | Summary of commits by author              |

---

## 🛠️ Stash & Clean

| Command                             | Description                            |
|--------------------------------------|----------------------------------------|
| `git stash`                         | Save changes not yet staged/committed  |
| `git stash pop`                     | Apply and remove latest stash          |
| `git stash list`                    | List all stashes                       |
| `git clean -fd`                     | Remove untracked files and directories |
| `git stash branch <name>`           | Create new branch from stash           |

---

## 🌐 Remotes & Collaboration

| Command                                       | Description                              |
|------------------------------------------------|------------------------------------------|
| `git remote -v`                               | List remote repos                        |
| `git remote add <name> <url>`                 | Add a new remote                         |
| `git fetch <remote>`                          | Fetch from remote                        |
| `git push origin :<branch>`                   | Delete remote branch                     |
| `git pull --rebase origin <branch>`           | Pull with rebase                         |

---

## 🔖 Tagging & Release Management

| Command                                        | Description                            |
|------------------------------------------------|----------------------------------------|
| `git tag`                                      | List tags                              |
| `git tag <tagname>`                            | Create lightweight tag                 |
| `git tag -a <tagname> -m "msg"`                | Annotated tag with message             |
| `git push origin <tagname>`                    | Push tag to remote                     |
| `git push origin --tags`                       | Push all tags to remote                |
| `git checkout <tagname>`                       | Checkout a tag (detached HEAD)         |

---

## ❗ Troubleshooting & Recovery

| Command                                         | Description                                     |
|-------------------------------------------------|-------------------------------------------------|
| `git reflog`                                    | View HEAD history (undo any move/reset!)        |
| `git fsck`                                      | Validate repo integrity                         |
| `git gc`                                        | Cleanup unnecessary files and optimize repo     |
| `git bisect start/bad/good`                     | Binary search to find breaking commit           |
| `git merge --abort`                             | Abort an in-progress merge                      |
| `git rebase --abort`                            | Abort an in-progress rebase                     |
| `git reset --merge`                             | Reset and preserve uncommitted changes          |

**Pro Tip:**  
- **Always check** `git status` and `git log` before any destructive action.
- Use `git reflog` for almost any “oh no!” recovery.

---

## 🦾 Pro Tips, Best Practices, Gotchas

- **Keep main branches (main/master, develop) always deployable.**
- Use **feature branches** for all work; merge via pull requests/MRs.
- **Squash commits** on merge for a clean history.
- **Never force push to shared branches** (`git push --force-with-lease` if you must).
- Prefer `git pull --rebase` to avoid unnecessary merge commits.
- Use `.gitignore` for all non-source, temp, or secret files.
- Store `.gitattributes` for consistent line endings and file types across teams.
- Set up **pre-commit hooks** (e.g., lint, test) for quality gates.
- **Clone with depth:** `git clone --depth=1 <repo>` for CI or large repos.

---

## ✅ Quick Wins Checklist

| Action                           | Command Example                                  |
|-----------------------------------|--------------------------------------------------|
| Stage & commit                    | `git add . && git commit -m "message"`           |
| Create & switch branch            | `git checkout -b feature/my-feature`             |
| Sync with remote                  | `git fetch && git pull --rebase`                 |
| Undo a local commit               | `git reset --soft HEAD~1`                        |
| See all branches/graph            | `git log --oneline --graph --all`                |
| Recover from disaster             | `git reflog`                                     |
| Stash & restore local changes     | `git stash && git stash pop`                     |
| Find who changed a line           | `git blame <file>`                               |

---
