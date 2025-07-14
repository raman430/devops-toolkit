# 🚀 AWS CLI Cheatsheet (Senior/Lead DevOps Reference)
## 🛠️ Setup & Profile Management

| Command                                               | Description                                        |
|-------------------------------------------------------|----------------------------------------------------|
| `aws configure`                                       | Set up credentials interactively                   |
| `aws configure --profile <name>`                      | Setup a named profile                              |
| `aws configure list-profiles`                         | List all profiles                                  |
| `aws sso login --profile <profile>`                   | Log in using AWS SSO                               |
| `export AWS_PROFILE=<profile>`                        | Set default profile for session                    |
| `aws configure set region <region> --profile <name>`  | Set default region for profile                     |

---

## 👤 Identity & Permissions

| Command                                                        | Description                    |
|----------------------------------------------------------------|--------------------------------|
| `aws sts get-caller-identity [--profile <profile>]`            | Who am I? (ARN, Account, User) |
| `aws iam list-users --profile <profile>`                       | List IAM users                 |
| `aws iam list-roles --profile <profile>`                       | List IAM roles                 |
| `aws iam get-user --profile <profile>`                         | Get current IAM user           |

**Pro Tip:**  
Always check your identity and permissions before running critical commands, especially in production.

---

## 🗄️ S3 (Simple Storage Service)

| Command                                                              | Description                                |
|----------------------------------------------------------------------|--------------------------------------------|
| `aws s3 ls --profile <profile>`                                      | List S3 buckets                            |
| `aws s3 ls s3://<bucket>`                                            | List contents of a bucket                  |
| `aws s3 cp file.txt s3://<bucket>/file.txt`                          | Copy file to S3 bucket                     |
| `aws s3 sync ./localdir s3://<bucket>/dir`                           | Sync directory to S3                       |
| `aws s3 rm s3://<bucket>/file.txt`                                   | Remove file from S3 bucket                 |
| `aws s3api list-buckets`                                             | List buckets using API (for scripting)     |
| `aws s3api get-bucket-location --bucket <bucket>`                    | Show bucket region                         |

**Gotcha:**  
- Use `aws s3` for high-level and `aws s3api` for fine-grained control.
- S3 operations are region-specific only when using `s3api`.

---

## 🖥️ EC2 (Elastic Compute Cloud)

| Command                                                               | Description                                |
|-----------------------------------------------------------------------|--------------------------------------------|
| `aws ec2 describe-instances --profile <profile>`                      | List EC2 instances                         |
| `aws ec2 start-instances --instance-ids <id> --profile <profile>`     | Start instance                             |
| `aws ec2 stop-instances --instance-ids <id> --profile <profile>`      | Stop instance                              |
| `aws ec2 terminate-instances --instance-ids <id> --profile <profile>` | Terminate instance                         |
| `aws ec2 describe-security-groups --profile <profile>`                | List security groups                       |
| `aws ec2 describe-images --owners self --profile <profile>`           | List your custom AMIs                      |
| `aws ec2 create-image --instance-id <id> --name "backup-yyyymmdd"`    | Create AMI from instance                   |

**Best Practice:**  
- Tag instances and resources on creation for easier management.
- Use `--filters` to narrow queries:
  ```sh
  aws ec2 describe-instances --filters "Name=tag:Env,Values=prod"


# 🚀 AWS CLI Cheatsheet (Senior/Lead DevOps Reference)

---

## 🔐 IAM (Identity & Access Management)

| Command                                                                                  | Description               |
|------------------------------------------------------------------------------------------|---------------------------|
| `aws iam list-users`                                                                     | List all IAM users        |
| `aws iam list-policies`                                                                  | List all IAM policies     |
| `aws iam get-policy --policy-arn <arn>`                                                  | Show details for a policy |
| `aws iam attach-user-policy --user-name <user> --policy-arn <arn>`                       | Attach policy to user     |

---

## 📊 CloudWatch (Monitoring & Logs)

| Command                                                                                       | Description                     |
|-----------------------------------------------------------------------------------------------|---------------------------------|
| `aws cloudwatch list-metrics --namespace AWS/EC2`                                             | List EC2 metrics                |
| `aws cloudwatch get-metric-data ...`                                                          | Query metric data               |
| `aws logs describe-log-groups`                                                                | List log groups                 |
| `aws logs tail /aws/lambda/<function> --follow`                                               | Tail Lambda logs live           |
| `aws logs get-log-events --log-group-name <group> --log-stream-name <stream>`                 | Fetch logs from stream          |

---

## 🛠️ Lambda & Serverless

| Command                                                                                           | Description                       |
|---------------------------------------------------------------------------------------------------|-----------------------------------|
| `aws lambda list-functions`                                                                       | List all Lambda functions         |
| `aws lambda get-function --function-name <name>`                                                  | Get function details              |
| `aws lambda invoke --function-name <name> out.json`                                               | Invoke function (save output)     |
| `aws lambda update-function-code --function-name <name> --zip-file fileb://function.zip`           | Update Lambda code                |

---

## 🌐 VPC & Networking

| Command                                 | Description            |
|------------------------------------------|------------------------|
| `aws ec2 describe-vpcs`                  | List all VPCs          |
| `aws ec2 describe-subnets`               | List all subnets       |
| `aws ec2 describe-route-tables`          | List route tables      |
| `aws ec2 describe-network-interfaces`    | List ENIs              |
| `aws ec2 describe-security-groups`       | List security groups   |
| `aws ec2 describe-addresses`             | List elastic IPs       |

**Pro Tip:**  
Use `--filters` for efficient queries, e.g.:
```sh
aws ec2 describe-vpcs --filters "Name=vpc-id,Values=vpc-xxxxxxx"


# 🔑 Secrets Manager & Parameter Store

| Command                                                                                         | Description                        |
|-------------------------------------------------------------------------------------------------|------------------------------------|
| `aws secretsmanager list-secrets`                                                               | List all secrets                   |
| `aws secretsmanager get-secret-value --secret-id <name>`                                        | Retrieve secret value              |
| `aws ssm get-parameter --name <name> --with-decryption`                                         | Get SSM parameter (decrypted)      |
| `aws ssm put-parameter --name <name> --value <val> --type SecureString`                         | Store secure param                 |

---

## 🕵️‍♂️ Troubleshooting & Debug

| Command                                                           | Description                                 |
|-------------------------------------------------------------------|---------------------------------------------|
| `aws configure list`                                              | Show loaded config & credentials            |
| `aws sts get-caller-identity`                                     | Who am I? (IAM details)                     |
| `aws <service> <command> --debug`                                 | Show HTTP/API debug output                  |
| `aws s3 ls --profile <profile>`                                   | Check if profile is working                 |
| `aws ec2 describe-instances --output table`                       | Use table output for readability            |
| `aws <service> <command> --output json \| jq ... \| column -t`    | Pretty-print results for wide output        |

**Gotcha:**  
- Make sure you’re using the correct profile and region.
- For SSO, re-run `aws sso login` if your session expires.

---

## 🦾 Pro Tips, Best Practices, Gotchas

- **Set default region/profile in your shell:**
  ```sh
  export AWS_PROFILE=dev
  export AWS_DEFAULT_REGION=eu-west-2


For wide/tabular data:
aws ec2 describe-instances --output json | jq -r '.Reservations[].Instances[] | [.InstanceId, .InstanceType, .State.Name] | @tsv' | column -t

## ✅ Quick Wins Checklist

| Task                      | Command Example                                        |
|---------------------------|-------------------------------------------------------|
| Confirm login/profile     | `aws sts get-caller-identity --profile dev`           |
| List all S3 buckets       | `aws s3 ls --profile dev`                             |
| Start/stop EC2            | `aws ec2 start-instances --instance-ids i-xxx`        |
| Tail Lambda logs          | `aws logs tail /aws/lambda/func --follow`             |
| Retrieve a secret         | `aws secretsmanager get-secret-value --secret-id <name>` |
| List instances (readable) | `aws ec2 describe-instances --output table`           |


# Traversing from Basic - Intermediate - Advanced using a AWS CLI logically:
Basic:
# 1. Show help for the SSM service (discover available commands)
aws ssm help

# 2. Show help for 'describe-parameters' (see all options)
aws ssm describe-parameters help

# 3. List all SSM parameters (raw output, paginated)
aws ssm describe-parameters

# 4. List just parameter names (text format)
aws ssm describe-parameters --query "Parameters[*].Name" --output text

# 5. List just parameter names (table format)
aws ssm describe-parameters --query "Parameters[*].Name" --output table

Intermediate:
# 6. List parameter names and types (table)
aws ssm describe-parameters --query "Parameters[*].[Name,Type]" --output table

# 7. List names, types, and KMS KeyId (for SecureString params)
aws ssm describe-parameters --query "Parameters[*].[Name,Type,KeyId]" --output table

# 8. List names, types, versions, and last modified date
aws ssm describe-parameters --query "Parameters[*].[Name,Type,Version,LastModifiedDate]" --output table

# 9. List only SecureString parameters (table)
aws ssm describe-parameters --query "Parameters[?Type=='SecureString'].[Name,KeyId]" --output table

# 10. Filter parameters by name prefix (e.g., "/my/app/")
aws ssm describe-parameters --parameter-filters Key=Name,Option=BeginsWith,Values="/my/app/"

# 11. Combine query and grep for quick ad-hoc filtering (text output)
aws ssm describe-parameters --query "Parameters[*].Name" --output text | grep prod

# 12. Output as table, grep for substring (e.g., SecureString)
aws ssm describe-parameters --query "Parameters[*].[Name,Type,KeyId]" --output table | grep SecureString

Advanced:
# 13. Get all parameters without pagination (be careful if you have thousands)
aws ssm describe-parameters --query "Parameters[*].Name" --output text --no-paginate

# 14. Scroll output interactively using 'less'
aws ssm describe-parameters --query "Parameters[*].Name" --output table --no-paginate | less

# 15. Export all parameter names to a file for further analysis
aws ssm describe-parameters --query "Parameters[*].Name" --output text --no-paginate > ssm_names.txt

# 16. Get parameters by path (organized by prefix, auto-paginates)
aws ssm get-parameters-by-path --path "/your/prefix/" --recursive --query "Parameters[*].Name" --output table

# 17. Grep for multiple words (e.g., 'prod' or 'staging') in the output
aws ssm describe-parameters --query "Parameters[*].[Name,Type]" --output table | grep -E 'prod|staging'

# 18. Grep for specific KMS KeyId substring in the output table
aws ssm describe-parameters --query "Parameters[*].[Name,Type,KeyId]" --output table | grep "kms"

# 19. Use jq for more powerful filtering on JSON output (advanced, requires jq)
aws ssm describe-parameters --output json --no-paginate | jq -r '.Parameters[] | select(.Name | test("my-app")) | .Name'

# 20. For very large result sets: paginate manually using NextToken (bash loop, advanced scripting)
# (Sample pseudocode)
NEXT_TOKEN=""
while : ; do
    if [ -z "$NEXT_TOKEN" ]; then
        OUT=$(aws ssm describe-parameters)
    else
        OUT=$(aws ssm describe-parameters --starting-token "$NEXT_TOKEN")
    fi
    echo "$OUT" | jq -r '.Parameters[].Name'
    NEXT_TOKEN=$(echo "$OUT" | jq -r '.NextToken // empty')
    [ -z "$NEXT_TOKEN" ] && break
done

# 21. Combine with awk/cut for field extraction (e.g., print only name column)
aws ssm describe-parameters --query "Parameters[*].[Name,Type]" --output table | grep prod | awk '{print $2}'
