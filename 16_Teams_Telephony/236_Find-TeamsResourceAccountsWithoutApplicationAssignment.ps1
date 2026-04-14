<#
.SYNOPSIS
    Teams Resource Accounts Without Application Assignment

.DESCRIPTION
    Identifiziert Teams Resource Accounts Without Application Assignment in der Teams-Telefonie.

.NOTES
    File Name : 236_Find-TeamsResourceAccountsWithoutApplicationAssignment.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/236_Find-TeamsResourceAccountsWithoutApplicationAssignment.csv",
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

$Items = Where-TtMissingValue -Items $Items -Path "ApplicationId"

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object DisplayName)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
