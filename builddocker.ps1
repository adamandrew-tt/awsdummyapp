$envFile = ".env"
$imageName  = "helloworld"

if (Test-Path $envFile) {
    Write-Host "Loading environment variables from $envFile..."
    Get-Content $envFile | ForEach-Object {
        if ($_ -match "^\s*#") { return }       # Skip comments
        if ($_ -match "^\s*$") { return }       # Skip empty lines
        $name, $value = $_ -split "=", 2
        $name = $name.Trim()
        $value = $value.Trim()
        [System.Environment]::SetEnvironmentVariable($name, $value)
    }
}

docker build -t $imageName .

if ($LASTEXITCODE -ne 0) {
    Write-Error "Docker build failed. Exiting."
    exit 1
}

Write-Host "Running Docker container from '$imageName'..."
docker run --env-file $envFile -p 80:80 $imageName



