<#
.SYNOPSIS
    Searches installed software (Registry) using fuzzy matching/wildcards.

.DESCRIPTION
    "Get-Package" or "Get-WmiObject" can be slow or incomplete.
    This script quickly scans Uninstall keys in Registry for a keyword (e.g. "Adobe", "Java").

.NOTES
    File Name  : 149_Get-InstalledSoftwareFuzzy.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Param(
    [Parameter(Mandatory=$true)]
    [string]$Name
)

$Paths = @(
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall",
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
)

$Results = @()

foreach ($Path in $Paths) {
    if (Test-Path $Path) {
        Get-ChildItem $Path | ForEach-Object {
            $Display = $_.GetValue("DisplayName")
            if ($Display -match $Name) {
                $Results += [PSCustomObject]@{
                    Name = $Display
                    Version = $_.GetValue("DisplayVersion")
                    Publisher = $_.GetValue("Publisher")
                    UninstallString = $_.GetValue("UninstallString")
                    RegKey = $_.PSPath
                }
            }
        }
    }
}

if ($Results.Count -gt 0) {
    $Results | Format-Table Name, Version, Publisher -AutoSize
} else {
    Write-Host "No matches found for '$Name'." -ForegroundColor Yellow
}
