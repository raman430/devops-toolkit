# 🖥️ UNIX Cheatsheet (Senior/Lead DevOps Reference)
## 🗂️ Navigation & File Management

| Command                         | Description                                  |
|----------------------------------|----------------------------------------------|
| `pwd`                           | Show current directory                       |
| `ls -lh`                        | List files with details                      |
| `ls -ltr`                       | List files sorted by modification time       |
| `tree -L 2`                     | Directory tree (depth 2)                     |
| `cd /path/to/dir`               | Change directory                             |
| `cd -`                          | Go to previous directory                     |
| `mkdir -p dir/subdir`           | Create nested directories                    |
| `rm -rf /tmp/foo`               | Remove directory/file recursively            |
| `cp -r src/ dest/`              | Copy files/directories recursively           |
| `mv old new`                    | Rename/move file or directory                |
| `touch file.txt`                | Create empty file                            |
| `find . -name "*.log"`          | Find files by pattern                        |

---

## 📖 File Viewing & Editing

| Command                             | Description                           |
|--------------------------------------|---------------------------------------|
| `cat file.txt`                       | Show file contents                    |
| `less file.txt` / `more file.txt`    | View file with paging                 |
| `head -20 file.txt`                  | Show first 20 lines                   |
| `tail -50 file.txt`                  | Show last 50 lines                    |
| `tail -f /var/log/syslog`            | Live view of file growth              |
| `vi file.txt` / `nano file.txt`      | Edit file (vi/nano editors)           |

---

## 🛡️ Permissions & Ownership

| Command                             | Description                          |
|--------------------------------------|--------------------------------------|
| `ls -l`                             | Show permissions, ownership          |
| `chmod +x script.sh`                | Make file executable                 |
| `chmod 644 file.txt`                | Set read/write perms                 |
| `chown user:group file.txt`         | Change owner and group               |
| `umask`                             | Show/set default creation mask       |

---

## 🔎 Searching, Sorting & Text Processing

| Command                                        | Description                        |
|------------------------------------------------|------------------------------------|
| `grep -ir "pattern" .`                         | Recursive, case-insensitive search |
| `awk '{print $1, $4}' file.txt`                | Print columns                      |
| `sed 's/foo/bar/g' file.txt`                   | Replace in file                    |
| `cut -d: -f1 /etc/passwd`                      | Get field from delimited file      |
| `sort file.txt | uniq -c | sort -nr`           | Count and sort unique lines        |
| `wc -l file.txt`                               | Count lines                        |

---

## 📊 Process & System Monitoring

| Command                               | Description                        |
|----------------------------------------|------------------------------------|
| `top` / `htop`                        | Live process/system monitor        |
| `ps aux | grep nginx`                  | Find running processes             |
| `free -h`                             | RAM usage                          |
| `uptime`                              | System load and uptime             |
| `who`                                 | Who is logged in                   |
| `lsof -i :8080`                       | Who uses port 8080                 |
| `kill -9 <pid>`                       | Force kill process by PID          |

---

## 🌐 Networking & Connectivity

| Command                                    | Description                       |
|---------------------------------------------|-----------------------------------|
| `ifconfig` / `ip a`                        | Network interfaces                |
| `ping 8.8.8.8`                             | Test connectivity                 |
| `traceroute google.com`                    | Trace network path                |
| `ss -tuln` / `netstat -tuln`               | Show open ports                   |
| `curl -I https://site.com`                 | Get HTTP headers only             |
| `wget https://site.com/file.txt`           | Download file                     |
| `scp file user@host:/path/`                | Copy file over SSH                |
| `rsync -avz src/ user@host:/dst/`          | Sync folders                      |

---

## 💾 Disk Usage & Filesystem

| Command                            | Description                           |
|-------------------------------------|---------------------------------------|
| `df -h`                            | Disk space (human readable)           |
| `du -sh *`                         | Size of files/directories             |
| `ncdu`                             | Interactive disk usage                |
| `mount` / `umount`                 | List/mount/unmount filesystems        |
| `lsblk`                            | Block devices and partitions          |

---

## 🕒 Scheduling & Automation

| Command                     | Description                      |
|-----------------------------|----------------------------------|
| `crontab -e`                | Edit user's cron jobs            |
| `at 15:30`                  | Schedule job for specific time   |
| `systemctl list-timers`     | List systemd timers              |
| `nohup ./script.sh &`       | Run script detached              |

---

## 📦 Archive, Compress & Transfer

| Command                                 | Description                              |
|------------------------------------------|------------------------------------------|
| `tar czvf archive.tgz dir/`              | Create compressed tar archive            |
| `tar xzvf archive.tgz`                   | Extract tar archive                      |
| `gzip file.txt`                          | Compress file                            |
| `gunzip file.txt.gz`                     | Decompress file                          |
| `zip -r file.zip dir/`                   | Zip directory                            |
| `unzip file.zip`                         | Unzip                                    |

---

## 🚨 Troubleshooting & Rescue

| Command                                    | Description                             |
|---------------------------------------------|-----------------------------------------|
| `dmesg | tail -20`                         | Last kernel/system messages             |
| `journalctl -xe`                           | Systemd logs                            |
| `cat /var/log/syslog | grep -i error`      | Find errors in logs                     |
| `history`                                  | Command history                         |
| `which <command>`                          | Show command path                       |
| `man <command>` / `<command> --help`       | Documentation                           |

---

## 💡 Pro Tips, Best Practices, Gotchas

- **Always quote variables**: `"$VAR"` to prevent word splitting.
- **Use `-i` with destructive commands**: (e.g., `rm -ri`) for interactive safety.
- **Store important aliases/functions** in `.bashrc`/`.profile` for re-use.
- **Absolute paths in scripts**: More reliable, especially for cron/automation.
- **Review `man` pages** for full options and usage examples.
- **Use `set -euo pipefail`** in scripts for better error handling.
- **Double-check `rm -rf` commands** to avoid accidents!

---

## ✅ Quick Wins Checklist

| Task                              | Command Example                         |
|------------------------------------|-----------------------------------------|
| List directory and sizes           | `ls -lh` / `du -sh *`                   |
| Search logs for errors             | `grep -i error /var/log/syslog`         |
| Show running processes             | `ps aux` / `top`                        |
| Check disk usage                   | `df -h`                                 |
| Find open ports                    | `ss -tuln`                              |
| Find big files                     | `du -ahx . | sort -rh | head -20`       |
| Kill runaway process               | `kill -9 <pid>`                         |
| Schedule a script                  | `crontab -e`                            |
| Copy files to server               | `scp file user@host:/path/`             |

---
