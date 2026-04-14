<#
.SYNOPSIS
    Retrieves statistics from Attack Simulation Training (Phishing usage).

.DESCRIPTION
    Reports on the latest simulation runs: Setup status, payload used, and compromise rate.
    Requires 'Attack Simulation Administrator' roles or equivalent.

.NOTES
    File Name  : 139_Get-ExoPhishingSimulationStats.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "AttackSimulation.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "Getting Simulations..." -ForegroundColor Cyan
$Sims = Get-MgAttackSimulationSimulation -All

$Report = @()

foreach ($Sim in $Sims) {
    $Report += [PSCustomObject]@{
         Name = $Sim.DisplayName
         Status = $Sim.Status
         LaunchDate = $Sim.LaunchDateTime
         Clipped = $Sim.Report.SimulationUsers.Count
         Compromised = ($Sim.Report.SimulationUsers | Where-Object { $_.CompromisedDateTime }).Count
    }
}

$Report | Sort-Object LaunchDate -Descending | Format-Table Name, Status, Compromised -AutoSize
$Report | Export-Csv "$PSScriptRoot\Phishing_Stats.csv" -NoTypeInformation
Write-Host "Saved." -ForegroundColor Green
