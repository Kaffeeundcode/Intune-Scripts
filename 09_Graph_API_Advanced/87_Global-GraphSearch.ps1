<#
.SYNOPSIS
    Global Search in Graph (Advanced).
    
.DESCRIPTION
    Uses the /search endpoint if available for the entity.
    
.NOTES
    File Name: 87_Global-GraphSearch.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param([string]$Query)

# Invoke-MgGraphRequest -Uri "https://graph.microsoft.com/v1.0/search/query" -Method POST -Body ...
Write-Host "Graph Search API implementation..."
