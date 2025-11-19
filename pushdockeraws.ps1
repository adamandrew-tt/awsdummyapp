$imageTag = "latest"
$imageName= "dummyappaws"
$dockerfilePath = "."

$env:DOCKER_BUILDKIT=0

# Login
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 811726520296.dkr.ecr.us-east-1.amazonaws.com

# Build Docker image
Write-Host "Building Docker image..."
docker build --platform linux/amd64 -t "811726520296.dkr.ecr.us-east-1.amazonaws.com/exploratory/${imageName}:${imageTag}" ${dockerfilePath}

# Push image to ACR
Write-Host "Pushing image to ACR..."
docker push "811726520296.dkr.ecr.us-east-1.amazonaws.com/exploratory/${imageName}:${imageTag}"