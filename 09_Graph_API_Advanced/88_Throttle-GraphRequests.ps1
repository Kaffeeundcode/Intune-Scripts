<#
.SYNOPSIS
    Simuliert Throttling-Handling.
    
.DESCRIPTION
    Beispielcode, wie man mit HTTP 429 (Too Many Requests) umgeht (Retry-After).
    
.NOTES
    File Name: 88_Throttle-GraphRequests.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Write-Host "Dies ist ein Logik-Beispiel für Skripte:"
Write-Host '
try {
    # Command
} catch {
    if ($_.Exception.Response.StatusCode -eq 429) {
        $RetryAfter = $_.Exception.Response.Headers["Retry-After"]
        Start-Sleep -Seconds $RetryAfter
    }
}
'
