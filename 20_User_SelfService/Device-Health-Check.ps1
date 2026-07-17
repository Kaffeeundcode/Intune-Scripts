<#
.SYNOPSIS
    Device-Health-Check - A self-service diagnostic tool for end-users.
    
.DESCRIPTION
    Gathers basic device health information (Sync status, Compliance, OS version) 
    and presents it as a "Health Card". Ideal for users to provide a snapshot 
    of their device state to the helpdesk.
#>

[CmdletBinding()]
param ()

process {
    Write-Host "[INFO] Running Device Health Check..." -ForegroundColor Cyan
    
    $Device = Get-MgDeviceManagementManagedDevice -Filter "deviceId eq '$((Get-MgDevice -Filter "displayName eq '$env:COMPUTERNAME'").Id)'"
    
    if (-not $Device) {
        Write-Host "[ERROR] Device not found in Intune." -ForegroundColor Red
        return
    }

    $HealthCard = [PSCustomObject]@{
        DeviceName      = $Device.DeviceName
        OSVersion       = $Device.OsVersion
        ComplianceState = $Device.ComplianceState
        LastSync        = $Device.LastSyncDateTime
        User            = $Device.UserPrincipalName
    }

    Write-Host "`n--- DEVICE HEALTH CARD ---" -ForegroundColor White
    $HealthCard | Format-List
    Write-Host "--------------------------`n"
}