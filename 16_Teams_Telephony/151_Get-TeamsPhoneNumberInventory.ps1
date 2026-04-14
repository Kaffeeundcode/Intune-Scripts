<#
.SYNOPSIS
    Teams Phone Number Inventory

.DESCRIPTION
    Ruft Teams Phone Number Inventory aus der Teams-Telefonie ab.

.NOTES
    File Name : 151_Get-TeamsPhoneNumberInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/151_Get-TeamsPhoneNumberInventory.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    DisplayName = "DisplayName"
    UserPrincipalName = "UserPrincipalName"
    LineURI = "LineURI"
    EnterpriseVoiceEnabled = "EnterpriseVoiceEnabled"
    HostedVoiceMail = "HostedVoiceMail"
    UsageLocation = "UsageLocation"
})


$Items = @(Get-CsOnlineUser -ResultSize Unlimited)

$Items = Where-TtHasValue -Items $Items -Path "LineURI"

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object DisplayName)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
