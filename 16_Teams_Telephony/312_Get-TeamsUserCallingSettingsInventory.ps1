<#
.SYNOPSIS
    Teams User Calling Settings Inventory

.DESCRIPTION
    Ruft Teams User Calling Settings Inventory aus der Teams-Telefonie ab.

.NOTES
    File Name : 312_Get-TeamsUserCallingSettingsInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/312_Get-TeamsUserCallingSettingsInventory.csv",
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

$Items = @(Get-CsOnlineUser -ResultSize Unlimited)


$users = @(Get-CsOnlineUser -ResultSize Unlimited | Where-Object { Get-TtProp -InputObject $_ -Path "UserPrincipalName" })
$Result = foreach ($user in $users) {
    try {
        $settings = Get-CsUserCallingSettings -Identity $user.UserPrincipalName
        $settings | Add-Member -NotePropertyName DisplayName -NotePropertyValue $user.DisplayName -Force
        $settings | Add-Member -NotePropertyName UserPrincipalName -NotePropertyValue $user.UserPrincipalName -Force
        Select-TtProps -Items @($settings) -PropertyMap $PropertyMap
    } catch {
        [pscustomobject]@{
            DisplayName = $user.DisplayName
            UserPrincipalName = $user.UserPrincipalName
            IsForwardingEnabled = $null
            ForwardingType = $null
            ForwardingTargetType = $null
            IsUnansweredEnabled = $null
            UnansweredTargetType = $null
            DelegateCount = $null
            CallGroupTargetCount = $null
        }
    }
}


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
