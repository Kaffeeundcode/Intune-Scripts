<#
.SYNOPSIS
    Teams Users With Non E164 Numbers

.DESCRIPTION
    Identifiziert Teams Users With Non E164 Numbers in der Teams-Telefonie.

.NOTES
    File Name : 346_Find-TeamsUsersWithNonE164Numbers.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/346_Find-TeamsUsersWithNonE164Numbers.csv",
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

$Items = Where-TtMatchIssue -Items $Items -Path "LineURI" -Pattern "^tel:\+\d+$" -ExpectMatch

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object DisplayName)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
