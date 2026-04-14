<#
.SYNOPSIS
    Teams Potential Common Area Phone Users

.DESCRIPTION
    Identifiziert Teams Potential Common Area Phone Users in der Teams-Telefonie.

.NOTES
    File Name : 345_Find-TeamsPotentialCommonAreaPhoneUsers.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/345_Find-TeamsPotentialCommonAreaPhoneUsers.csv",
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

$Items = $Items | Where-Object { ([string](Get-TtProp -InputObject $_ -Path "DisplayName") -match "Lobby|Reception|Phone|Common|CAP|Meeting") -or ([string](Get-TtProp -InputObject $_ -Path "UserPrincipalName") -match "lobby|reception|phone|common|cap|meeting") }

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object DisplayName)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
