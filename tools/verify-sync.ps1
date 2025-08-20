$ErrorActionPreference = 'Stop'

$moduleProp = Resolve-Path (Join-Path -Path $PSScriptRoot -ChildPath "..\module\module.prop")
$updateJson = Resolve-Path (Join-Path -Path $PSScriptRoot -ChildPath "..\update.json")

$prop = Get-Content $moduleProp
$ver = ($prop | Select-String '^version=').ToString().Split('=')[1].Trim()
$verCode = ($prop | Select-String '^versionCode=').ToString().Split('=')[1].Trim()

$json = Get-Content $updateJson | ConvertFrom-Json

$ok = $true
if ($json.version -ne $ver) {
    Write-Host "version mismatch: module.prop=$ver update.json=$($json.version)" -ForegroundColor Yellow
    $ok = $false
}
if ($json.versionCode.ToString() -ne $verCode) {
    Write-Host "versionCode mismatch: module.prop=$verCode update.json=$($json.versionCode)" -ForegroundColor Yellow
    $ok = $false
}

if ($ok) { Write-Host "Versions are in sync: $ver ($verCode)" -ForegroundColor Green } else { exit 1 }
