<#
.SYNOPSIS
    Exportiert Mitglieder aller Verteilerlisten in eine CSV.

.DESCRIPTION
    Erstellt eine Übersicht, wer in welchen Distribution Groups ist.
    
    Parameter:
    - OutputFile: Pfad zur CSV (Default: Desktop)

.NOTES
    File Name: 073_Get-ExoDistributionGroupMembers.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [string]$OutputFile = "$HOME/Desktop/DistributionGroups.csv"
)

try {
    Write-Host "Sammle Distribution Groups..." -ForegroundColor Cyan
    $Groups = Get-DistributionGroup -ResultSize Unlimited

    $Results = @()

    foreach ($g in $Groups) {
        Write-Host " - $($g.DisplayName)"
        $Members = Get-DistributionGroupMember -Identity $g.PrimarySmtpAddress -ResultSize Unlimited
        
        foreach ($m in $Members) {
            $Results += [PSCustomObject]@{
                GroupName = $g.DisplayName
                GroupEmail = $g.PrimarySmtpAddress
                MemberName = $m.Name
                MemberEmail = $m.PrimarySmtpAddress
                MemberType = $m.RecipientType
            }
        }
    }

    $Results | Export-Csv -Path $OutputFile -NoTypeInformation -Encoding UTF8
    Write-Host "Export fertig: $OutputFile" -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
