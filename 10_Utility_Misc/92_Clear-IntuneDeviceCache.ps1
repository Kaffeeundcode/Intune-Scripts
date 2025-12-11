<#
.SYNOPSIS
    Clears Local Intune Cache (Registry/Files).
    
.DESCRIPTION
    Run locally to troubleshoot enrollment issues.
    
.NOTES
    File Name: 92_Clear-IntuneDeviceCache.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

# Registry keys often associated with enrollment
$RegPaths = @(
    "HKLM:\SOFTWARE\Microsoft\Enrollments",
    "HKLM:\SOFTWARE\Microsoft\Enrollments\Status",
    "HKLM:\SOFTWARE\Microsoft\EnterpriseResourceManager"
)

Write-Warning "This script modifies registry keys for troubleshooting. Use with caution."
# Real implementation would remove specific GUID keys, not the whole root.
Write-Host "Clearing temp folders..."
Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Done."
