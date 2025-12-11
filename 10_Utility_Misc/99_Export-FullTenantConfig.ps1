<#
.SYNOPSIS
    Exports (almost) entire Intune Config to text.
    
.DESCRIPTION
    Iterates major config types and summaries them.
    
.NOTES
    File Name: 99_Export-FullTenantConfig.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Write-Host "Starting Full Tenant Export..."
# Pseduo-code for calling multiple export scripts
.\01_Device_Management\10_Export-AllDevices.ps1
.\03_Compliance_Configuration\25_Backup-ConfigurationProfiles.ps1
# ...
Write-Host "Done."
