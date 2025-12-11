<#
.SYNOPSIS
    Watches Enrollment Status in a loop.
    
.DESCRIPTION
    Polls a device ID until it becomes compliant.
    
.NOTES
    File Name: 96_Watch-EnrollmentLoop.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [string]$DeviceId
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

do {
    $Dev = Get-MgDeviceManagementManagedDevice -ManagedDeviceId $DeviceId
    Write-Host "Status: $($Dev.ComplianceState) - $(Get-Date)"
    Start-Sleep -Seconds 10
} until ($Dev.ComplianceState -eq "compliant")

Write-Host "Device is compliant!" -ForegroundColor Green
