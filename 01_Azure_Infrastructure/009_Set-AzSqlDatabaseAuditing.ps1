<#
.SYNOPSIS
    Aktiviert das Blob-Auditing für einen Azure SQL Server.

.DESCRIPTION
    Aktiviert Auditing für einen gesamten logischen SQL Server und speichert die Audit-Logs in einem Storage Account.
    Dies ist wichtig für Compliance und Security-Überwachung.

    Parameter:
    - ResourceGroupName: RG des SQL Servers
    - ServerName: Name des SQL Servers
    - StorageAccountName: Ziel-Storage Account für Audit Logs

.NOTES
    File Name: 009_Set-AzSqlDatabaseAuditing.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$ServerName,
    [Parameter(Mandatory=$true)] [string]$StorageAccountName
)

try {
    Write-Host "Rufe SQL Server '$ServerName' und Storage '$StorageAccountName' ab..." -ForegroundColor Cyan

    $Storage = Get-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageAccountName -ErrorAction Stop
    # Holt den primären Blob Endpoint
    $StorageEndpoint = $Storage.PrimaryEndpoints.Blob

    Write-Host "Aktiviere Auditing..." -ForegroundColor Cyan
    
    Set-AzSqlServerAudit -ResourceGroupName $ResourceGroupName `
                         -ServerName $ServerName `
                         -BlobStorageTargetState Enabled `
                         -StorageAccountResourceId $Storage.Id `
                         -ErrorAction Stop | Out-Null
                         
    Write-Host "Auditing für '$ServerName' erfolgreich auf '$StorageAccountName' aktiviert." -ForegroundColor Green

} catch {
    Write-Error "Fehler bei der Konfiguration: $_"
}
