<#
.SYNOPSIS
    Teams Call Queue Configuration

.DESCRIPTION
    Sichert Teams Call Queue Configuration aus der Teams-Telefonie.

.NOTES
    File Name : 210_Backup-TeamsCallQueueConfiguration.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/210_Backup-TeamsCallQueueConfiguration.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsCallQueue")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsCallQueue)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
