<#
.SYNOPSIS
    Teams Users By Forwarding Target Type

.DESCRIPTION
    Ruft Teams Users By Forwarding Target Type aus der Teams-Telefonie ab.

.NOTES
    File Name : 320_Get-TeamsUsersByForwardingTargetType.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/320_Get-TeamsUsersByForwardingTargetType.csv",
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


$Result = Group-TtByPath -Items (Get-TtCallingSettingsDataset) -Path "ForwardingTargetType" -Label "ForwardingTargetType"


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
