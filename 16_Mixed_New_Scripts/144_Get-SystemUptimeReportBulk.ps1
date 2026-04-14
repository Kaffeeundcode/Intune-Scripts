<#
.SYNOPSIS
    Queries a list of remote computers (WMI/CIM) for their uptime.

.DESCRIPTION
    Simple audit tool for Admin PCs.
    Input: List of computer names.
    Output: Boot time and Uptime days.

.NOTES
    File Name  : 144_Get-SystemUptimeReportBulk.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Param(
    [string[]]$ComputerName = "localhost"
)

$Report = @()

foreach ($Comp in $ComputerName) {
    if (Test-Connection $Comp -Count 1 -Quiet) {
        try {
            $OS = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $Comp -ErrorAction Stop
            $Boot = $OS.LastBootUpTime
            $Uptime = (Get-Date) - $Boot
            
            $Report += [PSCustomObject]@{
                Computer = $Comp
                BootTime = $Boot
                DaysUp = $Uptime.Days
                HoursUp = $Uptime.Hours
                Status = "Online"
            }
        } catch {
             $Report += [PSCustomObject]@{ Computer = $Comp; Status = "Access Denied/WMI Error" }
        }
    } else {
        $Report += [PSCustomObject]@{ Computer = $Comp; Status = "Offline" }
    }
}

$Report | Format-Table Computer, DaysUp, Status -AutoSize
