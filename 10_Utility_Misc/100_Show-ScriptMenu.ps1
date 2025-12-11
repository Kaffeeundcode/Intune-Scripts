<#
.SYNOPSIS
    Zeigt ein einfaches Menü aller Skripte (Demo).
    
.DESCRIPTION
    Listet alle .ps1 Dateien im aktuellen Ordner auf.
    
.NOTES
    File Name: 100_Show-ScriptMenu.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

$Scripts = Get-ChildItem -Recurse -Filter *.ps1
$i = 1
foreach ($S in $Scripts) {
    Write-Host "$i - $($S.Name)"
    $i++
}
Write-Host "Wählen Sie eine Nummer (Demo)."
