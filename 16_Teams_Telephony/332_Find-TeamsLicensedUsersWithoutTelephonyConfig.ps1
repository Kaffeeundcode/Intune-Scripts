<#
.SYNOPSIS
    Teams Licensed Users Without Telephony Config

.DESCRIPTION
    Identifiziert Teams Licensed Users Without Telephony Config in der Teams-Telefonie.

.NOTES
    File Name : 332_Find-TeamsLicensedUsersWithoutTelephonyConfig.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/332_Find-TeamsLicensedUsersWithoutTelephonyConfig.csv",
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
    OnPremLineURI = "OnPremLineURI"
    EnterpriseVoiceEnabled = "EnterpriseVoiceEnabled"
    HostedVoiceMail = "HostedVoiceMail"
    UsageLocation = "UsageLocation"
    Department = "Department"
    Office = "Office"
    City = "City"
    Country = "Country"
})


$Items = @(Get-CsOnlineUser -ResultSize Unlimited)

$Items = $Items | Where-Object { -not (Get-TtProp -InputObject $_ -Path "LineURI") -and -not [bool](Get-TtProp -InputObject $_ -Path "EnterpriseVoiceEnabled") }

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object DisplayName)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
