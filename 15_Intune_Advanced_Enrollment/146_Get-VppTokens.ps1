<#
.SYNOPSIS
    Listet VPP Tokens (Apple Volume Purchase Program) auf.
    
.DESCRIPTION
    Zeigt Status und Ablaufdatum von VPP Token.
    Erfordert die Berechtigung 'DeviceManagementApps.Read.All'.

.NOTES
    File Name: 146_Get-VppTokens.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementApps.Read.All"
Get-MgDeviceAppMgtVppToken | Select-Object DisplayName, AppleId, ExpirationDateTime, State
