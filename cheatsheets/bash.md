# 🐧 Bash Cheatsheet (Senior/Lead DevOps Reference)

## 🗂️ Navigation & File Operations

| Command                       | Description                                  |
|-------------------------------|----------------------------------------------|
| `pwd`                         | Print current working directory              |
| `ls -lh`                      | List files (long, human-readable)            |
| `ls -ltr`                     | List files, sorted by modified time          |
| `tree -L 2`                   | Directory tree (2 levels deep)               |
| `cd -`                        | Switch to previous directory                 |
| `du -sh *`                    | Disk usage summary for each file/folder      |
| `df -h`                       | Disk free space (human-readable)             |
| `find . -name "*.log"`        | Find files recursively by pattern            |
| `rm -rf <dir>`                | Remove directory and all contents            |
| `cp -r <src> <dst>`           | Copy files/directories recursively           |
| `mv <src> <dst>`              | Move/rename files and directories            |
| `touch <file>`                | Create empty file                            |
| `mkdir -p <dir>/subdir`       | Create nested directories                    |

---

## 📝 Text Search, Processing & Manipulation

| Command                                  | Description                                 |
|-------------------------------------------|---------------------------------------------|
| `cat file.txt`                           | Display contents of a file                  |
| `less file.txt`                          | View file with paging (q to quit)           |
| `head -20 file.txt`                      | First 20 lines                              |
| `tail -50 file.txt`                      | Last 50 lines                               |
| `tail -f /var/log/syslog`                | Follow logs in real time                    |
| `grep -ir "pattern" .`                   | Recursive, case-insensitive search          |
| `awk '{print $1, $2}' file.txt`          | Print first and second columns              |
| `sed 's/foo/bar/g' file.txt`             | Replace 'foo' with 'bar' everywhere         |
| `cut -d: -f1 /etc/passwd`                | Extract first field with ':' delimiter      |
| `sort | uniq -c | sort -nr`              | Count and sort unique lines                 |
| `wc -l <file>`                           | Count lines in a file                       |

**Pro Tip:**  
Combine commands with pipes (`|`) for complex workflows.

---

## 🛡️ Permissions & Ownership

| Command                       | Description                             |
|-------------------------------|-----------------------------------------|
| `chmod +x script.sh`          | Make file executable                    |
| `chown user:group file`       | Change file owner and group             |
| `ls -l`                       | Show permissions, ownership, size, date |

---

## 📈 Process & System Monitoring

| Command                        | Description                               |
|---------------------------------|-------------------------------------------|
| `top` / `htop`                  | Interactive process/system monitor        |
| `ps aux | grep nginx`           | List processes matching 'nginx'           |
| `free -h`                       | Show RAM usage                            |
| `uptime`                        | System load and uptime                    |
| `who`                           | Who is logged in                          |
| `lsof -i :8080`                 | What process is using port 8080?          |
| `df -h`                         | Disk space usage                          |
| `watch -n 2 'ls -l /tmp'`       | Repeat command every 2 seconds            |
| `kill -9 <pid>`                 | Force kill process by PID                 |
| `pgrep <name>`                  | Get PIDs by process name                  |

---

## 🌐 Networking Commands

| Command                                 | Description                         |
|------------------------------------------|-------------------------------------|
| `ip a` / `ifconfig`                      | Show network interfaces             |
| `ping 8.8.8.8`                           | Test connectivity                   |
| `traceroute google.com`                  | Trace route to host                 |
| `ss -tuln` / `netstat -tuln`             | Show open TCP/UDP ports             |
| `nc -zv host 80-90`                      | Test open ports with netcat         |
| `curl -I https://site.com`               | Get HTTP headers only               |
| `wget https://site.com/file.txt`         | Download file                       |
| `scp file user@host:/path/`              | Secure copy to/from remote host     |
| `rsync -avz src/ dest/`                  | Sync folders (local or remote)      |

---

## ⚙️ Scripting, Automation & Functions

| Command/Snippet                                | Description                           |
|------------------------------------------------|---------------------------------------|
| `crontab -e`                                   | Edit scheduled (cron) jobs            |
| `bash script.sh`                               | Run bash script                       |
| `for f in *.log; do echo $f; done`             | Loop over files                       |
| `find . -type f -exec grep ERROR {} \;`        | Run command on found files            |
| `function hi() { echo "Hello $1!"; }`          | Define a simple bash function         |
| `export VAR=value`                             | Set env var for current session       |
| `alias gs='git status'`                        | Create shell alias (add to .bashrc)   |

**Best Practice:**  
- Store all your aliases and custom functions in your `.bashrc` or `.zshrc`.

---

## 🖥️ Environment, Configs & Session Management

| Command                        | Description                          |
|---------------------------------|--------------------------------------|
| `source ~/.bashrc`              | Reload current shell config          |
| `history`                       | Show command history                 |
| `history | grep ssh`            | Search history for 'ssh' commands    |
| `export PS1="\u@\h:\w $ "`      | Customize shell prompt               |
| `set -euo pipefail`             | Safer script execution               |

---

## 🚑 Troubleshooting & Rescue

| Command/Pattern                                 | Description                               |
|-------------------------------------------------|-------------------------------------------|
| `which <cmd>`                                   | Show path to command                      |
| `man <cmd>` / `<cmd> --help`                    | Command documentation                     |
| `echo $?`                                       | Exit code of last command                 |
| `dmesg | tail -20`                              | Recent kernel/system messages             |
| `journalctl -xe`                                | Systemd logs (modern systems)             |
| `cat /var/log/syslog | grep -i error`           | Find errors in logs                       |
| `ulimit -a`                                     | Show resource limits                      |

---

## ⌨️ Keyboard Shortcuts & Productivity

| Shortcut           | Description                              |
|--------------------|------------------------------------------|
| `Ctrl+R`           | Reverse search command history           |
| `Ctrl+A / Ctrl+E`  | Move to line start/end                   |
| `Ctrl+U / Ctrl+K`  | Delete to start/end of line              |
| `Ctrl+W`           | Delete previous word                     |
| `Alt+.`            | Last argument from previous command      |
| `!!`               | Repeat last command                      |
| `sudo !!`          | Repeat last command with sudo            |
| `Ctrl+L`           | Clear screen                             |

---

## 💡 Pro Tips, Best Practices, Gotchas

- **Combine commands:** Use `&&` (next only if success) and `||` (next only if fail), e.g.  
  `make build && make test || echo "Tests failed"`
- **Use quotes wisely:**  
  Double quotes `"var=$VAL"` expand variables, single quotes don't.
- **Safer scripting:**  
  Always use `set -euo pipefail` at the top of scripts.
- **Absolute paths:**  
  Use absolute paths in scripts for reliability.
- **Shellcheck:**  
  Use [`shellcheck`](https://www.shellcheck.net/) to lint your scripts.
- **Avoid `rm -rf /` mistakes:**  
  Use `--preserve-root` and always double-check your commands.

---

## ✅ Quick Wins Checklist

| Task                                | Command Example                                    |
|--------------------------------------|----------------------------------------------------|
| See disk and RAM usage               | `df -h`, `free -h`                                 |
| Find big files                       | `du -sh * | sort -hr | head -20`                  |
| Search logs for errors               | `grep -i error /var/log/syslog`                    |
| Tail logs live                       | `tail -f /var/log/syslog`                          |
| Kill a runaway process               | `ps aux | grep <name>`, `kill -9 <pid>`            |
| Check listening ports                | `ss -tuln`                                         |
| Sync code to server                  | `rsync -avz ./ user@host:/path/`                   |
| Schedule a script                    | `crontab -e`                                       |
| Reverse-search old command           | `Ctrl+R`                                           |

---
