<#
.SYNOPSIS
    Teams Voice Enabled Users Without Voice Routing Policy

.DESCRIPTION
    Identifiziert Teams Voice Enabled Users Without Voice Routing Policy in der Teams-Telefonie.

.NOTES
    File Name : 335_Find-TeamsVoiceEnabledUsersWithoutVoiceRoutingPolicy.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/335_Find-TeamsVoiceEnabledUsersWithoutVoiceRoutingPolicy.csv",
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

$Items = $Items | Where-Object { [bool](Get-TtProp -InputObject $_ -Path "EnterpriseVoiceEnabled") -and -not (Get-TtProp -InputObject $_ -Path "VoiceRoutingPolicy") }

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object DisplayName)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
