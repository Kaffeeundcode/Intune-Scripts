<#
.SYNOPSIS
    Teams Call Forwarding Adoption

.DESCRIPTION
    Misst Teams Call Forwarding Adoption in der Teams-Telefonie.

.NOTES
    File Name : 321_Measure-TeamsCallForwardingAdoption.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/321_Measure-TeamsCallForwardingAdoption.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser", "Get-CsUserCallingSettings")
Initialize-TtSession -SkipConnect:$SkipConnect


function Get-TtCallingSettingsDataset {
    $users = @(Get-CsOnlineUser -ResultSize Unlimited | Where-Object { Get-TtProp -InputObject $_ -Path "UserPrincipalName" })
    $dataset = foreach ($user in $users) {
        try {
            $settings = Get-CsUserCallingSettings -Identity $user.UserPrincipalName
            $settings | Add-Member -NotePropertyName DisplayName -NotePropertyValue $user.DisplayName -Force
            $settings | Add-Member -NotePropertyName UserPrincipalName -NotePropertyValue $user.UserPrincipalName -Force
            $settings
        } catch {
            continue
        }
    }
    return @($dataset)
}


$Items = @(Get-CsOnlineUser -ResultSize Unlimited)


$dataset = Get-TtCallingSettingsDataset
$Result = @(
    [pscustomobject]@{ Metric = "UsersWithForwarding"; Count = (@($dataset | Where-Object { [bool](Get-TtProp -InputObject $_ -Path "IsForwardingEnabled") })).Count }
    [pscustomobject]@{ Metric = "UsersWithoutForwarding"; Count = (@($dataset | Where-Object { -not [bool](Get-TtProp -InputObject $_ -Path "IsForwardingEnabled") })).Count }
)


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
