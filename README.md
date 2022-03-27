GitOps! Deploy a simple nginx website to AWS EKS using Terraform and HELM, all triggered by GitHub Actions

./terraform/dev holds the terraform plan used below

How to use:

0. Create secrets in the github projects settings page (/secrets/Actions) see info below 
1. git checkout -b new_branch
2. Edit (./docker/index.html) (not needed on the first run) 
3. git add -A , git Push 
4. Create a Pull Request
5. Github actions will start (/.github/workflows/plan-on-pr.yaml) and run terraform plan
6. Examine plan 
7. Approve the Pull Request and merge to main
8. Github action will start (/.github/workflows/apply-on-merge.yaml) and do the following actions:
    1. init AWS, terraform
    2. build a docker file using ./docker/Dockerfile 
    3. upload it to Docker HUB
    4. Run terraform apply to provision AWS EKS
    5. deploy the helm chart to kubernetes 

Repository secrets needed:

1. ALLOWED_ACCOUNT_ID - AWS account ID
2. AWS_ACCESS_KEY_ID
3. AWS_SECRET_ACCESS_KEY
4. DOCKER_USER - Docker hub free account
5. DOCKER_PASSWORD 
