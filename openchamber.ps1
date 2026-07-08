# 1. Create directory
$workDir = "D:\PythonItem\openchamer\nexus-openchamber-1.23.1"
New-Item -ItemType Directory -Path $workDir -Force | Out-Null
Set-Location -Path $workDir

# 2. Download the MAIN package for Nexus
Write-Host "Downloading main package..." -ForegroundColor Cyan
npm pack @openchamber/web@1.23.1

# 3. Create lockfile to capture ALL dependency URLs
Write-Host "Generating dependency tree..." -ForegroundColor Cyan
npm init -y | Out-Null
npm install @openchamber/web@1.23.1 --package-lock-only