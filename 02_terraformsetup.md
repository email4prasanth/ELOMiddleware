### Terraform setup and RG deplpyment
> Prerequisites:
    > Check the az login and subscription **az account list --output table**
    > Verify the Backend Configuration **provider.tf**
    > terraform setup

1. Create Workspace
```sh
terraform init ( this will create .terraform.lock.hcl file)
terraform workspace show
terraform workspace new dev
terraform workspace new preprod (if required)
terraform workspace new prod (if required)
terraform workspace list
```
2. Run the following commands
```sh
terraform init
terraform fmt
terraform validate
```
### If local.tf is used
3. Select dev/preprod/prod and deploy Resource group
```sh
terraform workspace select dev
terraform plan 
terraform apply --auto-approve
terraform state list
terraform output
terraform destroy --auto-approve
```
### If variable.tf and .tfvars are used
3. Select dev and deploy Resource group
```sh
terraform workspace select dev
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars" --auto-approve
terraform state list
terraform output
terraform destroy -var-file="dev.tfvars" --auto-approve
```
4. Select pre-prod and deploy Resource group
```sh
terraform workspace select preprod
terraform plan -var-file="preprod.tfvars"
terraform apply -var-file="preprod.tfvars" --auto-approve
terraform state list
terraform output
```
5. Select prod and deploy Resource group
```sh
terraform workspace select prod
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars" --auto-approve
terraform state list
terraform output
```
6. To destroy setup
```sh
terraform workspace select prod
terraform destroy -var-file="prod.tfvars" --auto-approve
terraform workspace select preprod
terraform destroy -var-file="preprod.tfvars" --auto-approve
```