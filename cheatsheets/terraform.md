# 🌍 Terraform Cheatsheet (Senior/Lead DevOps Reference)

## 🚦 Init, Format, Validate

| Command                          | Description                                    |
|-----------------------------------|------------------------------------------------|
| `terraform init`                  | Initialize working directory and plugins       |
| `terraform fmt -recursive`        | Format all code (recursive)                    |
| `terraform validate`              | Validate configuration syntax                  |
| `terraform version`               | Show Terraform version                         |
| `terraform providers`             | List required/configured providers             |

---

## 🚀 Plan, Apply, and Destroy

| Command                                      | Description                                 |
|-----------------------------------------------|---------------------------------------------|
| `terraform plan`                             | Show planned changes (dry-run)              |
| `terraform plan -out=tfplan`                  | Save plan to file for later apply           |
| `terraform apply`                            | Apply latest plan (interactive approval)    |
| `terraform apply tfplan`                     | Apply from a saved plan file                |
| `terraform destroy`                          | Destroy all managed infrastructure          |
| `terraform apply -auto-approve`              | Apply without interactive approval          |
| `terraform destroy -auto-approve`            | Destroy without interactive approval        |

**Best Practice:**  
- Always run `plan` and review output before applying.  
- Save plans for approval workflows in teams.

---

## 🗄️ State Management & Remote Backends

| Command                                  | Description                                  |
|-------------------------------------------|----------------------------------------------|
| `terraform state list`                    | List all tracked resources                   |
| `terraform state show <resource>`         | Show resource from state file                |
| `terraform state rm <address>`            | Remove resource from state (dangerous!)      |
| `terraform state mv <old> <new>`          | Move resource in state                       |
| `terraform state pull`                    | Download current state file                  |
| `terraform state push <statefile>`        | Upload local state file                      |
| `terraform import <addr> <id>`            | Import existing resource to state            |

## 🌱 Workspace & Environment Management

| Command                                 | Description                                  |
|------------------------------------------|----------------------------------------------|
| `terraform workspace list`               | List all workspaces                          |
| `terraform workspace new <name>`         | Create new workspace                         |
| `terraform workspace select <name>`      | Switch workspace                             |
| `terraform workspace delete <name>`      | Delete workspace                             |

**Use Case:**  
Workspaces are ideal for environment isolation (e.g., dev, test, prod).

---

## 🛠️ Troubleshooting, Import, and Debug

| Command / Pattern                                | Description                                         |
|--------------------------------------------------|-----------------------------------------------------|
| `terraform refresh`                              | Update state with real infrastructure               |
| `terraform taint <address>`                      | Mark resource for recreation                        |
| `terraform untaint <address>`                    | Remove taint                                        |
| `TF_LOG=DEBUG terraform apply`                   | Enable detailed debug logs                          |
| `terraform import <address> <cloud-id>`          | Import resource to state                            |
| `terraform providers mirror ./dir`               | Mirror providers for air-gapped environments        |

**Pro Tip:**  
Use `terraform graph | dot -Tpng > graph.png` to visualize resource dependencies.

---
