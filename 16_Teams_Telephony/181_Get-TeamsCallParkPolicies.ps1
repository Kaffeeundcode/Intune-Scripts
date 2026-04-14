<#
.SYNOPSIS
    Teams Call Park Policies

.DESCRIPTION
    Ruft Teams Call Park Policies aus der Teams-Telefonie ab.

.NOTES
    File Name : 181_Get-TeamsCallParkPolicies.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/181_Get-TeamsCallParkPolicies.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTeamsCallParkPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Identity = "Identity"
    Description = "Description"
})


$Items = @(Get-CsTeamsCallParkPolicy)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
