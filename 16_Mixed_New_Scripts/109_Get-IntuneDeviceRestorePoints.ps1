<#
.SYNOPSIS
    Lists Restore Points for Cloud PCs (Windows 365).

.DESCRIPTION
    Windows 365 Cloud PCs support point-in-time restore. This script inspects
    Cloud PC devices and lists the available restore points for auditing backup frequency.

.NOTES
    File Name  : 109_Get-IntuneDeviceRestorePoints.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
    Requires   : Microsoft.Graph.Beta (Cloud PC APIs are often beta)
#>

# Using Beta for Cloud PC features if needed
try {
     Select-MgProfile -Name "beta"
     Connect-MgGraph -Scopes "CloudPC.Read.All" -ErrorAction Stop
} catch {
    Write-Warning "Failed to connect to Beta/CloudPC module. Standard profile might lack permissions."
    # Fallback attempt
    Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"
}

Write-Host "Getting Cloud PCs..." -ForegroundColor Cyan

# Cloud PCs are essentially Managed Devices but accessed via different endpoint usually for specific restore actions
# We try to find devices that are Cloud PCs
$Devices = Get-MgDeviceManagementManagedDevice -Filter "contains(model, 'Cloud PC')" -All

if (-not $Devices) {
    Write-Warning "No Cloud PC devices found via standard filter (Model 'Cloud PC'). Checking dedicated CloudPC API..."
    try {
        $CPCs = Get-MgDeviceManagementVirtualEndpointCloudPC -All
    } catch { 
        Write-Warning "CloudPC API not available."
        exit 
    }
} else {
    # If we found via standard list, map to ID
    # Note: Standard ManagedDevice ID != CloudPC ID usually.
    Write-Host "Use specific CloudPC commands for restore points."
    $CPCs = Get-MgDeviceManagementVirtualEndpointCloudPC -All
}

$Report = @()

foreach ($PC in $CPCs) {
    Write-Host "Checking restore points for $($PC.DisplayName)..." -NoNewline
    try {
        $Points = Get-MgDeviceManagementVirtualEndpointCloudPCRestorePoint -CloudPCId $PC.Id -All
        $Count = $Points.Count
        Write-Host " Found $Count points." -ForegroundColor Green
        
        foreach ($P in $Points) {
            $Report += [PSCustomObject]@{
                PCName = $PC.DisplayName
                User   = $PC.UserPrincipalName
                PointTime = $P.DateTime
                Type      = $P.RestorePointType
            }
        }
    } catch {
        Write-Host " Error." -ForegroundColor Red
    }
}

$Report | Sort-Object PointTime -Descending | Format-Table PCName, PointTime, Type -AutoSize
