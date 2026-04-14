<#
.SYNOPSIS
    Teams Calling Settings Consistency

.DESCRIPTION
    Prueft Teams Calling Settings Consistency in der Teams-Telefonie.

.NOTES
    File Name : 325_Test-TeamsCallingSettingsConsistency.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/325_Test-TeamsCallingSettingsConsistency.csv",
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
$Result = foreach ($row in $dataset) {
    $hasForwarding = [bool](Get-TtProp -InputObject $row -Path "IsForwardingEnabled")
    $targetType = Get-TtProp -InputObject $row -Path "ForwardingTargetType"
    if ($hasForwarding -and -not $targetType) {
        [pscustomobject]@{
            DisplayName = Get-TtProp -InputObject $row -Path "DisplayName"
            UserPrincipalName = Get-TtProp -InputObject $row -Path "UserPrincipalName"
            Issue = "ForwardingEnabledWithoutTargetType"
        }
    }
}


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
