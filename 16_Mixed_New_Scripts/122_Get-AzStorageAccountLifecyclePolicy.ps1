<#
.SYNOPSIS
    Audits Storage Accounts to check if they have a Lifecycle Management Policy.

.DESCRIPTION
    Lifecycle rules allow automatic tiering (Cool/Archive) or deletion of old data.
    Storage accounts WITHOUT these policies may be accumulating costs indefinitely.

.NOTES
    File Name  : 122_Get-AzStorageAccountLifecyclePolicy.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

$StorageAccounts = Get-AzStorageAccount

$Report = @()

foreach ($SA in $StorageAccounts) {
    Write-Host "Checking $($SA.StorageAccountName)..." -NoNewline
    
    $HasPolicy = $false
    try {
        $Policy = Get-AzStorageAccountManagementPolicy -ResourceGroupName $SA.ResourceGroupName -StorageAccountName $SA.StorageAccountName -ErrorAction Stop
        if ($Policy) { $HasPolicy = $true }
    } catch {
        # 404 means no policy usually
    }

    if ($HasPolicy) {
        Write-Host " OK" -ForegroundColor Green
    } else {
        Write-Host " No Policy!" -ForegroundColor Red
    }

    $Report += [PSCustomObject]@{
        StorageAccount = $SA.StorageAccountName
        ResourceGroup  = $SA.ResourceGroupName
        HasLifecyclePolicy = $HasPolicy
        Kind = $SA.Kind
    }
}

$Report | Format-Table StorageAccount, HasLifecyclePolicy -AutoSize
$Path = "$PSScriptRoot\Storage_Lifecycle_Audit.csv"
$Report | Export-Csv -Path $Path -NoTypeInformation
