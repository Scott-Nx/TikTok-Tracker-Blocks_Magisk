param(
    [Parameter(Mandatory = $true)][string]$Version, # format vYYYY.MM.DD-rN
    [Parameter(Mandatory = $true)][int64]$VersionCode # format YYYYMMDDRNN
)

$ErrorActionPreference = 'Stop'

# Files to update
$moduleProp = Resolve-Path (Join-Path -Path $PSScriptRoot -ChildPath "..\module\module.prop")
$updateJson = Resolve-Path (Join-Path -Path $PSScriptRoot -ChildPath "..\update.json")

# Validate formats quickly
if ($Version -notmatch '^v\d{4}\.\d{2}\.\d{2}-r\d+$') {
    throw "Version must match vYYYY.MM.DD-rN"
}
if ($VersionCode -notmatch '^[0-9]{9,}$') {
    throw "VersionCode must be numeric, like YYYYMMDDRNN"
}

# Update module.prop
$prop = Get-Content $moduleProp -Raw
$prop = ($prop -replace '(?m)^version=.*$', "version=$Version")
$prop = ($prop -replace '(?m)^versionCode=.*$', "versionCode=$VersionCode")
Set-Content -NoNewline -Path $moduleProp -Value $prop

# Update update.json
$json = Get-Content $updateJson | ConvertFrom-Json
$json.version = $Version
$json.versionCode = [int64]$VersionCode
$json | ConvertTo-Json -Depth 5 | Set-Content -NoNewline $updateJson

Write-Host "Updated versions to $Version ($VersionCode) in module.prop and update.json"
