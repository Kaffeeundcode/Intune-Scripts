<#
.SYNOPSIS
    Teams User Calling Settings Inventory

.DESCRIPTION
    Exportiert Teams User Calling Settings Inventory aus der Teams-Telefonie.

.NOTES
    File Name : 313_Export-TeamsUserCallingSettingsInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/313_Export-TeamsUserCallingSettingsInventory.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser", "Get-CsUserCallingSettings")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsOnlineUser -ResultSize Unlimited)


$users = @(Get-CsOnlineUser -ResultSize Unlimited | Where-Object { Get-TtProp -InputObject $_ -Path "UserPrincipalName" })
$Result = foreach ($user in $users) {
    try {
        $settings = Get-CsUserCallingSettings -Identity $user.UserPrincipalName
        $settings | Add-Member -NotePropertyName DisplayName -NotePropertyValue $user.DisplayName -Force
        $settings | Add-Member -NotePropertyName UserPrincipalName -NotePropertyValue $user.UserPrincipalName -Force
        $settings
    } catch { }
}


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
