Deploy a simple nginx website to AWS EKS using Terraform and HELM, all triggered by GitHub Actions

How to use:
0 - Create secrets in the github projects settings page (/secrets/Actions) see info below <b>
1 - git checkout -b new_branch
2 - Edit (./docker/index.html) (not needed on the first run) 
3 - git add -A , git Push 
4 - Create a Pull Request
5 - Github actions will start (/.github/workflows/plan-on-pr.yaml) and run terraform plan
6 - Examine plan 
7 - Approve the Pull Request and merge to main
8 - Github action will start (/.github/workflows/apply-on-merge.yaml) and do the following actions:
    a. init AWS, terraform
    b. build a docker file using ./docker/Dockerfile 
    c. upload it to Docker HUB
    d. Run terraform apply to provision AWS EKS
    e. deploy the helm chart to kubernetes 

Repository secrets:

ALLOWED_ACCOUNT_ID - AWS account ID
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
DOCKER_USER - Docker hub free account
DOCKER_PASSWORD 



#metrics
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
