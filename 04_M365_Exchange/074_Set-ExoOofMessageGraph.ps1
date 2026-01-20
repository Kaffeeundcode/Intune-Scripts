<#
.SYNOPSIS
    Setzt eine Abwesenheitsnotiz (Out of Office) via Graph API.

.DESCRIPTION
    Alternativ zu Set-MailboxAutoReplyConfiguration (wenn kein EXO V2 verfügbar).
    Setzt Internal und External Message.

    Parameter:
    - UserPrincipalName: Ziel-User
    - Message: Nachrichtentext
    - StartTime/EndTime: Zeitraum

.NOTES
    File Name: 074_Set-ExoOofMessageGraph.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$UserPrincipalName,
    [Parameter(Mandatory=$true)] [string]$Message,
    [Parameter(Mandatory=$true)] [DateTime]$StartTime,
    [Parameter(Mandatory=$true)] [DateTime]$EndTime
)

try {
    Write-Host "Setze OOF für $UserPrincipalName..." -ForegroundColor Cyan

    $Body = @{
        "@odata.type" = "#microsoft.graph.mailboxSettings"
        automaticRepliesSetting = @{
            status = "scheduled"
            externalAudience = "all"
            scheduledStartDateTime = @{
                dateTime = $StartTime.ToString("yyyy-MM-ddTHH:mm:ss")
                timeZone = "UTC"
            }
            scheduledEndDateTime = @{
                dateTime = $EndTime.ToString("yyyy-MM-ddTHH:mm:ss")
                timeZone = "UTC"
            }
            internalReplyMessage = $Message
            externalReplyMessage = $Message
        }
    }

    # PATCH /users/{id}/mailboxSettings
    # Benötigt MailboxSettings.ReadWrite Permission
    
    Update-MgUserMailboxSetting -UserId $UserPrincipalName -AutomaticRepliesSetting $Body.automaticRepliesSetting -ErrorAction Stop
    
    Write-Host "OOF erfolgreich gesetzt." -ForegroundColor Green

} catch {
    Write-Error "Fehler (Benötigt Graph Berechtigungen): $_"
}
