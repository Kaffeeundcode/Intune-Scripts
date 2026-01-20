<#
.SYNOPSIS
    Setzt einen 'CanNotDelete'-Lock auf kritische Ressourcen, um versehentliches Löschen zu verhindern.

.DESCRIPTION
    Resource Locks sind ein wichtiger Schutzmechanismus. 
    Dieses Skript setzt einen Lock auf eine Ressourcengruppe oder eine spezifische Ressource.

    Parameter:
    - ResourceGroupName: RG Name
    - ResourceName: (Optional) Name der Ressource. Wenn leer, wird die ganze RG gesperrt.
    - ResourceType: (Optional) Typ der Ressource (z.B. Microsoft.Storage/storageAccounts) - Pflicht wenn ResourceName gesetzt.
    - LockName: Name des Locks (Default: 'Auto-Protection-Lock')

.NOTES
    File Name: 014_Set-AzResourceLock.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$false)] [string]$ResourceName,
    [Parameter(Mandatory=$false)] [string]$ResourceType,
    [Parameter(Mandatory=$false)] [string]$LockName = "Auto-Protection-Lock"
)

try {
    if ($ResourceName -and $ResourceType) {
        Write-Host "Setze Lock auf Ressource '$ResourceName'..." -ForegroundColor Cyan
        New-AzResourceLock -LockName $LockName `
                           -LockLevel CanNotDelete `
                           -ResourceGroupName $ResourceGroupName `
                           -ResourceName $ResourceName `
                           -ResourceType $ResourceType `
                           -Force -ErrorAction Stop | Out-Null
    } else {
        Write-Host "Setze Lock auf gesamte Resource Group '$ResourceGroupName'..." -ForegroundColor Cyan
        New-AzResourceLock -LockName $LockName `
                           -LockLevel CanNotDelete `
                           -ResourceGroupName $ResourceGroupName `
                           -Force -ErrorAction Stop | Out-Null
    }
    
    Write-Host "Lock '$LockName' erfolgreich gesetzt." -ForegroundColor Green

} catch {
    Write-Error "Fehler (Existiert der Lock schon?): $_"
}
