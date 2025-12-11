<#
.SYNOPSIS
    Führt einen rohen Graph-Request aus.
    
.DESCRIPTION
    Wrapper um Invoke-MgGraphRequest für benutzerdefinierte Abfragen.
    Flexibel für alle Endpunkte.

.NOTES
    File Name: 83_Invoke-GraphRequest.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$Uri,
    [string]$Method = "GET",
    [hashtable]$Body
)

Connect-MgGraph

if ($Body) {
    Invoke-MgGraphRequest -Method $Method -Uri $Uri -Body $Body
} else {
    Invoke-MgGraphRequest -Method $Method -Uri $Uri
}
