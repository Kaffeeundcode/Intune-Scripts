<#
.SYNOPSIS
    Teams Users With Direct Routing Number

.DESCRIPTION
    Identifiziert Teams Users With Direct Routing Number in der Teams-Telefonie.

.NOTES
    File Name : 154_Find-TeamsUsersWithDirectRoutingNumber.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/154_Find-TeamsUsersWithDirectRoutingNumber.csv",
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

$Items = $Items | Where-Object { (Get-TtProp -InputObject $_ -Path "OnPremLineURI") -or (Get-TtProp -InputObject $_ -Path "LineURI") }

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object DisplayName)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
