<#
.SYNOPSIS
    Findet und löscht (optional) Managed Disks, die an keine VM angehängt sind (verwaiste Disks).

.DESCRIPTION
    Nicht angehängte Disks verursachen Speicherkosten. Dieses Skript listet alle 'Unattached' Disks in einer Subscription auf.
    Mit dem Switch '-Delete' werden diese gelöscht. VORSICHT!

    Parameter:
    - Delete: Wenn gesetzt, werden die Disks gelöscht. Ohne diesen Parameter ist es nur ein Report (WhatIf).

.NOTES
    File Name: 005_Remove-AzUnattachedDisks.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)]
    [switch]$Delete
)

try {
    Write-Host "Suche nach ungenutzten Managed Disks in der aktuellen Subscription..." -ForegroundColor Cyan

    $Disks = Get-AzDisk | Where-Object { $_.ManagedBy -eq $null }

    if ($Disks.Count -eq 0) {
        Write-Host "Keine verwaisten Disks gefunden. Alles sauber." -ForegroundColor Green
        exit
    }

    Write-Host "$($Disks.Count) ungenutzte Disk(s) gefunden:" -ForegroundColor Yellow
    $Disks | Select-Object Name, ResourceGroupName, DiskSizeGB, Sku | Format-Table -AutoSize

    if ($Delete) {
        Write-Warning "Löschvorgang wird gestartet..."
        foreach ($disk in $Disks) {
            Write-Host "Lösche Disk: $($disk.Name) in RG ($($disk.ResourceGroupName))..." -NoNewline
            Remove-AzDisk -ResourceGroupName $disk.ResourceGroupName -DiskName $disk.Name -Force -ErrorAction Stop
            Write-Host " OK." -ForegroundColor Green
        }
    } else {
        Write-Host "Hinweis: Nutzen Sie den Parameter '-Delete', um diese Disks wirklich zu löschen." -ForegroundColor Cyan
    }

} catch {
    Write-Error "Fehler: $_"
}
