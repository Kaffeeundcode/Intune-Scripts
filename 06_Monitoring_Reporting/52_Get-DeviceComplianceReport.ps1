<#
.SYNOPSIS
    Generates a Device Compliance Summary Report.
    
.DESCRIPTION
    Shows counts of Compliant, Non-Compliant, and Error devices.
    Requires 'DeviceManagementManagedDevices.Read.All' permission.

.NOTES
    File Name: 52_Get-DeviceComplianceReport.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Devices = Get-MgDeviceManagementManagedDevice -All

if ($Devices) {
    $Stats = $Devices | Group-Object ComplianceState
    
    Write-Host "--- Compliance Summary ---" -ForegroundColor Cyan
    $Stats | Select-Object Name, Count | Format-Table
    
    $Total = $Devices.Count
    $Compliant = ($Devices | Where-Object {$_.ComplianceState -eq 'compliant'}).Count
    $Percent = [math]::Round(($Compliant / $Total) * 100, 1)
    
    Write-Host "Compliance Rate: $Percent%" -ForegroundColor Green
} else {
    Write-Warning "No devices to report on."
}
