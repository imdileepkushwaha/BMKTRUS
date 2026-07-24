# BMKTRUST filesystem publish
# Excludes folders not needed on IIS.
# Usage: .\publish.ps1

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$src = Join-Path $root "BMKTRUST"
$pub = Join-Path $root "Publish"
$zip = Join-Path $root "BMKTRUST_Publish.zip"
$msb = "C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe"
$aspnet = Join-Path $env:WINDIR "Microsoft.NET\Framework64\v4.0.30319\aspnet_compiler.exe"

# Top-level folders safe to omit from server upload
$excludeDirs = @(
    "node_modules",   # npm build tooling (~116 MB) — no page refs
    "build",          # AdminLTE grunt/less sources
    "HomeCss",        # unused theme CSS
    "new_assets",     # duplicate of user/new_assets (user pages use relative user path)
    "App_Data",       # VS publish profiles only
    "App_Code",       # compiled into Bin — never upload source to precompiled site
    ".git",
    ".vs",
    "obj"
)

Write-Host "== Build class libraries =="
& $msb (Join-Path $root "BusinessLogicTier\BusinessLogicTier.csproj") /t:Build /p:Configuration=Debug /v:minimal
if ($LASTEXITCODE -ne 0) { throw "BusinessLogicTier build failed" }

Copy-Item (Join-Path $root "BusinessLogicTier\bin\Debug\BusinessLogicTier.dll") (Join-Path $src "Bin\BusinessLogicTier.dll") -Force
Copy-Item (Join-Path $root "DataTier\bin\Debug\DataTier.dll") (Join-Path $src "Bin\DataTier.dll") -Force

Write-Host "== Precompile site to $pub =="
if (Test-Path $pub) { Remove-Item $pub -Recurse -Force }
& $aspnet -v /BMKTRUST -p $src -f -u $pub
if ($LASTEXITCODE -ne 0) { throw "aspnet_compiler failed" }

foreach ($dir in $excludeDirs) {
    $p = Join-Path $pub $dir
    if (Test-Path $p) {
        Write-Host "Removing $dir from publish output..."
        Remove-Item $p -Recurse -Force
    }
}

# Drop obvious non-runtime root files if present
$excludeFiles = @(".gitignore", "LICENSE", "website.publishproj", "Cbsindia.v11.suo")
foreach ($f in $excludeFiles) {
    $p = Join-Path $pub $f
    if (Test-Path $p) { Remove-Item $p -Force }
}

$sizeMb = [math]::Round((Get-ChildItem $pub -Recurse -File | Measure-Object Length -Sum).Sum / 1MB, 2)
Write-Host "Publish ready: $pub ($sizeMb MB)"

Write-Host "== Creating zip =="
if (Test-Path $zip) { Remove-Item $zip -Force }
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($pub, $zip, [System.IO.Compression.CompressionLevel]::Fastest, $false)
$zipMb = [math]::Round((Get-Item $zip).Length / 1MB, 2)
Write-Host "Zip ready: $zip ($zipMb MB)"
