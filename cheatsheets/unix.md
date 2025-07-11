# 🐧 Linux & Networking: Senior DevOps/SRE Admin Cheatsheet

_A comprehensive, production-ready reference for DevOps, SRE, Platform, and AWS/Linux admins._

---

## Table of Contents

- [System Navigation & File Operations](#system-navigation--file-operations)
- [Filesystem Management](#filesystem-management)
- [Process & Resource Management](#process--resource-management)
- [Networking Essentials](#networking-essentials)
- [System Security & Hardening](#system-security--hardening)
- [Monitoring, Logging & Performance](#monitoring-logging--performance)
- [Package Management & System Update](#package-management--system-update)
- [User & Group Management](#user--group-management)
- [Scheduling & Automation (cron, at, systemd)](#scheduling--automation-cron-at-systemd)
- [AWK, SED & FIND Mastery](#awk-sed--find-mastery)
- [Interesting Tricks & Advanced Patterns](#interesting-tricks--advanced-patterns)
- [Pro Tips, Gotchas, Best Practices](#pro-tips-gotchas-best-practices)
- [Quick Wins & Checklist](#quick-wins--checklist)
- [References](#references)

---

## 🗂️ System Navigation & File Operations

| Command                                | Description                                 |
|-----------------------------------------|---------------------------------------------|
| `ls -lh --color=auto`                   | List with sizes, human-readable, colored    |
| `tree -L 2`                             | Directory tree (2 levels deep)              |
| `cd /path/to/dir`                       | Change directory                            |
| `pwd`                                   | Print working directory                     |
| `du -sh *`                              | Dir/file disk usage summary                 |
| `df -hT`                                | Disk free, human/typed                      |
| `find . -name '*.log'`                  | Find files recursively                      |
| `stat file.txt`                         | File info (ownership, perms, size, mtime)   |
| `ln -s target linkname`                  | Create symbolic link                        |
| `cp -a src/ dest/`                      | Archive copy (preserves permissions)        |
| `rsync -avz --progress src/ dest/`      | Fast, resumable, mirrored copy/sync         |
| `ncdu /`                                | Visual disk usage explorer                  |
| `touch file.txt`                        | Create/refresh empty file                   |

---

## 💽 Filesystem Management

| Command                            | Description                              |
|-------------------------------------|------------------------------------------|
| `mount | column -t`                 | Show all mounted filesystems             |
| `lsblk -f`                          | Block devices with filesystem info       |
| `df -ih`                            | Show inode usage                         |
| `sudo fdisk -l`                     | List disk partitions                     |
| `sudo mkfs.ext4 /dev/sdx1`          | Format to ext4                           |
| `sudo tune2fs -l /dev/sda1`         | Show ext2/3/4 fs info                    |

---

## 🧑‍💻 Process & Resource Management

| Command                               | Description                                 |
|----------------------------------------|---------------------------------------------|
| `top` / `htop`                        | Real-time resource monitor (htop = better)  |
| `ps aux | grep nginx`                  | Search running processes                    |
| `pgrep -af pattern`                    | Grep for process, show cmd line             |
| `pstree -pau <pid>`                    | Visual process tree (with children)         |
| `kill -9 <pid>`                        | Force-kill process                          |
| `nice -n 10 cmd` / `renice -n 5 <pid>` | Set/adjust process priority                 |
| `lsof -i :8080`                        | Processes listening on port                 |
| `strace -p <pid>`                      | Trace syscalls of a process                 |
| `free -h`                              | Show RAM usage                              |
| `uptime`                               | System load, time, user count               |

---

## 🌐 Networking Essentials

| Command                                | Description                                      |
|-----------------------------------------|--------------------------------------------------|
| `ip a` / `ifconfig`                     | Show IP addresses/interfaces                     |
| `ip r` / `route -n`                     | Show routing table                              |
| `ss -tuln` / `netstat -tulnp`           | Show open/listening ports                        |
| `curl -v http://site`                   | HTTP request, verbose output                     |
| `ping -c 4 8.8.8.8`                     | Check ICMP reachability                          |
| `traceroute google.com`                 | Trace route to remote host                       |
| `dig +short site.com`                   | DNS resolution                                   |
| `nslookup site.com`                     | DNS lookup                                       |
| `host site.com`                         | DNS + IP info                                    |
| `nc -zv host 1-1024`                    | Port scan for open TCP ports                     |
| `wget https://file`                     | Download file                                    |
| `scp user@host:/src /dest`              | Copy files over SSH                              |
| `rsync -avz user@host:/src /dest`       | Sync over SSH with resume/compression            |
| `ethtool eth0`                          | NIC info and settings                            |
| `mtr google.com`                        | Network diagnostics with live stats              |

---

## 🔐 System Security & Hardening

| Command                                    | Description                                 |
|---------------------------------------------|---------------------------------------------|
| `sudo su - user`                            | Switch user (full login shell)              |
| `passwd user`                               | Change user password                        |
| `chage -l user`                             | Show password aging info                    |
| `chmod 640 file`                            | Set permissions (owner/rw, group/r)         |
| `chown user:group file`                     | Change file owner                           |
| `umask 027`                                 | Set default perms for new files             |
| `sshd -T | grep -i auth`                    | SSHD config summary                         |
| `ssh-keygen -t ed25519`                     | Generate new SSH key                        |
| `fail2ban-client status`                    | Show active bans (needs fail2ban)           |
| `sudo ufw status` / `sudo firewall-cmd --list-all` | Firewall status (Ubuntu/CentOS)    |
| `lastlog | grep -v '**Never logged in**'`   | Last logins                                 |
| `find / -perm -4000 -type f 2>/dev/null`    | Find SUID root files                        |
| `sudo lsof -i -n | grep LISTEN`             | Listening network daemons                   |

---

## 📊 Monitoring, Logging & Performance

| Command                                      | Description                             |
|-----------------------------------------------|-----------------------------------------|
| `dmesg | tail -20`                            | Kernel messages                         |
| `journalctl -xe`                              | Systemd logs (distro >= Ubuntu 16.04+)  |
| `tail -F /var/log/syslog`                     | Follow system logs live                 |
| `sar -u 1 5`                                  | CPU usage every 1s for 5 intervals      |
| `iostat -xm 5`                                | Extended disk I/O stats                 |
| `vmstat 2 10`                                 | System/process/memory every 2s, 10x     |
| `free -mh`                                    | Human-readable memory info              |
| `ps aux --sort=-%mem | head -n 10`            | Top 10 memory users                     |
| `ncdu /var`                                   | Disk usage, interactive (needs ncdu)    |

---

## 📦 Package Management & System Update

| Command                         | Description                       |
|----------------------------------|-----------------------------------|
| `apt update && apt upgrade -y`   | Update packages (Debian/Ubuntu)   |
| `yum update -y`                  | Update packages (RHEL/CentOS)     |
| `apt search <pkg>` / `yum search <pkg>` | Search for a package       |
| `dpkg -l | grep <pkg>`           | List installed packages (Deb/Ub)  |
| `rpm -qa | grep <pkg>`           | List installed packages (RHEL)    |

---

## 👥 User & Group Management

| Command                        | Description                          |
|---------------------------------|--------------------------------------|
| `id user`                      | Show user & group IDs                |
| `sudo useradd -m -s /bin/bash user` | Add user with home shell         |
| `sudo passwd user`              | Set user password                    |
| `sudo usermod -aG wheel user`   | Add user to group (e.g., sudo)       |
| `sudo deluser user`             | Remove user (Debian/Ubuntu)          |
| `sudo groupadd devs`            | Create group                         |
| `getent passwd`                 | List all users                       |
| `chage -l user`                 | Check user password aging            |

---

## ⏰ Scheduling & Automation (cron, at, systemd)

| Command/Pattern                    | Description                                   |
|------------------------------------|-----------------------------------------------|
| `crontab -e`                       | Edit user crontab                             |
| `crontab -l`                       | List user cron jobs                           |
| `sudo crontab -e -u user`          | Edit another user's crontab                   |
| `echo "cmd" | at 23:00`            | One-time task at 11pm                         |
| `systemctl list-timers`            | List all systemd timers                       |
| `systemctl status <service>`       | Service status (systemd)                      |

**Crontab pattern:**  
```cron
# m h dom mon dow command
0 2 * * * /usr/local/bin/backup.sh


## 🧰 AWK, SED & FIND Mastery

### AWK

| Pattern / Command                                 | Description                           |
|---------------------------------------------------|---------------------------------------|
| `awk '{print $1, $3}' file`                       | Print fields 1 and 3                  |
| `awk -F: '$3 > 1000 {print $1}' /etc/passwd`      | Users with UID > 1000                 |
| `df -h | awk '$5+0 > 80 {print $1, $5}'`          | Filesystems >80% used                 |
| `awk '/pattern/ {print NR, $0}' file`             | Print matching lines with line numbers |

---

### SED

| Pattern / Command                     | Description                        |
|---------------------------------------|------------------------------------|
| `sed 's/foo/bar/g' file`              | Replace all 'foo' with 'bar'       |
| `sed -n '5,10p' file`                 | Print lines 5-10                   |
| `sed '/pattern/d' file`               | Delete lines matching pattern      |
| `sed '2d' file`                       | Delete second line                 |
| `sed -i 's/old/new/g' file`           | In-place replacement (be careful!) |

---

### FIND

| Pattern / Command                                  | Description                                 |
|----------------------------------------------------|---------------------------------------------|
| `find /var -type f -name "*.log"`                  | Find all .log files under /var              |
| `find . -size +100M`                               | Files larger than 100MB                     |
| `find /tmp -type f -mtime +7 -delete`              | Delete files older than 7 days              |
| `find . -exec chmod 600 {} \;`                     | Change perms on all files found             |
| `find . -perm -4000`                               | Files with SUID bit set                     |
| `find . -type f -print0 | xargs -0 grep 'pattern'` | Find files and search pattern efficiently    |

---

## 🧠 Interesting Tricks & Advanced Patterns

| Trick / Command                          | What It Does / When to Use                   |
|-------------------------------------------|----------------------------------------------|
| `!!` / `sudo !!`                         | Repeat last command / as sudo                |
| `history | grep ssh`                     | Search command history                       |
| `Ctrl+R`                                 | Reverse history search                       |
| `: > file`                               | Truncate file (make empty, keep inode)       |
| `less +F /var/log/syslog`                | Tail log interactively                       |
| `xargs -P 4 -n 1 <cmd>`                  | Run command in parallel                      |
| `grep -rnw . -e "search"`                | Recursive, exact word match                  |
| `ncdu /`                                 | Visual disk usage explorer (needs ncdu)      |
| `journalctl -u nginx --since today`       | Logs for specific service, since today       |
| `curl ifconfig.me`                       | Get public IP from shell                     |
| `watch -d -n 2 'df -h'`                  | Highlighted disk space watch every 2s        |
| `lsof +D /path`                          | List open files under a directory            |

---

## 💡 Pro Tips, Gotchas, Best Practices

- **Always quote variables** (`"$var"`) in scripts to avoid globbing/splitting.
- **Use `set -euo pipefail`** for safer bash scripting (exit on error, unset vars, pipefail).
- **Absolute paths** are safer for cron/CIs than relative paths.
- **Log everything:** Always send script output to syslog or logfiles.
- **Check process/network limits:** (`ulimit -a`, `/etc/security/limits.conf`) in production.
- **Tag critical files/scripts** with comments for auditing/rotation.
- **For AWS hosts:** Use SSM Session Manager for secure, auditable access (no SSH key management).
- **Disable root SSH, use key-based logins, rotate keys.**
- **Use fail2ban or similar** for brute-force SSH defense.
- **Clean up `/tmp` and `/var/log` regularly** in automated jobs for disk hygiene.

---

## ✅ Quick Wins & Checklist

| Task                                | Command Example/Pattern                                                |
|--------------------------------------|------------------------------------------------------------------------|
| Show top memory & CPU processes      | `htop` / `ps aux --sort=-%mem | head`                                |
| Find & delete logs >7d old           | `find /var/log -type f -mtime +7 -delete`                              |
| Check which process is using a port  | `lsof -i :443` / `ss -tuln`                                            |
| Search logs for critical errors      | `grep -i 'crit' /var/log/*`                                            |
| Fix perms recursively                | `chmod -R go-rwx /path`                                                |
| Disk usage summary by dir            | `du -sh * | sort -hr | head -20`                                      |
| Run system update                    | `apt update && apt upgrade -y`                                         |
| Monitor live logs                    | `tail -F /var/log/syslog`                                              |
| Get AWS public IP of instance        | `curl http://169.254.169.254/latest/meta-data/public-ipv4`             |
| Test network to AWS S3 endpoint      | `curl -v https://s3.<region>.amazonaws.com`                            |
| Check cron jobs                      | `crontab -l`                                                           |

---

**Keep this page in your reference repo, and extend it as your patterns and fleet evolve!**
