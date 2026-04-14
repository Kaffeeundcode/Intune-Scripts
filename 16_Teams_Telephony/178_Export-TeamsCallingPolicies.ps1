<#
.SYNOPSIS
    Teams Calling Policies

.DESCRIPTION
    Exportiert Teams Calling Policies aus der Teams-Telefonie.

.NOTES
    File Name : 178_Export-TeamsCallingPolicies.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/178_Export-TeamsCallingPolicies.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTeamsCallingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsTeamsCallingPolicy)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
