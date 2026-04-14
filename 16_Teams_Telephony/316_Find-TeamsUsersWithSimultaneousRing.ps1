<#
.SYNOPSIS
    Teams Users With Simultaneous Ring

.DESCRIPTION
    Identifiziert Teams Users With Simultaneous Ring in der Teams-Telefonie.

.NOTES
    File Name : 316_Find-TeamsUsersWithSimultaneousRing.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/316_Find-TeamsUsersWithSimultaneousRing.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser", "Get-CsUserCallingSettings")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    DisplayName = "DisplayName"
    UserPrincipalName = "UserPrincipalName"
    IsForwardingEnabled = "IsForwardingEnabled"
    ForwardingType = "ForwardingType"
    ForwardingTargetType = "ForwardingTargetType"
    IsUnansweredEnabled = "IsUnansweredEnabled"
    UnansweredTargetType = "UnansweredTargetType"
    DelegateCount = "Delegates.Count"
    CallGroupTargetCount = "CallGroupTargets.Count"
})


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


$dataset = @(Get-TtCallingSettingsDataset | Where-Object { [string](Get-TtProp -InputObject $_ -Path "ForwardingType") -match "Simultaneous" })
$Result = Select-TtProps -Items $dataset -PropertyMap $PropertyMap


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
