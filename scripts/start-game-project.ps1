param(
    [string]$ProjectPath = (Get-Location).Path,
    [string]$ProjectName = "Godot Game",
    [string]$Genre = "custom",
    [string]$TargetPlatform = "desktop",
    [string]$Perspective = "2D",
    [string]$ArtStyle = "clear readable prototype art",
    [switch]$SetupMcp,
    [switch]$InstallGodotIQ,
    [switch]$InstallAddon,
    [switch]$ForceDocs
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $ProjectPath)) {
    New-Item -ItemType Directory -Path $ProjectPath | Out-Null
}

$resolvedProject = (Resolve-Path -LiteralPath $ProjectPath).ProviderPath
$projectFile = Join-Path $resolvedProject "project.godot"

if (-not (Test-Path -LiteralPath $projectFile)) {
    & (Join-Path $PSScriptRoot "new-godot-project.ps1") -ProjectPath $resolvedProject -ProjectName $ProjectName
} else {
    Write-Host "Existing Godot project found: $projectFile"
}

& (Join-Path $PSScriptRoot "create-game-docs.ps1") `
    -ProjectPath $resolvedProject `
    -ProjectName $ProjectName `
    -Genre $Genre `
    -TargetPlatform $TargetPlatform `
    -Perspective $Perspective `
    -ArtStyle $ArtStyle `
    -Force:$ForceDocs

if ($SetupMcp) {
    & (Join-Path $PSScriptRoot "setup-godot-mcp.ps1") `
        -ProjectPath $resolvedProject `
        -InstallGodotIQ:$InstallGodotIQ `
        -InstallAddon:$InstallAddon
}

Write-Host "Godot game project bootstrap complete: $resolvedProject"
