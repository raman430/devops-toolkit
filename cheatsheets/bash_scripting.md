# 🐚 Bash Scripting: Essential Patterns & Reference (Senior DevOps)

---

## 📝 Variables, Arrays & Strings

| Pattern / Example                 | Description                                |
|-----------------------------------|--------------------------------------------|
| `VAR="value"`                     | Declare variable                           |
| `readonly VAR="constant"`         | Read-only variable                         |
| `arr=(a b c)`                     | Array declaration                          |
| `${arr[0]}`                       | First element of array                     |
| `${#arr[@]}`                      | Array length                               |
| `"${str,,}"` / `"${str^^}"`       | Lowercase/uppercase conversion (Bash 4+)   |
| `${VAR:-default}`                 | Use default if VAR is unset                |

---

## 🔀 Conditionals & Comparisons

| Pattern / Example                      | Description                       |
|----------------------------------------|-----------------------------------|
| `if [ "$x" -eq 1 ]; then ... fi`       | Numeric comparison                |
| `if [[ "$s" == foo* ]]; then ... fi`   | String pattern match              |
| `if [ -f "$file" ]`                    | File exists and is regular        |
| `if [ -d "$dir" ]`                     | Directory exists                  |
| `if [ -z "$str" ]`                     | String is empty                   |
| `elif ... else ... fi`                 | Else if / Else / End if           |

---

## 🔁 Loops & Iteration

| Pattern / Example                             | Description                 |
|-----------------------------------------------|-----------------------------|
| `for i in {1..5}; do ... done`                | Numeric range               |
| `for f in *.log; do ... done`                 | Loop over files             |
| `while read line; do ... done < file`         | Read file line by line      |
| `for i in "${arr[@]}"; do ... done`           | Loop over array elements    |

---

## 🧩 Functions & Reusability

```bash
function say_hello() {
    local name="$1"
    echo "Hello, $name"
}
say_hello "Alice"

# 📦 Bash Scripting: Input/Output, Error Handling, and Essentials

---

## 📥 Input, Output & Arguments

| Pattern             | Description                                   |
|---------------------|-----------------------------------------------|
| `$1`, `$2`, ...     | Positional arguments to script                |
| `$@`                | All arguments as a list                       |
| `"$*"` / `"$@"`     | All arguments as a single string / as a list  |
| `read var`          | Read from stdin                               |
| `echo "text"`       | Print text                                    |
| `printf "%s\n" "$msg"` | Safer/more controlled output              |
| `cat <<EOF ... EOF` | Here document (multi-line string)             |
| `shift`             | Shift positional parameters left              |

**Parsing Named Args Example:**
```bash
while [[ $# -gt 0 ]]; do
  case $1 in
    --file) FILE="$2"; shift 2 ;;
    --flag) FLAG=1; shift ;;
    *) echo "Unknown option $1"; exit 1 ;;
  esac
done

## 🔚 Exit Codes, Traps & Error Handling

| Pattern / Command                   | Description                                  |
|-------------------------------------|----------------------------------------------|
| `exit <code>`                       | Exit with status code                        |
| `$?`                                | Last command exit code                       |
| `trap 'echo ERROR; exit 1' ERR`     | Run command on error                         |
| `set -e`                            | Exit script on first error                   |
| `set -u`                            | Error if undefined variable used             |
| `set -o pipefail`                   | Fail if any piped command fails              |

---

## 📂 File, Directory & Process Operations

| Pattern / Command                                | Description                                 |
|--------------------------------------------------|---------------------------------------------|
| `if [ -e "$file" ]; then ... fi`                 | Check if file exists                        |
| `rm -rf "$dir"`                                  | Remove directory recursively (be careful!)  |
| `cp -r src/ dest/`                               | Copy directory recursively                  |
| `grep -q "pattern" file && echo "found"`         | Test if pattern found in file               |
| `ps aux | grep process`                          | Find running processes                      |
| `kill -9 $pid`                                   | Kill a process by PID                       |

---

## 🐞 Debugging & Troubleshooting

| Pattern / Command                          | Description                                  |
|--------------------------------------------|----------------------------------------------|
| `set -x` / `set +x`                        | Enable/disable debug (trace) mode            |
| `bash -x script.sh`                        | Run script with debug output                 |
| `echo $VAR`                                | Print variable value                         |
| `env`                                      | Show environment variables                   |
| `trap 'echo "Error at $LINENO"' ERR`       | Print line number on error                   |
| `shellcheck script.sh`                     | Lint script for bugs (external tool)         |

---

## 💡 Pro Tips, Best Practices, Gotchas

- **Always quote variable expansions:** `"$VAR"` (avoids word splitting and globbing bugs).
- **Prefer `[[ ... ]]` over `[ ... ]`** for complex or string tests.
- **Use `set -euo pipefail`** for robust error handling in scripts.
- **Use `local` in functions** to avoid polluting global scope.
- **Prefer absolute paths** for scripts in cron/CI environments.
- **Check scripts with [`shellcheck`](https://www.shellcheck.net/)** before deploying.
- **Avoid destructive patterns:** Always double-check `rm -rf` commands!

---

## ✅ Quick Wins Checklist

| Task                        | Pattern / Command Example                       |
|-----------------------------|------------------------------------------------|
| Start script (best practice)| `#!/bin/bash; set -euo pipefail`               |
| Loop over files             | `for f in *.log; do ...; done`                 |
| Parse arguments robustly    | See "Parsing Named Args Example" above         |
| Debug a script              | `bash -x script.sh` or `set -x`                |
| Error handling/trap         | `trap 'echo "Error!"' ERR`                     |
| Lint script                 | `shellcheck script.sh`                         |
| Make script executable      | `chmod +x script.sh`                           |
| Test for file/dir existence | `[ -e "$file" ]` / `[ -d "$dir" ]`             |
| Schedule with cron          | `crontab -e`                                   |

---
