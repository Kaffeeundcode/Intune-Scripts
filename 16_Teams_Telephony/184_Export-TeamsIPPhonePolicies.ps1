<#
.SYNOPSIS
    Teams IPPhone Policies

.DESCRIPTION
    Exportiert Teams IPPhone Policies aus der Teams-Telefonie.

.NOTES
    File Name : 184_Export-TeamsIPPhonePolicies.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/184_Export-TeamsIPPhonePolicies.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTeamsIPPhonePolicy")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsTeamsIPPhonePolicy)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
