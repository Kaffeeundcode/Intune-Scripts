<#
.SYNOPSIS
    Prüft, ob ein Neustart ausstehend ist (Pending Reboot).
    (Intune Detection Script)

.DESCRIPTION
    Prüft diverse Registry-Keys (Component Based Servicing, Windows Update, Session Manager).
    NonCompliant wenn ein Reboot nötig ist.

.NOTES
    File Name: 049_Detect-PendingReboot.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    $RebootPending = $false
    
    # 1. Component Based Servicing
    if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending") { $RebootPending = $true }
    
    # 2. Windows Update
    if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired") { $RebootPending = $true }
    
    # 3. Session Manager
    $PendingFileRename = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" -Name PendingFileRenameOperations -ErrorAction SilentlyContinue
    if ($PendingFileRename) { $RebootPending = $true }

    if ($RebootPending) {
        Write-Host "NonCompliant (Reboot Pending)"
        exit 1
    } else {
        Write-Host "Compliant"
        exit 0
    }

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
