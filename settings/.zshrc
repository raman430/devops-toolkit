# ⚡️ .zshrc Cheatsheet (Senior/Lead DevOps Reference)



## 📝 Overview & Sourcing

| Command/Pattern           | Description                                   |
|---------------------------|-----------------------------------------------|
| `source ~/.zshrc`         | Reload `.zshrc` without restarting terminal   |
| `echo $SHELL`             | Show current shell                            |
| `echo $ZSH_VERSION`       | Show Zsh version                              |
| `which zsh`               | Path to zsh executable                        |

- **Pro Tip:** Make Zsh your default shell: `chsh -s $(which zsh)`

---

## 🔗 Aliases & Functions

| Pattern/Example                                 | Description                       |
|-------------------------------------------------|-----------------------------------|
| `alias gs='git status'`                         | Quick alias for `git status`      |
| `alias ll='ls -lhAF --color=auto'`              | Detailed, colored list            |
| `unalias ll`                                    | Remove alias                      |
|<pre>
myip() {
  curl -s ifconfig.me
}
</pre>                                           | Simple custom function            |

- **Pro Tip:**  
  Put all aliases/functions in `.zshrc` or source from a separate file:  
  `source ~/.zsh_aliases`

---

## 🎨 Prompt Customization (PS1, Themes)

| Pattern/Variable                        | Description                        |
|------------------------------------------|------------------------------------|
| `export PS1="%n@%m:%~ %# "`              | Minimal prompt (user@host:path)    |
| `ZSH_THEME="agnoster"`                   | Use Agnoster theme (Oh My Zsh)     |
| `POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=...`  | Powerlevel9k theme elements        |

- **Best Practice:**  
  Use [Oh My Zsh](https://ohmyz.sh/) or [Prezto](https://github.com/sorin-ionescu/prezto) for instant prompt theming and plugin management.

---

## 🛣️ Path & Environment Variables

| Pattern/Command                                   | Description                        |
|---------------------------------------------------|------------------------------------|
| `export PATH="$HOME/bin:$PATH"`                   | Add custom bin to `PATH`           |
| `export EDITOR=vim`                               | Set default editor                 |
| `export AWS_PROFILE=dev`                          | Set default AWS CLI profile        |
| `export KUBECONFIG=~/.kube/config`                | Point to kubeconfig                |
| `export HISTSIZE=10000`                           | Bash/Zsh history size              |

---

## 🚀 Plugin Management (Oh My Zsh, zinit, etc.)

| Command/Pattern                                   | Description                        |
|---------------------------------------------------|------------------------------------|
| `plugins=(git docker kubectl zsh-autosuggestions)`| Enable Zsh plugins (Oh My Zsh)     |
| `source $ZSH/oh-my-zsh.sh`                        | Load Oh My Zsh                     |
| `zinit light zsh-users/zsh-autosuggestions`       | Add plugin via zinit                |
| `antigen bundle ...`                              | For [antigen](https://github.com/zsh-users/antigen) |

- **Pro Tip:**  
  Keep plugins minimal for speed—only load what you use!

---

## 🧠 Completion, History & Options

| Pattern/Command                               | Description                                   |
|-----------------------------------------------|-----------------------------------------------|
| `autoload -Uz compinit && compinit`           | Enable completion                             |
| `setopt AUTO_CD`                              | `cd` by just typing directory name            |
| `setopt HIST_IGNORE_DUPS`                     | Ignore duplicate history entries              |
| `setopt SHARE_HISTORY`                        | Share history across sessions                 |
| `HISTFILE=~/.zsh_history`                     | Set history file                              |
| `HISTSIZE=10000`                              | Number of lines in memory                     |
| `SAVEHIST=10000`                              | Number of history lines to save               |

---

## ⌨️ Keybindings & Productivity Shortcuts

| Shortcut           | Description                              |
|--------------------|------------------------------------------|
| `Ctrl+R`           | Reverse search through command history   |
| `Ctrl+A`/`Ctrl+E`  | Start/end of line                        |
| `Alt+.`            | Last argument of previous command        |
| `Ctrl+U`/`Ctrl+K`  | Delete from start/cursor to end          |
| `Ctrl+W`           | Delete previous word                     |
| `Ctrl+L`           | Clear screen                             |
| `!!`               | Repeat previous command                  |
| `sudo !!`          | Repeat previous command with sudo        |

---

## 🩺 Troubleshooting & Debug

| Pattern/Command                               | Description                           |
|-----------------------------------------------|---------------------------------------|
| `zsh -x`                                     | Start Zsh in debug/trace mode         |
| `echo $PATH`                                 | Show effective `PATH`                 |
| `alias`                                      | List all aliases                      |
| `functions`                                  | List all functions                    |
| `printenv` / `env`                           | Show all environment variables        |
| `which <command>`                            | Path to executable                    |
| `exec zsh`                                   | Restart shell with new config         |

---

## 💡 Pro Tips, Best Practices, Gotchas

- **Source `.zshrc` after every edit:** `source ~/.zshrc`
- **Back up `.zshrc` and plugins before upgrades.**
- **For complex customizations, modularize:**  
  Split into `.zshrc`, `.zsh_aliases`, `.zsh_functions`, etc.
- **Keep history safe:**  
  Set a large `HISTSIZE` and regularly back up `~/.zsh_history`.
- **Be careful with `alias rm='rm -i'`:**  
  Can interfere with scripts expecting standard `rm` behavior.
- **Use tools like [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)` and [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)` for productivity.

---

## ✅ Quick Wins Checklist

| Task                        | Pattern/Example                                           |
|-----------------------------|----------------------------------------------------------|
| Reload `.zshrc`             | `source ~/.zshrc`                                        |
| Add git plugin (Oh My Zsh)  | `plugins=(git)` in `.zshrc`                              |
| Custom alias                | `alias gs='git status'`                                  |
| Set prompt                  | `export PS1="%n@%m:%~ %# "`                              |
| Enable completion           | `autoload -Uz compinit && compinit`                      |
| Search command history      | `Ctrl+R`                                                 |
| Change shell to Zsh         | `chsh -s $(which zsh)`                                   |
| List all plugins            | `echo $plugins` (Oh My Zsh)                              |

---
