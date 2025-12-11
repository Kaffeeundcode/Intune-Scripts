<#
.SYNOPSIS
    Placeholder for Device Security Score check.
    
.DESCRIPTION
    Security Score is part of Defender for Endpoint, but integrated in Intune reports.
    Requires 'Security.Read.All' permission.

.NOTES
    File Name: 70_Check-DeviceSecurityScore.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "Security.Read.All"

# Note: Graph API 'security/secureScores'
try {
    $Scores = Get-MgSecuritySecureScore -Top 1
    if ($Scores) {
        Write-Host "Current Tenant Security Score: $($Scores.CurrentScore) / $($Scores.MaxScore)" -ForegroundColor Green
    }
} catch {
    Write-Warning "Failed to retrieve Security Score. Check permissions."
}
