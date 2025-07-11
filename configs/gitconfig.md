# ⚙️ GitConfig Cheatsheet (Senior/Lead DevOps Reference)

---

## Table of Contents

- [Basic User Setup](#basic-user-setup)
- [Core Behaviors & Formatting](#core-behaviors--formatting)
- [Aliases for Productivity](#aliases-for-productivity)
- [Diff, Merge, and Color](#diff-merge-and-color)
- [Credential & Security Management](#credential--security-management)
- [Signing & GPG](#signing--gpg)
- [Hooks & Automation](#hooks--automation)
- [Pro Tips, Best Practices, Gotchas](#pro-tips-best-practices-gotchas)
- [Quick Wins Checklist](#quick-wins-checklist)
- [References & Tools](#references--tools)

---

## 🧑‍💻 Basic User Setup

| Command                                              | Description                          |
|------------------------------------------------------|--------------------------------------|
| `git config --global user.name "Alice Smith"`        | Set global username                  |
| `git config --global user.email "alice@email.com"`   | Set global email                     |
| `git config --global --edit`                         | Open global config in editor         |
| `git config --local --edit`                          | Edit config for current repo         |
| `git config --list --show-origin`                    | List all configs, show file sources  |

**Typical ~/.gitconfig snippet:**
```ini
[user]
    name = Alice Smith
    email = alice@email.com

# ⚙️ GitConfig Cheatsheet: Core Patterns & Reference

---

## ⚙️ Core Behaviors & Formatting

| Setting/Command                                        | Description                                 |
|--------------------------------------------------------|---------------------------------------------|
| `git config --global core.editor "code --wait"`        | Set VSCode as default editor                |
| `git config --global core.autocrlf input`              | Normalize line endings for Unix/Mac         |
| `git config --global core.autocrlf true`               | Normalize line endings for Windows          |
| `git config --global init.defaultBranch main`          | Default branch is "main" on `git init`      |
| `git config --global pull.rebase true`                 | Prefer rebase over merge for pull           |
| `git config --global merge.ff false`                   | Never fast-forward merges                   |
| `git config --global fetch.prune true`                 | Auto-remove remote-tracking deleted refs    |
| `git config --global core.pager "less -FXRS"`          | Better paging for logs/diffs                |

---

## 🚀 Aliases for Productivity

| Alias Command                                             | Expands to / Description                  |
|-----------------------------------------------------------|-------------------------------------------|
| `git config --global alias.st status`                     | `git st` for status                       |
| `git config --global alias.co checkout`                   | `git co` for checkout                     |
| `git config --global alias.br branch`                     | `git br` for branch                       |
| `git config --global alias.ci commit`                     | `git ci` for commit                       |
| `git config --global alias.lg "log --oneline --graph --all"` | `git lg` for log graph                |
| `git config --global alias.last "log -1 HEAD"`            | `git last` for last commit                |
| `git config --global alias.unstage "reset HEAD --"`       | Unstage file(s)                           |
| `git config --global alias.squash "!git rebase -i $(git merge-base main HEAD)"` | Interactive squash to main |

**Example block for `.gitconfig`:**
```ini
[alias]
    st = status
    co = checkout
    br = branch
    ci = commit
    lg = log --oneline --graph --all
    last = log -1 HEAD
    unstage = reset HEAD --
    squash = !git rebase -i $(git merge-base main HEAD)

## 📝 Diff, Merge, and Color

| Command/Setting                                   | Description                             |
|---------------------------------------------------|-----------------------------------------|
| `git config --global color.ui auto`               | Enable color in CLI output              |
| `git config --global diff.tool meld`              | Set Meld as diff tool                   |
| `git config --global merge.tool meld`             | Set Meld as merge tool                  |
| `git config --global difftool.prompt false`       | Don't prompt for each diff file         |
| `git config --global mergetool.keepBackup false`  | Don't keep backup after merge           |
| `git config --global diff.renames true`           | Track file renames in diffs             |

---

## 🔒 Credential & Security Management

| Command/Setting                                        | Description                                       |
|--------------------------------------------------------|---------------------------------------------------|
| `git config --global credential.helper cache`          | Cache credentials temporarily                     |
| `git config --global credential.helper store`          | Store credentials (plain text, not for prod!)     |
| `git config --global credential.helper 'osxkeychain'`  | Use Keychain on MacOS                             |
| `git config --global credential.helper 'manager-core'` | Use Windows Credential Manager                    |
| `git config --global credential.useHttpPath true`      | Differentiate credentials by URL path             |

**Gotcha:**  
- Avoid storing credentials in plain text with the `store` helper for security reasons!

---

## ✍️ Signing & GPG

| Command/Setting                                   | Description                                    |
|---------------------------------------------------|------------------------------------------------|
| `git config --global user.signingkey <key>`       | Set GPG key for signing commits/tags           |
| `git config --global commit.gpgsign true`         | Sign all commits by default                    |
| `git config --global tag.gpgsign true`            | Sign tags by default                           |
| `git config --global gpg.program gpg`             | Set GPG program                                |

**Example block:**
```ini
[commit]
    gpgsign = true
[user]
    signingkey = 0A46826A
[gpg]
    program = gpg

## ✅ Quick Wins Checklist

| Task                      | Command / Setting                                                                 |
|---------------------------|-----------------------------------------------------------------------------------|
| Set name and email        | `git config --global user.name "Alice"`<br>`git config --global user.email "alice@email.com"` |
| Use VSCode as editor      | `git config --global core.editor "code --wait"`                                   |
| Default branch as main    | `git config --global init.defaultBranch main`                                     |
| Enable useful aliases     | See "Aliases" section above                                                       |
| Sign all commits          | `git config --global commit.gpgsign true`                                         |
| List config origins       | `git config --list --show-origin`                                                 |
| Set merge/diff tools      | `git config --global diff.tool meld`<br>`git config --global merge.tool meld`     |
| Use secure credential helper | `git config --global credential.helper cache`                                  |

---
