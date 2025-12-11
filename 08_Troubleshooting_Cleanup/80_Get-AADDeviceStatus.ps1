<#
.SYNOPSIS
    Checks Azure AD Registration Status.
    
.DESCRIPTION
    Runs dsregcmd /status and parses key info.
    
.NOTES
    File Name: 80_Get-AADDeviceStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

dsregcmd /status
