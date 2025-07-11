# 🚀 Terragrunt Cheatsheet (Senior/Lead DevOps Reference)

---

## Table of Contents

- [Introduction & Core Concepts](#introduction--core-concepts)
- [Basic Commands](#basic-commands)
- [Module & Environment Structure](#module--environment-structure)
- [Configuration (`terragrunt.hcl`)](#configuration-terragrunthcl)
- [Advanced Features & Patterns](#advanced-features--patterns)
- [Troubleshooting & Debugging](#troubleshooting--debugging)
- [Pro Tips, Best Practices, Gotchas](#pro-tips-best-practices-gotchas)
- [Quick Wins Checklist](#quick-wins-checklist)
- [References & Tools](#references--tools)

---

## 🏗️ Introduction & Core Concepts

| Concept              | Description                                                                               |
|----------------------|-------------------------------------------------------------------------------------------|
| **Terragrunt**       | Wrapper for Terraform, enabling DRY, reusable, and DR-controlled IaC workflows.           |
| **HCL**              | Uses `terragrunt.hcl` files to orchestrate Terraform modules.                             |
| **Inheritance**      | Uses `include`, `locals`, and `inputs` to share config across environments.               |
| **Remote State**     | Standardizes backends and locking (e.g., S3/DynamoDB for AWS).                            |

---

## ⚡ Basic Commands

| Command                              | Description                                         |
|---------------------------------------|-----------------------------------------------------|
| `terragrunt init`                     | Initialize Terraform module with Terragrunt         |
| `terragrunt plan`                     | Plan infrastructure changes                         |
| `terragrunt apply`                    | Apply changes                                       |
| `terragrunt destroy`                  | Destroy resources                                   |
| `terragrunt output`                   | Show output variables                               |
| `terragrunt validate-inputs`          | Validate required inputs in config                   |
| `terragrunt graph-dependencies`       | Visualize dependencies between modules              |
| `terragrunt run-all plan`             | Plan for all modules in the directory tree          |
| `terragrunt run-all apply`            | Apply all modules in the tree (respects dependencies)|
| `terragrunt run-all destroy`          | Destroy all modules in the tree                     |
| `terragrunt providers`                | Show provider requirements                          |

---

## 🗂️ Module & Environment Structure

```plaintext
live/
  ├── terragrunt.hcl             # Root: remote state & provider config
  ├── prod/
  │     ├── terragrunt.hcl       # Environment-level config
  │     └── eu-west-2/
  │         ├── vpc/terragrunt.hcl
  │         ├── eks/terragrunt.hcl
  │         └── ...
  └── stage/
        └── ...
modules/
  ├── vpc/
  ├── eks/
  └── ...

## 🌟 Advanced Features & Patterns

| Feature          | Example / Usage                               | Description                                  |
|------------------|----------------------------------------------|----------------------------------------------|
| **include**      | `include { path = find_in_parent_folders() }` | Inherit config from parent                   |
| **dependency**   | Block to fetch outputs from other modules     | Enables module chaining                      |
| **locals**       | `locals { env = "prod" }`                    | Reusable variables                           |
| **generate**     | Generate extra Terraform files dynamically    | Inject provider or backend blocks            |
| **inputs**       | Pass variables to module                      | Overwrite defaults in module                 |
| **prevent_destroy** | Prevent accidental resource deletion       | Safer production practices                   |
| **run-all**      | `terragrunt run-all plan/apply`               | Multi-module orchestration                   |

---

### **Dependency Example**

```hcl
dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
}

## 🕵️‍♂️ Troubleshooting & Debugging

| Command / Pattern                                           | Description                                         |
|-------------------------------------------------------------|-----------------------------------------------------|
| `terragrunt plan --terragrunt-log-level debug`              | Debug-level logs                                    |
| `terragrunt validate-inputs`                                | Ensure all required inputs are provided             |
| `terragrunt output`                                         | See all output values                               |
| `terragrunt state list`                                     | List state resources (via Terraform passthrough)    |
| `terragrunt state pull`                                     | Pull remote state                                   |
| `terragrunt run-all plan --terragrunt-non-interactive`      | Batch plan, no prompts                              |

**Common Troubleshooting Tips:**
- Check the effective `terragrunt.hcl` using the CLI logs for inheritance issues.
- Always validate backend configuration—most errors are from state misconfiguration.
- Review provider versions if seeing strange plan/apply errors.
- Use `--terragrunt-include-dir` or `--terragrunt-exclude-dir` to limit scope during `run-all`.

---

## 💡 Pro Tips, Best Practices, Gotchas

- **Keep all remote state and provider config in the root `terragrunt.hcl` for consistency.**
- **Use `dependency` blocks, not hardcoded outputs, for cross-module references.**
- **Never commit real credentials, state, or secrets.**
- **Prefer small, focused modules for ease of maintenance.**
- **Test with `plan` before every `apply`—use `--terragrunt-non-interactive` for automation.**
- **Use environment variables (`TF_VAR_*`, `AWS_PROFILE`) for sensitive data.**
- **Always review the generated Terraform plan and state before approving PRs in CI/CD.**
- **Lock modules to version/tag/commit for reproducible deployments.**
- **Avoid circular dependencies!**
- **Gotcha:** Terragrunt does not understand all custom Terraform providers equally—validate provider configs for new services.

---

## ✅ Quick Wins Checklist

| Task                          | Command/Action                                         |
|-------------------------------|-------------------------------------------------------|
| Init a module                 | `terragrunt init`                                     |
| Plan/apply a single module    | `terragrunt plan` / `terragrunt apply`                |
| Orchestrate all modules       | `terragrunt run-all plan` / `terragrunt run-all apply`|
| Destroy safely                | `terragrunt destroy` / `terragrunt run-all destroy`   |
| Output values                 | `terragrunt output`                                   |
| Validate required inputs      | `terragrunt validate-inputs`                          |
| Debug logs                    | `terragrunt <cmd> --terragrunt-log-level debug`       |
| Graph dependencies            | `terragrunt graph-dependencies`                       |

---
