## BackendConfig
- To store terraform state file iam using azure cli to create resources, the backend configuration setup contain
  - Resource group
  - Storage account
  - Storage container
- Since, No roles appear, you may need Owner/Contributor permissions from your Azure administrator. Used console to create create Resource group, StorageAccount and Container
```sh
az account list --output table
az role assignment list `
  --subscription ceb3ae8b-a788-4e9d-965b-3c3250fdf106 `
  --assignee $(az ad signed-in-user show --query id -o tsv) `
  -o table
```

- Backend configuration setup
```sh
az provider register --namespace Microsoft.Storage
az provider show --namespace Microsoft.Storage --query registrationState -o tsv


$RG="elomiddleware-terraform"; `
$Location="eastus"; `
$StorageAccount="testelohubtf"; `
$ContainerName="terraformstate"; `
New-AzResourceGroup -Name $RG -Location $Location | Out-Null; `
New-AzStorageAccount -Location $Location -ResourceGroupName $RG -Type "Standard_LRS" -Name $StorageAccount | Out-Null; `
$StorageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $RG -Name $StorageAccount)[0].Value; `
$StorageContext = New-AzStorageContext -StorageAccountName $StorageAccount -StorageAccountKey $StorageAccountKey; `
# Create blob container
New-AzStorageContainer -Name $ContainerName -Context $StorageContext -Permission Off;`
Write-Output "Automation complete."
```
- To destroy configuration setup
```sh
$RG="elomiddleware-terraform"; `
$Location="eastus"; `
$StorageAccount="testelohubtf"; `
$ContainerName="terraformstate"; `
Remove-AzStorageContainer -Name $ContainerName -Context $StorageContext -Force; `
Remove-AzStorageAccount -ResourceGroupName $RG -Name $StorageAccount -Force; `
Remove-AzResourceGroup -Name $RG -Force; `
Remove-Variable -Name RG -Force; `
Remove-Variable -Name Location -Force; `
Remove-Variable -Name StorageAccount -Force; `
Remove-Variable -Name ContainerName -Force; `
Remove-Variable -Name StorageAccountKey -Force -ErrorAction SilentlyContinue; `
Remove-Variable -Name StorageContext -Force -ErrorAction SilentlyContinue; `
Write-Output "Resources and variables deleted successfully.";
```
