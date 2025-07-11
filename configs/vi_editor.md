# 📝 vi Editor Cheatsheet (Senior/Lead DevOps Reference)

## 🚦 Modes & Navigation

| Command              | Description                           |
|----------------------|---------------------------------------|
| `i`, `I`             | Insert mode (before/at line start)    |
| `a`, `A`             | Append (after/at end of line)         |
| `Esc`                | Return to normal mode                 |
| `:w`                 | Command mode (save, etc.)             |
| `h`, `j`, `k`, `l`   | Move left, down, up, right            |
| `gg`, `G`            | First line, last line                 |
| `w`, `b`, `e`        | Next word, previous word, end of word |
| `0`, `^`, `$`        | Start, first non-blank, end of line   |
| `Ctrl+u`, `Ctrl+d`   | Up/down half a page                   |
| `zz`                 | Center current line                   |

---

## ✏️ Basic Editing & Insertion

| Command      | Description                               |
|--------------|-------------------------------------------|
| `i`          | Insert before cursor                      |
| `a`          | Insert after cursor                       |
| `o` / `O`    | Open new line below / above               |
| `r <char>`   | Replace single character                  |
| `R`          | Enter replace mode                        |
| `u`          | Undo last change                          |
| `U`          | Restore line                              |
| `.`          | Repeat last change                        |
| `x`, `X`     | Delete character under/before cursor      |
| `dd`         | Delete (cut) current line                 |
| `yy`         | Yank (copy) current line                  |
| `p`, `P`     | Paste after / before cursor               |

---

## 💾 Saving, Quitting & File Operations

| Command           | Description                          |
|-------------------|--------------------------------------|
| `:w`              | Write (save) file                    |
| `:w filename`     | Save as new filename                 |
| `:wq` or `ZZ`     | Write and quit                       |
| `:x`              | Write (if changed) and quit          |
| `:q`              | Quit (will fail if unsaved changes)  |
| `:q!`             | Quit, discard changes                |
| `:e!`             | Reload file, discard local changes   |
| `:r file`         | Read/insert another file             |
| `:!cmd`           | Run shell command                    |

---

## ✂️ Copy, Cut, Paste & Undo

| Command              | Description                                |
|----------------------|--------------------------------------------|
| `yy` / `Y`           | Yank (copy) current line                   |
| `p` / `P`            | Paste after / before cursor                |
| `dd`                 | Delete (cut) current line                  |
| `d$`, `d0`, `d^`     | Delete to end, start, or first char in line|
| `x`, `dw`            | Delete character, delete word              |
| `u`                  | Undo                                       |
| `Ctrl+r`             | Redo                                       |

---

## 🔍 Search, Replace & Advanced Patterns

| Command                       | Description                               |
|-------------------------------|-------------------------------------------|
| `/pattern`                    | Search forward for pattern                |
| `?pattern`                    | Search backward for pattern               |
| `n` / `N`                     | Next/previous search match                |
| `:%s/old/new/g`               | Replace all in file                       |
| `:s/old/new/g`                | Replace all in current line               |
| `:%s/foo/bar/gc`              | Replace all with confirmation             |
| `*` / `#`                     | Search word under cursor forward/backward |
| `:noh`                        | Turn off search highlighting              |

---

## 📋 Line Operations, Marks & Buffers

| Command                  | Description                               |
|--------------------------|-------------------------------------------|
| `:set number`            | Show line numbers                         |
| `:set nonumber`          | Hide line numbers                         |
| `:n`                     | Go to line n (`nG` also works)            |
| `ma`                     | Set mark 'a' at current position          |
| `'a`                     | Jump to mark 'a'                          |
| `:reg`                   | List registers/buffers                    |
| `"ayy`, `"ap`            | Yank/copy and paste to/from register 'a'  |

---

## 🖥️ Multi-file & Split Windows

| Command             | Description                         |
|---------------------|-------------------------------------|
| `:e file`           | Open file in current window         |
| `:vsp file`         | Vertical split with another file    |
| `:sp file`          | Horizontal split with another file  |
| `Ctrl+w, [h/j/k/l]` | Move between splits                 |
| `:tabnew file`      | Open new file in a tab              |
| `gt`, `gT`          | Next / previous tab                 |
| `:bn`, `:bp`        | Next / previous buffer              |
| `:ls`               | List open buffers                   |
| `:b <n>`            | Switch to buffer number n           |

---

## 💡 Pro Tips, Best Practices, Gotchas

- **Use Visual mode (`v`, `V`, `Ctrl+v`)** for block and multi-line operations.
- **Record macros with `q<register>...q`** and replay with `@<register>`.
- **Use `:w !sudo tee %`** to save files that require sudo (when you forgot to open vi as root).
- **:set expandtab tabstop=4 shiftwidth=4** for spaces instead of tabs (common DevOps style).
- **:syntax on** for syntax highlighting (add to your `.vimrc`).
- **.vimrc best practices:** Set line numbers, syntax, search, clipboard integration, auto-indentation, etc.
- **Gotcha:**  
  - **Don’t exit with unsaved changes**—use `:wq` or `:q!` carefully!

---

## ✅ Quick Wins Checklist

| Task                           | Command(s)                               |
|--------------------------------|------------------------------------------|
| Open file                      | `vi filename`                            |
| Save & quit                    | `:wq` or `ZZ`                            |
| Quit without saving            | `:q!`                                    |
| Search for text                | `/pattern`                               |
| Replace in file                | `:%s/old/new/g`                          |
| Show line numbers              | `:set number`                            |
| Go to line n                   | `:n` or `nG`                             |
| Undo/Redo                      | `u` / `Ctrl+r`                           |
| Yank/copy & paste              | `yy`, `dd`, `p`                          |
| Split window                   | `:vsp file` or `:sp file`                |
| Save with sudo                 | `:w !sudo tee %`                         |

