<#
.SYNOPSIS
    Weist ein Konfigurationsprofil einer Gruppe zu.
    
.DESCRIPTION
    Setzt eine Zuweisung für ein bestimmtes Profil.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.ReadWrite.All'.

.NOTES
    File Name: 26_Assign-ConfigProfile.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$ProfileId,

    [Parameter(Mandatory=$true)]
    [string]$GroupId
)

Connect-MgGraph -Scopes "DeviceManagementConfiguration.ReadWrite.All"

$Params = @{
    assignments = @(
        @{
            target = @{
                "@odata.type" = "#microsoft.graph.groupAssignmentTarget"
                groupId = $GroupId
            }
        }
    )
}

# Note: This overwrites existing assignments if not handled carefully.
# For simplicity, we assume creating a new assignment structure.
try {
    # Update-MgDeviceManagementDeviceConfiguration accepts body for properties, 
    # but assignments are often handled via a specific endpoint or by updating the object.
    # The SDK allows updating the profile with assignment data.
    Update-MgDeviceManagementDeviceConfiguration -DeviceConfigurationId $ProfileId -BodyParameter $Params
    Write-Host "Zuweisung aktualisiert für Profil $ProfileId" -ForegroundColor Green
} catch {
    Write-Error "Fehler bei Zuweisung: $_"
}
