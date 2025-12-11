<#
.SYNOPSIS
    Prüft den Service Health Status.
    
.DESCRIPTION
    Prüft, ob Intune Störungen hat (via Graph ServiceAnnouncement).
    Erfordert die Berechtigung 'ServiceHealth.Read.All'.

.NOTES
    File Name: 79_Check-IntuneServiceHealth.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "ServiceHealth.Read.All"

Get-MgServiceAnnouncementHealthOverview | Where-Object { $_.Service -eq "Microsoft Intune" } | Format-List
