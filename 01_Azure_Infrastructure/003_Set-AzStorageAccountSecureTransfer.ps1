<#
.SYNOPSIS
    Aktiviert 'Secure Transfer Required' für einen Azure Storage Account.

.DESCRIPTION
    Aus Sicherheitsgründen sollte für Storage Accounts immer "Secure Transfer Required" (HTTPS only) aktiviert sein.
    Dieses Skript setzt diese Einstellung für einen spezifischen Account.

    Parameter:
    - ResourceGroupName: Name der Ressourcengruppe
    - StorageAccountName: Name des Storage Accounts

.NOTES
    File Name: 003_Set-AzStorageAccountSecureTransfer.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$StorageAccountName
)

try {
    Write-Host "Konfiguriere Storage Account '$StorageAccountName'..." -ForegroundColor Cyan

    $Account = Get-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageAccountName -ErrorAction Stop
    
    if ($Account.EnableHttpsTrafficOnly -eq $true) {
        Write-Host " 'Secure Transfer' ist bereits AKTIVIERT." -ForegroundColor Yellow
    } else {
        Set-AzStorageAccount -ResourceGroupName $ResourceGroupName `
                             -Name $StorageAccountName `
                             -EnableHttpsTrafficOnly $true `
                             -ErrorAction Stop | Out-Null
        Write-Host " 'Secure Transfer' wurde erfolgreich AKTIVIERT." -ForegroundColor Green
    }
} catch {
    Write-Error "Fehler bei der Konfiguration: $_"
}
