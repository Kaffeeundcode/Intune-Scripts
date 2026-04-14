<#
.SYNOPSIS
    Analyzes Room Mailbox usage and decline rates (Capacity Planning).

.DESCRIPTION
    Checks calendar stats for Room mailboxes.
    Note: Requires access to calendar data or usage logs.
    This script checks the 'BookingWindowInDays' and configuration, plus basic item count
    to infer usage intensity.

.NOTES
    File Name  : 137_Get-ExoRoomMailboxEfficiency.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-ExchangeOnline -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

$Rooms = Get-ExoMailbox -RecipientTypeDetails RoomMailbox -ResultSize Unlimited

$Report = @()

foreach ($Room in $Rooms) {
    # Get Calendar Processing options
    $Proc = Get-CalendarProcessing -Identity $Room.UserPrincipalName
    
    # Get Item Count (Intensity)
    $Stats = Get-ExoMailboxStatistics -Identity $Room.UserPrincipalName
    
    $Report += [PSCustomObject]@{
        RoomName = $Room.DisplayName
        Email = $Room.UserPrincipalName
        Capacity = $Room.ResourceCapacity
        AutoAccept = $Proc.AutomateProcessing
        BookingWindow = $Proc.BookingWindowInDays
        MeetingCount = $Stats.ItemCount
        LastMeeting = $Stats.LastLogonTime
    }
}

$Report | Sort-Object MeetingCount -Descending | Format-Table RoomName, Capacity, MeetingCount, AutoAccept -AutoSize
$Report | Export-Csv "$PSScriptRoot\Room_Efficiency.csv" -NoTypeInformation
