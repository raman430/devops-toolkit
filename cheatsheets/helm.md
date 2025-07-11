# 🚀 Helm Cheatsheet (Senior/Lead DevOps Reference)

## 📦 Intro & Context

- **Helm** is the de-facto package manager for Kubernetes, enabling deployment, upgrade, and management of complex applications using "charts."
- Used for GitOps, CI/CD, multi-environment deployments, and repeatable infrastructure.

---

## 📚 Repo Management

| Command                                         | Description                              |
|-------------------------------------------------|------------------------------------------|
| `helm repo add <name> <url>`                    | Add a chart repository                   |
| `helm repo list`                                | List added repositories                  |
| `helm repo update`                              | Refresh repository indexes               |
| `helm search repo <keyword>`                    | Search charts in all repos               |

**Pro Tip:**  
Add [Bitnami](https://charts.bitnami.com/bitnami) and [Artifact Hub](https://artifacthub.io/) for a wide selection of production-grade charts.

---

## 🔍 Chart Discovery & Inspection

| Command                                         | Description                              |
|-------------------------------------------------|------------------------------------------|
| `helm search hub <keyword>`                     | Search official Helm Hub                 |
| `helm show chart <chart>`                       | Show chart metadata                      |
| `helm show values <chart>`                      | Show default values.yaml                 |
| `helm show readme <chart>`                      | Show chart README                        |

---

## 🚀 Chart Deployment & Upgrade

| Command                                                                | Description                         |
|------------------------------------------------------------------------|-------------------------------------|
| `helm install <release> <chart> [--namespace <ns>]`                    | Install a chart as a named release  |
| `helm upgrade <release> <chart> [flags]`                               | Upgrade an existing release         |
| `helm upgrade --install <release> <chart> [flags]`                     | Upgrade or install (if missing)     |
| `helm uninstall <release> [--namespace <ns>]`                          | Remove release and all resources    |
| `helm list [--all-namespaces]`                                         | List all Helm releases              |
| `helm history <release>`                                               | Show revision history for release   |
| `helm get all <release>`                                               | Get manifest, values, notes, hooks  |

**Best Practice:**  
Always use `--namespace` for multi-tenant clusters.  
Always pin chart versions for reproducible deploys.

---

## 🛠️ Values & Customization

| Command / Pattern                                                | Description                           |
|------------------------------------------------------------------|---------------------------------------|
| `helm install ... -f my-values.yaml`                             | Override default values               |
| `helm upgrade ... -f my-values.yaml`                             | Upgrade with custom values            |
| `helm install ... --set foo=bar,replicaCount=2`                  | Set individual values on the CLI      |
| `helm get values <release>`                                      | Get values of a release               |
| `helm diff upgrade <release> <chart> -f my-values.yaml`          | Preview changes (needs plugin)        |

**Pro Tip:**  
- Use environment-specific values files (e.g., `values-prod.yaml`).
- Use `helm show values <chart>` to generate a new values file for overrides.

---

## 🧩 Helm Release Management

| Command                                              | Description                                 |
|------------------------------------------------------|---------------------------------------------|
| `helm list --namespace <ns>`                         | List releases in namespace                  |
| `helm status <release>`                              | Release status and resource summary         |
| `helm rollback <release> <revision>`                 | Roll back to a previous release             |
| `helm get manifest <release>`                        | Show rendered Kubernetes manifests          |
| `helm get hooks <release>`                           | Show lifecycle hooks (pre/post install etc) |

---

## 🧬 Templating & Debugging

| Command                                                | Description                           |
|--------------------------------------------------------|---------------------------------------|
| `helm template <chart> -f my-values.yaml`              | Render chart as plain manifests       |
| `helm lint <chart>`                                    | Lint and validate a chart             |
| `helm install ... --dry-run --debug`                   | Simulate install with debug output    |
| `helm dependency update <chart-dir>`                   | Update chart dependencies             |
| `helm show values <chart>`                             | Print default values file             |

---

## ⏪ Rollback & Uninstall

| Command                                  | Description                        |
|-------------------------------------------|------------------------------------|
| `helm rollback <release> <revision>`      | Rollback to specific release rev   |
| `helm uninstall <release>`                | Delete a release                   |
| `helm history <release>`                  | List all revisions for a release   |

**Gotcha:**  
Rollback does not undo changes made outside of Helm (e.g., `kubectl apply` edits)!

---

## 🔐 Secrets, Security & Best Practices

- Avoid storing secrets in values.yaml; use [Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets) or external secret managers.
- Restrict `--set` usage for sensitive data (may be logged in CI/CD).
- Use RBAC and namespaces to limit blast radius.
- Prefer `helm lint` before install/upgrade, especially with custom templates.
- Version-lock chart dependencies in `Chart.yaml`.
- Store all custom charts and values files in Git.

---

## 🩺 Troubleshooting

| Command / Pattern                                    | Description                                   |
|------------------------------------------------------|-----------------------------------------------|
| `helm status <release>`                              | See deployment status and errors              |
| `helm get all <release>`                             | See everything about a release                |
| `helm list --failed`                                 | List failed releases                          |
| `kubectl get events --namespace <ns>`                | Check cluster events for related errors       |
| `helm uninstall <release> && helm install ...`       | Redeploy if stuck in failed state             |
| `helm template ... | kubectl apply -f -`             | Manual manifest apply for debugging           |

**Gotcha:**  
A failed install/upgrade often leaves partial resources—clean up or rollback before retrying.

---

## 💡 Pro Tips, Gotchas & Advanced Usage

- **Use `helm diff` plugin:**  
  `helm plugin install https://github.com/databus23/helm-diff`  
  - Preview manifest changes before applying (CI/CD gold).
- **DRY-run + Debug:**  
  `helm upgrade --install ... --dry-run --debug`
- **Validate custom charts:**  
  Always run `helm lint <chart-dir>` before production deploys.
- **CI/CD Integration:**  
  Pin exact chart versions; run templating/linting as a pre-deploy step.
- **Multi-environment:**  
  Keep a separate values file for each environment; do not mix secrets.

---

## ✅ Quick Wins Checklist

| Task                             | Command Example                                            |
|-----------------------------------|-----------------------------------------------------------|
| Add repo & update                 | `helm repo add bitnami https://charts.bitnami.com/bitnami`<br>`helm repo update` |
| Find & inspect a chart            | `helm search repo nginx`<br>`helm show values bitnami/nginx` |
| Install/Upgrade with custom values| `helm upgrade --install myapp bitnami/nginx -f prod.yaml`  |
| View release status & resources   | `helm status myapp`<br>`helm get all myapp`               |
| Rollback on error                 | `helm rollback myapp 1`                                   |
| Lint before deployment            | `helm lint ./mychart`                                     |
| Debug a template                  | `helm template ./mychart -f myvalues.yaml`                |
