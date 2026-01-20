<#
.SYNOPSIS
    Erstellt ein SAS-Token (Shared Access Signature) für einen Storage Container.

.DESCRIPTION
    SAS-Tokens ermöglichen zeitbegrenzten Zugriff auf Storage-Ressourcen ohne Key-Weitergabe.
    Dieses Skript generiert ein Token für einen spezifischen Container.

    Parameter:
    - ResourceGroupName: RG Name
    - StorageAccountName: Storage Name
    - ContainerName: Container Name
    - ValidityHours: Gültigkeitsdauer in Stunden (Default: 24)
    - Permission: Rechte (r=Read, w=Write, d=Delete, l=List) (Default: 'rl')

.NOTES
    File Name: 012_New-AzStorageContainerSAS.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$StorageAccountName,
    [Parameter(Mandatory=$true)] [string]$ContainerName,
    [Parameter(Mandatory=$false)] [int]$ValidityHours = 24,
    [Parameter(Mandatory=$false)] [string]$Permission = "rl"
)

try {
    $Ctx = (Get-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageAccountName -ErrorAction Stop).Context
    
    $StartTime = Get-Date
    $ExpiryTime = $StartTime.AddHours($ValidityHours)

    Write-Host "Generiere SAS Token für Container '$ContainerName'..." -ForegroundColor Cyan
    
    $Token = New-AzStorageContainerSASToken -Context $Ctx `
                                            -Name $ContainerName `
                                            -Permission $Permission `
                                            -StartTime $StartTime `
                                            -ExpiryTime $ExpiryTime `
                                            -ErrorAction Stop

    $FullUri = $Ctx.BlobEndPoint + $ContainerName + $Token

    Write-Host "SAS Token erfolgreich erstellt (Gültig bis: $ExpiryTime)" -ForegroundColor Green
    Write-Host "URI:" -ForegroundColor Yellow
    Write-Host $FullUri

} catch {
    Write-Error "Fehler: $_"
}
