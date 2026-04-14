<#
.SYNOPSIS
    Teams Resource Accounts Without Display Name

.DESCRIPTION
    Identifiziert Teams Resource Accounts Without Display Name in der Teams-Telefonie.

.NOTES
    File Name : 239_Find-TeamsResourceAccountsWithoutDisplayName.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/239_Find-TeamsResourceAccountsWithoutDisplayName.csv",
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

$Items = Where-TtMissingValue -Items $Items -Path "DisplayName"

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object UserPrincipalName)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
