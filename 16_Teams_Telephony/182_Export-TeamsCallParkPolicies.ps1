<#
.SYNOPSIS
    Teams Call Park Policies

.DESCRIPTION
    Exportiert Teams Call Park Policies aus der Teams-Telefonie.

.NOTES
    File Name : 182_Export-TeamsCallParkPolicies.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/182_Export-TeamsCallParkPolicies.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTeamsCallParkPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsTeamsCallParkPolicy)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
