<#
.SYNOPSIS
    Demonstriert Batching von Requests.
    
.DESCRIPTION
    Zeigt, wie mehrere Abfragen in einem HTTP-Call gesendet werden (JSON Batch).
    Performance-Optimierung.

.NOTES
    File Name: 85_Batch-GraphRequests.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph

# Example Batch JSON Body
$Batch = @{
    requests = @(
        @{
            id = "1"
            method = "GET"
            url = "/me"
        },
        @{
            id = "2"
            method = "GET"
            url = "/deviceManagement/managedDevices?`$top=1"
        }
    )
}

Invoke-MgGraphRequest -Method POST -Uri "https://graph.microsoft.com/v1.0/$batch" -Body $Batch
