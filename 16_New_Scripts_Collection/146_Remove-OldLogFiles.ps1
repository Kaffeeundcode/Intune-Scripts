<#
.SYNOPSIS
    Rotates or deletes old log files in a specific directory.

.DESCRIPTION
    Generic maintenance tool.
    Target a folder (e.g. IIS logs, Custom App logs) and delete files older than X days.
    
    Safe mode included (WhatIf).
    
.NOTES
    File Name  : 146_Remove-OldLogFiles.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Param(
    [Parameter(Mandatory=$true)]
    [string]$TargetFolder,
    
    [int]$Days = 30,
    
    [string]$Extension = "*.log",
    
    [switch]$Force
)

if (-not (Test-Path $TargetFolder)) {
    Write-Error "Folder not found: $TargetFolder"
    exit
}

$Cutoff = (Get-Date).AddDays(-$Days)

Write-Host "Cleaning $TargetFolder (Files older than $Cutoff)..." -ForegroundColor Cyan

$Files = Get-ChildItem -Path $TargetFolder -Filter $Extension -File -Recurse

foreach ($File in $Files) {
    if ($File.LastWriteTime -lt $Cutoff) {
        if ($Force) {
            Remove-Item $File.FullName -Force
            Write-Host "Deleted: $($File.Name)" -ForegroundColor Green
        } else {
            Write-Host " [WhatIf] Would delete: $($File.Name) ($($File.LastWriteTime))" -ForegroundColor Gray
        }
    }
}

if (-not $Force) {
    Write-Warning "Run with -Force to execute deletion."
}
