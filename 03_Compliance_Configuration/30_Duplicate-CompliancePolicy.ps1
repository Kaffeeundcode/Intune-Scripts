<#
.SYNOPSIS
    Dupliziert eine vorhandene Compliance-Policy.
    
.DESCRIPTION
    Erstellt eine Kopie einer Policy mit dem Suffix '_Copy'.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.ReadWrite.All'.

.NOTES
    File Name: 30_Duplicate-CompliancePolicy.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$PolicyId
)

Connect-MgGraph -Scopes "DeviceManagementConfiguration.ReadWrite.All"

$Policy = Get-MgDeviceManagementDeviceCompliancePolicy -DeviceCompliancePolicyId $PolicyId
if (!$Policy) { Write-Warning "Policy nicht gefunden"; exit }

# Cloning manually as there isn't a direct Clone method exposed simply
# We remove ID and creation props
$NewDisplayName = $Policy.DisplayName + "_Copy"
$Params = $Policy | Select-Object * -ExcludeProperty Id, CreatedDateTime, LastModifiedDateTime, Version
$Params.DisplayName = $NewDisplayName

# Note: This is a simplified approach. Deep cloning of complex objects needs more logic.
# Casting to hash table for creating new might be needed.

Write-Warning "Duplizierung ist komplex und hier nur als Platzhalter implementiert. Bitte prüfen Sie die manuelle Erstellung."
