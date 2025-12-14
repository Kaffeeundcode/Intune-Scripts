<#
.SYNOPSIS
    Erstellt einen Break-Glass Account (Notfall-Admin).
    
.DESCRIPTION
    Legt einen Cloud-Only User an, der von CA-Policies ausgenommen werden sollte.
    Erfordert die Berechtigung 'User.ReadWrite.All'.

.NOTES
    File Name: 134_Create-Emergency-Account.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$Suffix = "emerg"
)

# Placeholder logic - creation similar to New-User but requires long complex password output
Write-Host "Erstellung eines Break-Glass Accounts gestartet..."
