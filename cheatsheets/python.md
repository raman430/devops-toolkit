# 🐍 Python Scripting Cheatsheet for DevOps & SRE (Senior/Lead Reference)



## 🗂️ Project Structure & Environment

| Tool / Command                 | Description                               |
|-------------------------------|-------------------------------------------|
| `python3 -m venv venv`        | Create virtual environment                |
| `source venv/bin/activate`    | Activate virtualenv (Linux/macOS)         |
| `pip install -r requirements.txt` | Install dependencies                 |
| `pip freeze > requirements.txt` | Export package versions                  |
| `python -m this`              | Zen of Python (Easter egg)                |

**Best Practice:**  
- Structure projects with `/src`, `/tests`, `requirements.txt`, `.env`, `README.md`.

---

## 📝 Everyday Scripting Patterns

| Pattern / Example                                    | Description                                   |
|------------------------------------------------------|-----------------------------------------------|
| `if __name__ == "__main__":`                         | Script entry point                            |
| `import os, sys, logging`                            | Standard imports                              |
| `def func(a, b=2):`                                  | Define function with default argument         |
| `for i in range(10): ...`                            | For loop                                      |
| `with open('file.txt') as f: ...`                    | Context manager for file handling             |
| `try: ... except Exception as e: ...`                | Exception handling                            |
| `print(f"User: {user}")`                             | f-String formatting (Python 3.6+)             |
| `os.environ.get("HOME", "/tmp")`                     | Environment variable with default             |

---

## 📂 File, Directory & OS Operations

| Pattern / Example                                            | Description                             |
|--------------------------------------------------------------|-----------------------------------------|
| `os.listdir('.')`                                            | List directory contents                 |
| `os.path.join(dir, file)`                                    | Cross-platform path join                |
| `os.makedirs('dir', exist_ok=True)`                          | Make directory (no error if exists)     |
| `with open('file.txt', 'r') as f: data = f.read()`           | Read file                               |
| `with open('out.txt', 'w') as f: f.write("text")`            | Write file                              |
| `shutil.copy(src, dst)`                                      | Copy file                               |
| `os.remove('file.txt')`                                      | Delete file                             |
| `subprocess.run(["ls", "-l"], check=True)`                   | Run shell command (safe)                |

---

## 🌐 Networking, APIs & Web Requests

| Pattern / Example                                            | Description                              |
|--------------------------------------------------------------|------------------------------------------|
| `import requests`                                            | Popular HTTP client                      |
| `requests.get(url, timeout=5)`                               | GET request with timeout                 |
| `requests.post(url, json=payload, headers=headers)`          | POST JSON                                |
| `resp.json()`                                                | Parse JSON response                      |
| `import socket`                                              | For raw network, port checks, etc.       |
| `socket.create_connection((host, port), timeout=5)`          | Test TCP port                            |

**Pro Tip:**  
- Use `requests.Session()` for connection pooling and retries.

---

## 🗄️ Data Formats: JSON, YAML, CSV

| Module / Pattern                                            | Description                                 |
|-------------------------------------------------------------|---------------------------------------------|
| `import json, yaml, csv`                                    | Standard data format modules                |
| `json.load(f)` / `json.dump(data, f, indent=2)`             | Read/write JSON                             |
| `yaml.safe_load(f)` / `yaml.safe_dump(data, f)`             | Read/write YAML (PyYAML)                    |
| `csv.DictReader(f)` / `csv.DictWriter(f, fieldnames=...)`   | Read/write CSV as dicts                     |

---

## 📈 Logging & Monitoring

| Pattern / Example                                            | Description                                |
|--------------------------------------------------------------|--------------------------------------------|
| `import logging`                                             | Standard logging module                    |
| `logging.basicConfig(level=logging.INFO)`                    | Set up root logger                         |
| `logging.getLogger(__name__)`                                | Get module-specific logger                 |
| `logger.info("Starting app")`                                | Log messages at INFO level                 |
| `logger.error("Error occurred", exc_info=True)`              | Log exceptions                             |

**Best Practice:**  
- Use structured logging (e.g., JSON logs) for production monitoring.

---

## ⚠️ Error Handling & Exceptions

| Pattern / Example                                    | Description                                  |
|------------------------------------------------------|----------------------------------------------|
| `try: ... except Exception as e:`                    | Catch exceptions                             |
| `except (IOError, OSError) as e:`                    | Catch multiple types                         |
| `raise`                                              | Re-raise last exception                      |
| `raise ValueError("Bad input")`                      | Raise custom exception                       |
| `assert x > 0, "x must be positive"`                 | Assertion for sanity checks                  |

---

## ☁️ AWS & Cloud Automation

| Library / Pattern                                      | Description                                    |
|--------------------------------------------------------|------------------------------------------------|
| `import boto3`                                         | AWS SDK for Python                             |
| `boto3.Session(profile_name="dev")`                    | Use named AWS profile                          |
| `s3 = boto3.client('s3')`                              | Create S3 client                               |
| `s3.list_buckets()`                                    | List S3 buckets                                |
| `sqs = boto3.resource('sqs')`                          | Use SQS resource interface                     |
| `lambda_client.invoke(FunctionName='my-func', Payload=...)` | Invoke Lambda function                   |
| `ec2 = boto3.resource('ec2')`                          | EC2 resource                                   |
| `sts = boto3.client('sts'); sts.get_caller_identity()` | Get current AWS identity                       |

**Pro Tip:**  
- Use [moto](https://github.com/spulec/moto) to mock AWS services in tests.

---

## 🏃 Concurrency & Scheduling

| Module / Pattern                            | Description                                    |
|---------------------------------------------|------------------------------------------------|
| `import threading, multiprocessing`         | Native concurrency modules                     |
| `t = threading.Thread(target=func)`         | Start new thread                               |
| `from concurrent.futures import ThreadPoolExecutor` | High-level concurrency                 |
| `with ThreadPoolExecutor(max_workers=5) as ex:` | Thread pool for parallel tasks          |
| `import schedule`                           | `schedule.every(5).minutes.do(job)`            |
| `import asyncio`                            | For async IO (HTTP, file, etc.)                |

---

## 🔒 Security, Secrets & Encryption

| Tool / Library / Pattern                        | Description                            |
|-------------------------------------------------|----------------------------------------|
| `os.environ.get("SECRET_KEY")`                  | Get secrets from environment           |
| `python-dotenv`                                 | Load secrets from `.env` files         |
| `from cryptography.fernet import Fernet`        | Simple encryption/decryption           |
| `key = Fernet.generate_key(); f = Fernet(key)`  | Generate and use symmetric key         |
| `boto3.client('secretsmanager')`                | Access AWS Secrets Manager             |

---

## ✅ Testing & Linting

| Tool / Pattern                            | Description                                 |
|-------------------------------------------|---------------------------------------------|
| `pytest`                                 | Most popular testing framework              |
| `assert func(2) == 4`                    | Simple assertion                            |
| `pytest --maxfail=1 --disable-warnings -v`| Run tests, fail fast, verbose               |
| `unittest`                               | Built-in test module                        |
| `black .`                                | Auto-format code                            |
| `flake8 .`                               | Lint code for errors                        |
| `mypy .`                                 | Type checking                               |
| `coverage run -m pytest`                  | Measure test coverage                       |

---

## 💡 Pro Tips, Best Practices, Gotchas

- **Virtual environments:** Use `venv` for every project; avoid package collisions.
- **Never hardcode secrets:** Always use env vars or secret managers.
- **Always handle exceptions:** Especially for file/network/cloud ops.
- **Use type hints:** Improves code clarity and tool integration (`def foo(x: int) -> str:`).
- **Structure logs:** Prefer JSON logs for ingestion in monitoring systems (CloudWatch, ELK, etc).
- **Document scripts:** Use docstrings and comments, especially for automation code.
- **Limit IAM permissions:** Use least privilege for boto3 actions.
- **Automate repetitive cloud operations** with Python scripts or Lambda.
- **Lint, format, and test before running in production.**

---

## ✅ Quick Wins Checklist

| Task                              | Example / Command                                 |
|------------------------------------|---------------------------------------------------|
| Create virtualenv                  | `python3 -m venv venv; source venv/bin/activate`  |
| Install packages                   | `pip install -r requirements.txt`                 |
| Run a script                       | `python myscript.py`                              |
| List S3 buckets                    | See S3 snippet above (`boto3.client('s3')...`)    |
| Make an API call                   | Use `requests.get(url)`                           |
| Parse JSON/YAML config             | `json.load(f)` / `yaml.safe_load(f)`              |
| Log to file and stdout             | `logging.basicConfig(filename='out.log', ...)`    |
| Format/lint code                   | `black . && flake8 .`                             |
| Run tests                          | `pytest`                                          |
| Encrypt a string                   | See `cryptography.Fernet` above                   |

---

