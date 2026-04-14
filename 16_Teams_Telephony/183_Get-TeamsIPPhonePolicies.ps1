<#
.SYNOPSIS
    Teams IPPhone Policies

.DESCRIPTION
    Ruft Teams IPPhone Policies aus der Teams-Telefonie ab.

.NOTES
    File Name : 183_Get-TeamsIPPhonePolicies.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/183_Get-TeamsIPPhonePolicies.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTeamsIPPhonePolicy")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Identity = "Identity"
    Description = "Description"
})


$Items = @(Get-CsTeamsIPPhonePolicy)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
