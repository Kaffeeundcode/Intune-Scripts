<#
.SYNOPSIS
    Teams Emergency Policy Naming Standard

.DESCRIPTION
    Prueft Teams Emergency Policy Naming Standard in der Teams-Telefonie.

.NOTES
    File Name : 308_Test-TeamsEmergencyPolicyNamingStandard.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/308_Test-TeamsEmergencyPolicyNamingStandard.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTeamsEmergencyCallingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Identity = "Identity"
    Description = "Description"
})


$Items = @(Get-CsTeamsEmergencyCallingPolicy)

$Items = Where-TtMatch -Items $Items -Path "Identity" -Pattern "[^A-Za-z0-9\- _\.]"

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
