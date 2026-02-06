<#
.SYNOPSIS
    Summarizes "Who changed what" in the last 24 hours via Activity Log.

.DESCRIPTION
    Filters Azure Activity Log for 'Write', 'Delete', or 'Action' events.
    Groups them by Caller (User) and Resource.
    
    Quick way to catch "Who turned off the VM?" or "Who modified the NSG?".

.NOTES
    File Name  : 125_Get-AzResourceChangeHistory.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

$StartTime = (Get-Date).AddHours(-24)

Write-Host "Querying Activity Log since $StartTime..." -ForegroundColor Cyan

$Logs = Get-AzLog -StartTime $StartTime -DetailedOutput

# filtering for interesting operations
$Changes = $Logs | Where-Object { 
    $_.Authorization.Action -notmatch "read" -and 
    $_.Status.Value -eq "Succeeded" 
}

$Report = @()

foreach ($Change in $Changes) {
    $Report += [PSCustomObject]@{
        Time = $Change.EventTimestamp
        Caller = $Change.Caller
        Action = $Change.Authorization.Action
        Resource = $Change.ResourceUri.Split("/")[-1]
        ResourceGroup = $Change.ResourceGroupName
    }
}

if ($Report.Count -gt 0) {
    $Report | Sort-Object Time -Descending | Format-Table Time, Caller, Action, Resource -AutoSize
} else {
    Write-Host "No changes found in the last 24h." -ForegroundColor Green
}
