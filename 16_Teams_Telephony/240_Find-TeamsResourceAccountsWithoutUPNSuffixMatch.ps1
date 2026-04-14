<#
.SYNOPSIS
    Teams Resource Accounts Without UPNSuffix Match

.DESCRIPTION
    Identifiziert Teams Resource Accounts Without UPNSuffix Match in der Teams-Telefonie.

.NOTES
    File Name : 240_Find-TeamsResourceAccountsWithoutUPNSuffixMatch.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/240_Find-TeamsResourceAccountsWithoutUPNSuffixMatch.csv",
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

$Items = $Items | Where-Object { ((Get-TtProp -InputObject $_ -Path "UserPrincipalName") -as [string]) -notmatch "@.+" }

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object UserPrincipalName)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
