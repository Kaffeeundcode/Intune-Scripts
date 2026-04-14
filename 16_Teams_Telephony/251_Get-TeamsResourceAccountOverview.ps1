<#
.SYNOPSIS
    Teams Resource Account Overview

.DESCRIPTION
    Ruft Teams Resource Account Overview aus der Teams-Telefonie ab.

.NOTES
    File Name : 251_Get-TeamsResourceAccountOverview.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/251_Get-TeamsResourceAccountOverview.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineApplicationInstance")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    DisplayName = "DisplayName"
    UserPrincipalName = "UserPrincipalName"
    ApplicationId = "ApplicationId"
    PhoneNumber = "PhoneNumber"
    ObjectId = "ObjectId"
})


$Items = @(Get-CsOnlineApplicationInstance)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object DisplayName)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
