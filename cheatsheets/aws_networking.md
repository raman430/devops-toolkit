# 🛠️ AWS Networking & IAM Troubleshooting Cheatsheet (Senior DevOps)

## Core Troubleshooting Process

1. **Define the Problem:** Service unreachable? Failing? Timeout? Permissions?
2. **Layered Approach:**  
   - Edge (DNS, WAF, Route53)
   - Network (VPC, NACL, SG, Gateways, CIDR)
   - Compute/Platform (ECS, EKS, Lambda, EC2)
   - App Layer (API GW, SQS, Kafka, DocDB)
   - IAM/KMS/Secrets
3. **Gather Evidence:** CloudWatch logs, Flow Logs, CloudTrail, App logs.
4. **Isolate the Failing Point:** Use connectivity tests, AWS CLI, Console.

---

## 🕸️ VPC, Subnets, Routing & Gateways

| Area / Concept                | Common Issues                     | Checks & Commands                                                          |
|-------------------------------|-----------------------------------|----------------------------------------------------------------------------|
| VPC/CIDR                      | IP exhaustion, overlap            | `aws ec2 describe-vpcs`<br>`aws ec2 describe-subnets`                       |
| Subnets                       | Wrong AZ, not enough IPs          | Check AZ & CIDR<br>`aws ec2 describe-subnets`                               |
| Route Tables                  | Missing/incorrect routes           | `aws ec2 describe-route-tables`<br>Ensure routes for IGW/NAT/Peering        |
| IGW (Internet GW)             | No route, not attached             | `aws ec2 describe-internet-gateways`<br>Check association, route table      |
| NAT Gateway                   | Misplaced in private subnet, no EIP| `aws ec2 describe-nat-gateways`<br>Check EIP and subnet placement           |
| Transit Gateway (TGW)         | Route/attachment issues            | `aws ec2 describe-transit-gateways`<br>`aws ec2 describe-transit-gateway-attachments`<br>Route Table associations |
| VPC Peering                   | No route, SG/NACL block            | `aws ec2 describe-vpc-peering-connections`<br>Check routes and SG/NACLs     |

---

## 🔐 Security Groups, NACLs & Edge

| Area / Concept        | Common Issues                    | Checks & Commands                                                      |
|-----------------------|----------------------------------|-----------------------------------------------------------------------|
| Security Groups       | Missing/incorrect rules, egress  | `aws ec2 describe-security-groups`<br>Ensure correct source/dest, port|
| NACLs                 | Explicit deny, ephemeral ports   | `aws ec2 describe-network-acls`<br>Check both inbound/outbound rules  |
| WAF                   | Blocked traffic, false positives | Check Web ACL rules in AWS WAF console<br>CloudWatch WAF logs         |
| Edge Routing (CloudFront, Global Accelerator) | Routing not propagating | Check Edge config, target health, origin responses                    |

---

## ⚖️ Load Balancers (ALB, NLB) & DNS

| Area / Concept        | Common Issues                    | Checks & Commands                                                                                   |
|-----------------------|----------------------------------|----------------------------------------------------------------------------------------------------|
| ALB (Application LB)  | Target group unhealthy, 5xx      | Check listener, target health: `aws elbv2 describe-target-health`<br>ALB logs<br>SG on targets      |
| NLB (Network LB)      | Health checks fail, wrong SG     | NLB is L4—check backend SG, subnet AZ, listener                |
| Route 53              | Wrong record, TTL, not propagated| `nslookup` or `dig` DNS, check record sets, health checks, region-specific routing                  |
| API Gateway           | 403/502 errors, CORS             | Check resource policies, integration, mapping, CloudWatch logs                                      |
| Kong EE (API Gateway) | Plugin config, auth failures     | Kong Admin API, plugin config, upstream health, JWT/secrets                                         |

---

## 🔑 IAM, KMS & Permissions

| Area / Concept        | Common Issues                      | Checks & Commands                                                           |
|-----------------------|------------------------------------|------------------------------------------------------------------------------|
| IAM Policies          | Missing/overly restrictive perms   | `aws iam simulate-principal-policy`<br>`aws iam get-policy`<br>CloudTrail    |
| KMS                   | Decrypt/Encrypt denied             | `aws kms decrypt/encrypt` test<br>Check key policy and resource policy       |
| Role Assumption       | STS denied, session timeout        | `aws sts assume-role` test<br>Check trust relationships                      |
| Lambda/ECS/EKS Roles  | No resource permission             | Check role attached and policies<br>CloudTrail for access denied             |
| S3 Bucket Policy      | Principal or action mismatch       | Check `aws s3api get-bucket-policy`<br>IAM policy sim tool                   |

**Gotcha:**  
- Remember resource policies AND identity policies BOTH apply!
- Explicit denies always override allows.

---

## 🏗️ Application Layer: Lambda, SQS, ECS, EKS, Kafka, DocDB, API GW, Kong EE

| Area           | Common Issues                     | Checks & Commands                                                      |
|----------------|-----------------------------------|-----------------------------------------------------------------------|
| Lambda         | Timeout, no logs, denied perms    | CloudWatch logs, test in console, check attached role and policy      |
| SQS            | No messages delivered/read        | `aws sqs receive-message/send-message`, check policy, dead-letter queue|
| ECS            | Task stuck, networking, IAM       | `aws ecs describe-tasks/services`, check SG, subnet, IAM role         |
| EKS            | Pod not scheduled, CNI/DNS issues | `kubectl get pods/events/nodes`, node IAM, ENI limits, CoreDNS logs   |
| Kafka (MSK)    | Broker not reachable, auth failed | MSK cluster SGs/NACLs, client IAM, check bootstrap brokers            |
| DocDB          | Connection refused, IAM/KMS fail  | SG, subnet, parameter group, KMS keys, VPC routing, TLS params        |
| API Gateway    | 4xx/5xx errors, integration fail  | CloudWatch logs, stage integration, IAM role for integration          |
| Kong EE        | Plugin error, no upstream         | Kong Admin API, upstream targets, health check, logs                  |

---

## 🪣 S3 Buckets, WAF, Edge Routing

| Area           | Common Issues                     | Checks & Commands                                                        |
|----------------|-----------------------------------|-------------------------------------------------------------------------|
| S3             | Access denied, public access      | `aws s3 ls`, bucket policy, Block Public Access settings, KMS            |
| WAF            | Legit traffic blocked             | CloudWatch WAF logs, check rules, IP reputation lists                    |
| CloudFront     | 403/504, cache issues             | CloudFront logs, cache invalidation, S3 origin policy, OAI               |
| Edge Routing   | Traffic not flowing as expected   | Check CloudFront, Route 53, Global Accelerator configurations            |

---

## 🕵️‍♂️ Monitoring & Logs

| Source          | What to Check                                     |
|-----------------|---------------------------------------------------|
| VPC Flow Logs   | Network traffic, rejected packets                 |
| CloudTrail      | API calls, permission failures, who/what/when     |
| CloudWatch Logs | Lambda, API Gateway, ECS, EKS, custom app logs    |
| ELB/ALB/NLB Logs| Backend health, request/response failures         |
| S3 Access Logs  | Object access, denied requests                    |

---

## 💡 Best Practices, Gotchas, Pro Tips

- **Start at the edge:** Route53 → WAF → ALB/NLB/API Gateway/Kong → EC2/ECS/EKS → App
- **Use layered security:** NACLs (subnet) + SG (resource) + WAF (HTTP)
- **Enable VPC Flow Logs** on all key subnets for real-time network troubleshooting
- **ALWAYS check region and profile** with CLI commands
- **Use the IAM Policy Simulator** for permissions debugging
- **Test network reachability** from instance/container (`ping`, `curl`, `traceroute`, `ss -tuln`)
- **Tag everything** (VPC, subnet, SG, endpoint, bucket) for fast troubleshooting
- **For KMS, check key policy and role permissions, not just IAM policy**
- **For ECS/EKS**, ensure correct subnet/SG and IAM role for tasks/pods
- **Avoid default VPCs for production; create your own and control routes**
- **Review CloudWatch/CloudTrail for permission and traffic issues**

---

## ✅ Quick Wins & Checklist

| Task                                 | Command/Check                                            |
|-------------------------------------- |---------------------------------------------------------|
| List VPCs, subnets, gateways         | `aws ec2 describe-vpcs/subnets/internet-gateways`        |
| Check SG/NACL rules                  | `aws ec2 describe-security-groups/network-acls`          |
| Review route tables                   | `aws ec2 describe-route-tables`                          |
| See active peering/TGW connections   | `aws ec2 describe-vpc-peering-connections/transit-gateways`|
| Confirm Lambda/IAM roles             | `aws lambda get-function-configuration`, IAM Console      |
| Tail CloudWatch logs                  | `aws logs tail <group> --follow`                         |
| Policy simulation                     | [IAM Policy Simulator](https://policysim.aws.amazon.com/) |
| Test SQS/Lambda/ECS endpoints         | `curl`, `nc`, AWS SDK/CLI                                |
| Verify S3 access                      | `aws s3 ls s3://<bucket>`                                |
| Debug Route 53/DNS                    | `dig`, `nslookup`                                        |
| EKS Pod not running                   | `kubectl describe pod`, `kubectl get events`             |
| Flow log review                       | VPC Flow Logs in CloudWatch                              |
| Find KMS permission errors            | CloudTrail, KMS console                                  |
| Kong EE/API GW health                 | Kong Admin API, CloudWatch, logs                         |
| Confirm ALB/NLB target health         | Console or CLI (`describe-target-health`)                |

---

