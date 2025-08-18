$ErrorActionPreference = 'Stop'

$moduleDir = Resolve-Path (Join-Path -Path $PSScriptRoot -ChildPath "..\module")
$outZip = Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -ChildPath 'install.zip'

if (-not (Test-Path $moduleDir)) { throw "Missing module/ directory" }

# Create ZIP of module/ without extra nesting
if (Test-Path $outZip) { Remove-Item $outZip -Force }

# Use .NET zip to preserve structure
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($moduleDir, $outZip)

Write-Host "Created $outZip"
