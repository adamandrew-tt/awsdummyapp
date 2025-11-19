# Variables
$acrName = "contregttdatabricksapp"
$acrLoginServer = "$acrName.azurecr.io"
$imageName = "dummyapp"
$imageTag = "latest"
$dockerfilePath = "."
$resourceGroup = "rg-ttdatabricksapp-dev-uks"

# 1. Login to Azure
Write-Host "Logging into Azure..."
az login

# 2. Login to ACR
Write-Host "Logging into Azure Container Registry..."
az acr login --name $acrName

# 3. Build Docker image
Write-Host "Building Docker image..."
docker build -t "${acrLoginServer}/${imageName}:${imageTag}" ${dockerfilePath}

# 4. Push image to ACR
Write-Host "Pushing image to ACR..."
docker push "${acrLoginServer}/${imageName}:${imageTag}"

Write-Host "Image pushed successfully to ${acrLoginServer}/${imageName}:${imageTag}"

