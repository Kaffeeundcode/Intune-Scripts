<#
.SYNOPSIS
    Tracks version history and revision changes for Intune Apps (Win32).
    
.DESCRIPTION
    Gets all Win32 apps and reports their current version, created date, and last modified date.
    Useful for auditing when applications were last updated by administrators.

.NOTES
    File Name  : 104_Get-IntuneAppRevisionHistory.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "DeviceManagementApps.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "Fetching Win32 Apps..." -ForegroundColor Cyan

# Filter for Win32 Apps (MobileAppType = microsoft.graph.win32LobApp)
$Apps = Get-MgDeviceAppMgtMobileApp -Filter "isof('microsoft.graph.win32LobApp')" -All

$Report = @()

foreach ($App in $Apps) {
    # Cast to specific type to access properties if needed, but PS handles dynamic props well from Graph SDK
    
    $obj = [PSCustomObject]@{
        AppName          = $App.DisplayName
        AppId            = $App.Id
        AppVersion       = $App.DisplayVersion
        CreatedDateTime  = $App.CreatedDateTime
        LastModified     = $App.LastModifiedDateTime
        Publisher        = $App.Publisher
        FileName         = $App.FileName
        SizeMB           = [math]::Round($App.Size / 1MB, 2)
        InstallContext   = $App.InstallExperience.RunAsAccount
    }
    $Report += $obj
}

$SortedReport = $Report | Sort-Object LastModified -Descending

$SortedReport | Format-Table AppName, AppVersion, LastModified, SizeMB -AutoSize

$Path = "$PSScriptRoot\App_Revision_History.csv"
$SortedReport | Export-Csv -Path $Path -NoTypeInformation
Write-Host "Report saved to $Path" -ForegroundColor Green
