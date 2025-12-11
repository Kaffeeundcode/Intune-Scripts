<#
.SYNOPSIS
    Erstellt eine Basis-Compliance-Richtlinie für Windows 10/11.
    
.DESCRIPTION
    Legt eine neue Policy an, die z.B. BitLocker und Secure Boot erfordert.
    Dies ist ein Beispiel-Template.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.ReadWrite.All'.

.NOTES
    File Name: 23_Create-CompliancePolicy_Windows.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$PolicyName = "Win10_Base_Security"
)

Connect-MgGraph -Scopes "DeviceManagementConfiguration.ReadWrite.All"

$Params = @{
    "@odata.type" = "#microsoft.graph.windows10CompliancePolicy"
    displayName = $PolicyName
    description = "Automatisch erstellt durch Skript"
    passwordRequired = $true
    bitLockerEnabled = $true
    secureBootEnabled = $true
}

try {
    New-MgDeviceManagementDeviceCompliancePolicy -BodyParameter $Params
    Write-Host "Compliance Policy '$PolicyName' erfolgreich erstellt." -ForegroundColor Green
} catch {
    Write-Error "Fehler beim Erstellen: $_"
}
