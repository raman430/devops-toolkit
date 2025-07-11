# 🚀 Packer Cheatsheet (Senior/Lead DevOps Reference)
## 🗂️ Basics & Navigation

| Command                        | Description                                      |
|---------------------------------|--------------------------------------------------|
| `packer version`                | Show Packer version                              |
| `packer init .`                 | Initialize Packer plugins (HCL2 only)            |
| `packer fmt .`                  | Format HCL templates in the current dir          |
| `packer validate <template>`    | Validate template syntax and config              |
| `packer build <template>`       | Build image using specified template             |
| `packer inspect <template>`     | Show data sources, variables, builders, etc.     |

**Best Practice:**  
- Use HCL2 (`.pkr.hcl`) templates for all new work (legacy JSON still works but is discouraged).

---

## 🧰 Essential Commands

| Command                                                      | Description                              |
|--------------------------------------------------------------|------------------------------------------|
| `packer build template.pkr.hcl`                              | Build an image                           |
| `packer build -var-file=vars.pkrvars.hcl template.pkr.hcl`   | Build with variable overrides            |
| `packer build -only=amazon-ebs.template template.pkr.hcl`    | Build using only specific builder(s)     |
| `packer build -on-error=cleanup template.pkr.hcl`            | Cleanup temp resources on failure        |
| `PACKER_LOG=1 packer build ...`                              | Enable debug logging                     |

**Gotcha:**  
- `packer init` is required for HCL2 templates but not JSON.

---

## 🏗️ Template Structure & HCL Patterns

**Minimal HCL2 Example:**
```hcl
variable "aws_region" { default = "eu-west-2" }

source "amazon-ebs" "ubuntu" {
  region      = var.aws_region
  instance_type = "t3.micro"
  ami_name    = "packer-ubuntu-{{timestamp}}"
  source_ami_filter {
    filters = {
      name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
    }
    owners = ["099720109477"]
    most_recent = true
  }
  ssh_username = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.ubuntu"]
  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get upgrade -y"
    ]
  }
}

#### 🔑 Variables, Secrets & Parameterization

| Command / Pattern                           | Description                               |
|---------------------------------------------|-------------------------------------------|
| `packer build -var "key=value"`             | Set variable on CLI                       |
| `packer build -var-file=vars.pkrvars.hcl`   | Load variables from file                  |
| `${var.variable_name}`                      | Reference variable in HCL                 |
| Use env vars (e.g., `AWS_ACCESS_KEY_ID`)    | Inject cloud secrets securely             |
| Store secrets in Vault/CI/CD env, not templates! | Security best practice               |

**Example: `vars.pkrvars.hcl`**
```hcl
aws_region = "eu-west-2"
ami_prefix = "myapp-"


# 🏗️ Packer Builders, Provisioners, and Advanced Usage (Senior DevOps Cheatsheet)

---

## 🛠️ Common Builders & Provisioners

### **Builders**

| Builder         | Use Case             | Example HCL Source Block                        |
|-----------------|---------------------|-------------------------------------------------|
| `amazon-ebs`    | AWS AMI builds      | See HCL example above                           |
| `googlecompute` | GCP image builds    | `source "googlecompute" "myimg" { ... }`        |
| `azure-arm`     | Azure VM images     | `source "azure-arm" "myimg" { ... }`            |
| `docker`        | Docker image builds | `source "docker" "myimg" { ... }`               |

### **Provisioners**

| Provisioner | Purpose                 | Example                                             |
|-------------|-------------------------|-----------------------------------------------------|
| `shell`     | Run shell commands      | `provisioner "shell" { inline = [ ... ] }`          |
| `ansible`   | Run Ansible playbooks   | `provisioner "ansible" { ... }`                     |
| `file`      | Upload files            | `provisioner "file" { source=..., destination=... }`|

---

## 🚀 Advanced Use Cases

- **Multiple builders in one build:**  
  Use separate `source` blocks and reference them in a single `build` block with `sources = [...]`
- **Parallel builds:**  
  Packer runs all builders in parallel by default.
- **Selective builds:**  
  ```sh
  packer build -only=aws,azure ...

## 🐞 Debugging & Troubleshooting

| Command/Pattern                                 | Description                                    |
|-------------------------------------------------|------------------------------------------------|
| `PACKER_LOG=1 packer build ...`                 | Basic debug logs                               |
| `PACKER_LOG=DEBUG packer build ...`             | Full verbose logging                           |
| `packer validate <template>`                    | Validate syntax and interpolation              |
| `packer inspect <template>`                     | Show template components                       |
| `packer build -on-error=abort ...`              | Stop on first error, keep resources            |
| `packer build -on-error=cleanup ...`            | Cleanup temp resources on failure              |

**Best Practice:**
- Always validate and format templates before building.
- Review logs for API/SSH/permission errors.

---

## 💡 Pro Tips, Best Practices, Gotchas

- **Use source AMI/image filters** for up-to-date base images.
- **Keep secrets out of templates:** Use environment variables, vaults, or CI/CD secrets management.
- **Idempotency:** Provisioners should be idempotent—re-running shouldn’t break the image.
- **Template reusability:** Use variables and modular source/build blocks.
- **AMI/Image lifecycle:** Tag images and clean up old ones automatically (see post-processors).
- **Always pin your plugins in HCL2:** `packer init` handles plugin versions.
- **Test images in lower environments** before promoting to production.

---

## ✅ Quick Wins Checklist

| Task                      | Command / Pattern                                              |
|---------------------------|---------------------------------------------------------------|
| Format HCL2 template      | `packer fmt .`                                                |
| Validate template         | `packer validate template.pkr.hcl`                            |
| Build with variables      | `packer build -var-file=vars.pkrvars.hcl template.pkr.hcl`    |
| Debug a build             | `PACKER_LOG=DEBUG packer build template.pkr.hcl`              |
| Select only one builder   | `packer build -only=amazon-ebs.template ...`                  |
| Output AMI/Image ID       | Use `artifact_id` in CI/CD or post-processor                  |
| Clean up failed builds    | Use `-on-error=cleanup`                                       |

---
