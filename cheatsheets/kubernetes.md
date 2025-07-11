
---

# **cheatsheets/kubernetes.md**

```markdown
# Kubernetes Cheat Sheet (Senior DevOps)

---

## 1. Context & Namespaces

| Command                                        | Description                      |
|------------------------------------------------|----------------------------------|
| `kubectl config get-contexts`                  | List available contexts          |
| `kubectl config use-context <ctx>`             | Switch context                   |
| `kubectl get ns`                               | List namespaces                  |
| `kubectl config set-context --current --namespace=<ns>` | Set default namespace |

---

## 2. Pods & Workloads

| Command                                        | Description                      |
|------------------------------------------------|----------------------------------|
| `kubectl get pods -A`                          | All pods in all namespaces       |
| `kubectl get pod <pod> -n <ns> -o yaml`        | Pod YAML manifest                |
| `kubectl describe pod <pod> -n <ns>`           | Pod details and events           |
| `kubectl logs <pod> -n <ns>`                   | Pod logs                         |
| `kubectl logs <pod> -n <ns> -c <container>`    | Logs for specific container      |
| `kubectl exec -it <pod> -n <ns> -- /bin/sh`    | Shell into pod                   |

---

## 3. Deployments & Resources

| Command                                    | Description                       |
|---------------------------------------------|-----------------------------------|
| `kubectl get deploy -n <ns>`                | Deployments in namespace          |
| `kubectl edit deploy <deploy> -n <ns>`      | Edit deployment live              |
| `kubectl rollout status deploy/<name> -n <ns>` | Check rollout progress           |
| `kubectl rollout undo deploy/<name> -n <ns>`   | Rollback deployment              |
| `kubectl scale deploy/<name> --replicas=3 -n <ns>` | Change replica count           |

---

## 4. Services, Ingress, ConfigMaps

| Command                                    | Description                       |
|---------------------------------------------|-----------------------------------|
| `kubectl get svc -n <ns>`                   | List services                     |
| `kubectl get ing -n <ns>`                   | List ingress objects              |
| `kubectl get cm -n <ns>`                    | List ConfigMaps                   |
| `kubectl describe svc <name> -n <ns>`       | Service details                   |

---

## 5. YAML, Apply, and Delete

| Command                                    | Description                        |
|---------------------------------------------|------------------------------------|
| `kubectl apply -f file.yaml`                | Apply resource                     |
| `kubectl delete -f file.yaml`               | Delete resource                    |
| `kubectl get all -n <ns>`                   | All resources in namespace         |
| `kubectl diff -f file.yaml`                 | Diff changes before applying       |
| `kubectl explain <resource>`                | Show resource schema/docs          |

---

## 6. Troubleshooting

- **Check Events:**  
  `kubectl get events -n <ns> --sort-by='.metadata.creationTimestamp'`

- **Pod/Node Status:**  
  `kubectl get pods -o wide -n <ns>`  
  `kubectl describe node <node>`

- **CrashLoopBackOff:**  
  - Check logs, events, and imagePull errors
  - `kubectl logs <pod> -n <ns>`
  - `kubectl describe pod <pod> -n <ns>`

- **DNS Debug:**  
  - `kubectl run -i --rm debug --image=busybox --restart=Never -- sh`
  - Inside: `nslookup kubernetes.default`

---

## 7. Pro Tips

- **Aliases:**  
  ```sh
  alias k='kubectl'
  alias kgp='kubectl get pods -o wide'
  alias kgn='kubectl get nodes -o wide'

## 8. Helm


helm repo add, helm install, helm upgrade, helm list

YAML Validation:

kubectl apply --dry-run=client -f file.yaml

Bulk Delete:

kubectl delete pod --all -n <ns>