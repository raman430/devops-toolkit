# 🚀 Ansible Cheatsheet (Senior/Lead DevOps Reference)

## Quick Navigation

| Command                                        | Description                                         |
|------------------------------------------------|-----------------------------------------------------|
| `ansible --version`                            | Show Ansible version                                |
| `ansible-inventory --list -y -i inventory`     | Show hosts as YAML (supports dynamic inventory)     |
| `ansible all -i inventory -m ping`             | Test connectivity to all hosts                      |
| `ansible-doc -l`                               | List all available modules                          |
| `ansible-doc <module>`                         | Show documentation and examples for a module        |

---

## Essential Ad-hoc Commands

| Command                                             | Description                         |
|-----------------------------------------------------|-------------------------------------|
| `ansible all -m ping -i hosts`                      | Check SSH connectivity              |
| `ansible web -m shell -a "uptime"`                  | Run shell command on web group      |
| `ansible db -m yum -a "name=postgresql state=latest"`| Install package with yum            |
| `ansible all -m copy -a "src=localfile dest=/tmp/"` | Copy file to all hosts              |
| `ansible all -m service -a "name=nginx state=restarted"` | Restart service                  |
| `ansible all -m setup`                              | Gather and display facts            |

**_Tips:_**
- Use `-u <username>` to specify remote user.
- Use `-b` or `--become` to escalate privileges (sudo).
- For parallelism: `-f 20` (set forks).

---

## Playbooks: Usage & Flags

| Command                                                        | Description                            |
|----------------------------------------------------------------|----------------------------------------|
| `ansible-playbook playbook.yml -i hosts`                       | Run playbook                           |
| `ansible-playbook playbook.yml --check`                        | Dry-run (test, but make no changes)    |
| `ansible-playbook playbook.yml --diff`                         | Show changes/diffs                     |
| `ansible-playbook playbook.yml --start-at-task="Install nginx"`| Resume from a named task               |
| `ansible-playbook playbook.yml --tags setup`                   | Run only tasks with a given tag        |
| `ansible-playbook playbook.yml --limit host1,host2`            | Limit to specified hosts               |
| `ansible-playbook playbook.yml -e "var1=foo var2=bar"`         | Pass extra variables                   |
| `ansible-playbook playbook.yml -vvv`                           | Verbose/debug output                   |
| `ansible-playbook playbook.yml --syntax-check`                 | Lint/syntax check                      |

### Sample Playbook Skeleton

```yaml
---
- name: Setup Web Servers
  hosts: web
  become: yes
  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present
    - name: Ensure index.html is present
      copy:
        src: index.html
        dest: /var/www/html/index.html
      notify: reload nginx

  handlers:
    - name: reload nginx
      service:
        name: nginx
        state: reloaded

## 🛠️ Troubleshooting & Debug

| Command                                                  | Description                                       |
|----------------------------------------------------------|---------------------------------------------------|
| `ansible-playbook playbook.yml -vvv`                     | Increase verbosity (add more v's for more!)       |
| `ansible -m ping all -vvvv`                              | Debug connection and SSH issues                   |
| `ansible-playbook playbook.yml --start-at-task "..."`    | Start at a specific task (recover from fail)      |
| `ansible-playbook playbook.yml --step`                   | Step through playbook interactively               |
| `ansible-playbook playbook.yml --list-tasks`             | List all tasks that will be run                   |
| `ansible-playbook playbook.yml --list-hosts`             | List hosts that will be affected                  |
| `ansible-config dump --only-changed`                     | Show only custom config settings                  |
| `ansible-doc <module>`                                   | See docs and examples for any module              |

### **Best Practices**
- Use `--check` and `--diff` before running destructive changes.
- Always use handlers for service restarts to avoid unnecessary reloads.
- Modularize with roles and tags for easier testing and troubleshooting.
- Keep tasks **idempotent** (safe to run repeatedly).

---

## 🔐 Secrets & Ansible Vault

| Command                                           | Description                               |
|---------------------------------------------------|-------------------------------------------|
| `ansible-vault encrypt secret.yml`                | Encrypt a file                            |
| `ansible-vault decrypt secret.yml`                | Decrypt a file                            |
| `ansible-vault edit secret.yml`                   | Edit encrypted file                       |
| `ansible-vault rekey secret.yml`                  | Change vault password                     |
| `ansible-playbook ... --ask-vault-pass`           | Prompt for vault password                 |
| `ansible-playbook ... --vault-password-file=pass.txt` | Use a file for vault password           |

### **Gotcha**
- **Don't store vault passwords in source code or repos!**
- Use separate `group_vars/` and `host_vars/` for encrypted/unencrypted variables.

---
