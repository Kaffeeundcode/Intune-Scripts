<#
.SYNOPSIS
    Erstellt eine neue Access Review für eine Entra ID Gruppe.

.DESCRIPTION
    Access Reviews zwingen Gruppenbesitzer, die Mitgliedschaften regelmäßig zu bestätigen.
    Dieses Skript erstellt eine Review für eine spezifische Gruppe.

    Parameter:
    - DisplayName: Name der Review
    - GroupId: ID der zu prüfenden Gruppe
    - ReviewerType: Wer prüft? (GroupOwner, SelectedUsers, Self)
    - DurationDays: Dauer in Tagen

.NOTES
    File Name: 022_New-EntraIDAccessReview.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$DisplayName,
    [Parameter(Mandatory=$true)] [string]$GroupId,
    [Parameter(Mandatory=$true)] [string]$ReviewerType = "GroupOwner",
    [Parameter(Mandatory=$false)] [int]$DurationDays = 14
)

try {
    Write-Host "Erstelle Access Review Definition..." -ForegroundColor Cyan

    $Body = @{
        displayName = $DisplayName
        descriptionForAdmins = "Automated via PowerShell"
        scope = @{
            "@odata.type" = "#microsoft.graph.accessReviewQueryScope"
            query = "/groups/$GroupId/members"
            queryType = "MicrosoftGraph"
            queryRoot = $null
        }
        reviewers = @() # Logik für Reviewer hier vereinfacht
        settings = @{
            mailNotificationsEnabled = $true
            reminderNotificationsEnabled = $true
            justificationRequiredOnApproval = $true
            defaultDecisionEnabled = $true
            defaultDecision = "Deny"
            instanceDurationInDays = $DurationDays
            recurrence = @{
                pattern = @{
                    type = "weekly"
                    interval = 1
                }
                range = @{
                    type = "noEnd"
                    startDate = (Get-Date).ToString("yyyy-MM-dd")
                }
            }
        }
    }

    # API Call (Cmdlets für Access Reviews sind komplex, JSON Body ist oft sicherer)
    $Uri = "https://graph.microsoft.com/v1.0/identityGovernance/accessReviews/definitions"
    
    Invoke-MgGraphRequest -Method POST -Uri $Uri -Body ($Body | ConvertTo-Json -Depth 5) -ContentType "application/json"
    
    Write-Host "Access Review '$DisplayName' erfolgreich angelegt." -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
