$version = "1.18.30"
$pkgs = @(
  "opencode-ai",
  "opencode-darwin-arm64",
  "opencode-darwin-x64",
  "opencode-darwin-x64-baseline",
  "opencode-linux-arm64",
  "opencode-linux-arm64-musl",
  "opencode-linux-x64",
  "opencode-linux-x64-baseline",
  "opencode-linux-x64-baseline-musl",
  "opencode-linux-x64-musl",
  "opencode-windows-arm64",
  "opencode-windows-x64",
  "opencode-windows-x64-baseline"
)

Write-Host "Start downloading opencode-ai version: $version" -ForegroundColor Green
foreach ($pkg in $pkgs) {
  Write-Host "Downloading: $pkg@$version" -ForegroundColor Cyan
  npm pack "${pkg}@${version}"
}
Write-Host "All 13 packages downloaded successfully!" -ForegroundColor Green