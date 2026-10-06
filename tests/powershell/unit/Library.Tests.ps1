BeforeAll {
    $script:repo = (Resolve-Path "$PSScriptRoot/../../..").Path
    function global:Invoke-MgGraphRequest { [CmdletBinding()]param($Uri,$Method,$Body,$OutputType,$ContentType) throw 'Unmocked Graph request' }
    function global:Get-MgContext { [CmdletBinding()]param() $null }
    function global:Connect-MgGraph { [CmdletBinding()]param($Scopes,$TenantId,$ContextScope,[switch]$NoWelcome) throw 'No tenant login in unit tests' }
    Import-Module "$script:repo/Common/IntuneLibrary.psm1" -Force
    Import-Module "$script:repo/Common/IntuneReportLibrary.psm1" -Force
    function global:Get-CsCallQueue { [CmdletBinding()]param($First,$Skip) throw 'Unmocked Teams request' }
    function global:Get-CsAutoAttendant { [CmdletBinding()]param($First,$Skip) throw 'Unmocked Teams request' }
    function global:Connect-MicrosoftTeams { [CmdletBinding()]param() throw 'No Teams login in unit tests' }
    . "$script:repo/16_Teams_Telephony/000_TeamsTelephonyHelper.ps1"
}

Describe 'Graph collection completeness' {
    It 'collects two pages without exposing incomplete rows' {
        Mock Invoke-MgGraphRequest -ModuleName IntuneLibrary {
            if ($Uri -like '*page=2') { [pscustomobject]@{value=@([pscustomobject]@{id='b'})} }
            else { [pscustomobject]@{value=@([pscustomobject]@{id='a'});'@odata.nextLink'='https://graph.microsoft.com/v1.0/users?page=2'} }
        }
        $rows=@(Get-IlGraphCollection 'https://graph.microsoft.com/v1.0/users')
        $rows.Count | Should -Be 2
        $rows[1].id | Should -Be 'b'
    }
    It 'rejects a looping nextLink' {
        Mock Invoke-MgGraphRequest -ModuleName IntuneLibrary { [pscustomobject]@{value=@();'@odata.nextLink'=$Uri} }
        { Get-IlGraphCollection 'https://graph.microsoft.com/v1.0/users' } | Should -Throw '*nextLink*'
    }
    It 'rejects foreign nextLink hosts before sending credentials' {
        Mock Invoke-MgGraphRequest -ModuleName IntuneLibrary { [pscustomobject]@{value=@();'@odata.nextLink'='https://example.com/steal'} }
        { Get-IlGraphCollection 'https://graph.microsoft.com/v1.0/users' } | Should -Throw '*graph.microsoft.com*'
        Should -Invoke Invoke-MgGraphRequest -ModuleName IntuneLibrary -Times 1 -Exactly
    }
    It 'returns no partial collection after a second-page failure' {
        Mock Invoke-MgGraphRequest -ModuleName IntuneLibrary {
            if ($Uri -like '*page=2') { throw 'Denied' }
            [pscustomobject]@{value=@([pscustomobject]@{id='a'});'@odata.nextLink'='https://graph.microsoft.com/v1.0/users?page=2'}
        }
        $received=New-Object 'System.Collections.Generic.List[object]'
        try { Get-IlGraphCollection 'https://graph.microsoft.com/v1.0/users' | ForEach-Object {$received.Add($_)} } catch {}
        $received.Count | Should -Be 0
    }
    It 'distinguishes an empty collection from an invalid response' {
        Mock Invoke-MgGraphRequest -ModuleName IntuneLibrary { [pscustomobject]@{value=@()} }
        @(Get-IlGraphCollection 'https://graph.microsoft.com/v1.0/users').Count | Should -Be 0
        Mock Invoke-MgGraphRequest -ModuleName IntuneLibrary { [pscustomobject]@{error='bad'} }
        { Get-IlGraphCollection 'https://graph.microsoft.com/v1.0/users' } | Should -Throw '*Collection*'
    }
    It 'does not repeat an ambiguous mutation failure' {
        Mock Invoke-MgGraphRequest -ModuleName IntuneLibrary { throw 'Lost connection after submission' }
        { Invoke-IlGraph -Uri 'https://graph.microsoft.com/v1.0/users' -Method POST -Body @{} } | Should -Throw
        Should -Invoke Invoke-MgGraphRequest -ModuleName IntuneLibrary -Times 1 -Exactly
    }
}
Describe 'Intune report export' {
    It 'polls a job and imports the exported CSV' {
        $global:IlReportPoll = 0
        Mock Invoke-MgGraphRequest -ModuleName IntuneLibrary {
            if ($Method -eq 'POST') { return [pscustomobject]@{id='job-1'} }
            $global:IlReportPoll++
            if ($global:IlReportPoll -eq 1) { return [pscustomobject]@{status='inProgress'} }
            [pscustomobject]@{status='completed';url='https://tenant.blob.core.windows.net/reports/job-1.zip'}
        }
        Mock Start-Sleep -ModuleName IntuneReportLibrary {}
        Mock Invoke-WebRequest -ModuleName IntuneReportLibrary { Set-Content -LiteralPath $OutFile -Value 'archive' }
        Mock Expand-Archive -ModuleName IntuneReportLibrary {
            New-Item -ItemType Directory -Path $DestinationPath -Force | Out-Null
            "Name,State`nTEST-PC,failed" | Set-Content -LiteralPath (Join-Path $DestinationPath 'report.csv')
        }
        $rows=@(Invoke-IlReportExport -ReportName DeviceEnrollmentFailures -PollIntervalSeconds 1)
        $rows.Count | Should -Be 1
        $rows[0].Name | Should -Be 'TEST-PC'
        Should -Invoke Invoke-MgGraphRequest -ModuleName IntuneLibrary -Times 3 -Exactly
        Should -Invoke Invoke-WebRequest -ModuleName IntuneReportLibrary -Times 1 -Exactly
        Remove-Variable IlReportPoll -Scope Global -ErrorAction SilentlyContinue
    }
    It 'rejects a foreign export download host' {
        Mock Invoke-MgGraphRequest -ModuleName IntuneLibrary {
            if ($Method -eq 'POST') { return [pscustomobject]@{id='job-2'} }
            [pscustomobject]@{status='completed';url='https://example.com/report.zip'}
        }
        Mock Invoke-WebRequest -ModuleName IntuneReportLibrary { throw 'Download must not run' }
        { Invoke-IlReportExport -ReportName Devices } | Should -Throw '*Azure Blob Storage*'
        Should -Invoke Invoke-WebRequest -ModuleName IntuneReportLibrary -Times 0 -Exactly
    }
    It 'surfaces a failed report job without downloading' {
        Mock Invoke-MgGraphRequest -ModuleName IntuneLibrary {
            if ($Method -eq 'POST') { return [pscustomobject]@{id='job-3'} }
            [pscustomobject]@{status='failed';localizedFailureReason='Denied'}
        }
        Mock Invoke-WebRequest -ModuleName IntuneReportLibrary { throw 'Download must not run' }
        { Invoke-IlReportExport -ReportName Devices } | Should -Throw '*Denied*'
        Should -Invoke Invoke-WebRequest -ModuleName IntuneReportLibrary -Times 0 -Exactly
    }
}
Describe 'Identity and session checks' {
    It 'rejects an ambiguous device name' {
        Mock Invoke-MgGraphRequest -ModuleName IntuneLibrary { [pscustomobject]@{value=@([pscustomobject]@{id='a'},[pscustomobject]@{id='b'})} }
        { Resolve-IlDevice -DeviceName 'DUPLICATE' } | Should -Throw '*2 Geraete*'
    }
    It 'escapes an apostrophe in an OData string literal' {
        Mock Invoke-MgGraphRequest -ModuleName IntuneLibrary { [pscustomobject]@{value=@([pscustomobject]@{id='a'})} }
        Resolve-IlDevice -DeviceName "O'Brien" | Out-Null
        Should -Invoke Invoke-MgGraphRequest -ModuleName IntuneLibrary -ParameterFilter { [uri]::UnescapeDataString($Uri) -like "*O''Brien*" } -Times 1
    }
    It 'refuses SkipConnect without authentication' {
        Mock Get-MgContext -ModuleName IntuneLibrary { $null }
        { Connect-IlGraph -Scopes User.Read.All -SkipConnect } | Should -Throw '*Keine aktive*'
    }
    It 'refuses a different tenant' {
        Mock Get-MgContext -ModuleName IntuneLibrary { [pscustomobject]@{TenantId='other';AuthType='Delegated';Scopes=@('User.Read.All')} }
        { Connect-IlGraph -Scopes User.Read.All -TenantId requested -SkipConnect } | Should -Throw '*anderen Tenant*'
    }
}
Describe 'Teams paging and value semantics' {
    It 'reads all 235 queues, not only the first 100' {
        Mock Get-CsCallQueue {
            if ($Skip -ge 235) {return}
            $Skip..([math]::Min($Skip+$First-1,234)) | ForEach-Object {[pscustomobject]@{Identity="queue-$_"}}
        }
        @(Get-TtAllPaged -Command Get-CsCallQueue).Count | Should -Be 235
        Should -Invoke Get-CsCallQueue -Times 3 -Exactly
    }
    It 'detects repeated queue pages' {
        Mock Get-CsCallQueue { 1..100 | ForEach-Object {[pscustomobject]@{Identity="queue-$_"}} }
        {Get-TtAllPaged -Command Get-CsCallQueue} | Should -Throw '*wiederholte ID*'
    }
    It 'uses the auto-attendant Id property' {
        Mock Get-CsAutoAttendant {[pscustomobject]@{Id='aa-1';ApplicationInstances=@('ra-1')}}
        @(Get-TtAllPaged -Command Get-CsAutoAttendant).Count | Should -Be 1
    }
    It 'treats zero counts only as missing' {
        $items=@([pscustomobject]@{Agents=@()},[pscustomobject]@{Agents=@('one')})
        $summary=@(Get-TtCoverageSummary $items 'Agents.Count')
        $summary[0].Count | Should -Be 1
        $summary[1].Count | Should -Be 1
        ($summary[0].Count+$summary[1].Count) | Should -Be $summary[2].Count
    }
    It 'stops after a login error' {
        Mock Connect-MicrosoftTeams {throw 'Denied'}
        {Initialize-TtSession} | Should -Throw '*Teams-Anmeldung fehlgeschlagen*'
    }
    It 'exports one row as a JSON array' {
        $file=Join-Path $TestDrive 'one.json'
        Export-TtData -Data ([pscustomobject]@{Name='single'}) -OutputPath $file
        (Get-Content $file -Raw).Trim().StartsWith('[') | Should -BeTrue
    }
}
Describe 'Mutating script WhatIf guards' {
    BeforeEach {
        Mock Connect-IlGraph {}
        Mock Resolve-IlDevice {[pscustomobject]@{id='device-1';deviceName='TEST-PC'}}
        Mock Invoke-IlGraph {throw 'Mutation must not be called'}
    }
    It 'does not send a wipe' {
        & "$script:repo/01_Device_Management/04_Wipe-IntuneDevice.ps1" -DeviceId device-1 -WhatIf
        Should -Invoke Invoke-IlGraph -Times 0 -Exactly
    }
    It 'does not delete a managed device' {
        & "$script:repo/01_Device_Management/09_Delete-IntuneDevice.ps1" -DeviceId device-1 -WhatIf
        Should -Invoke Invoke-IlGraph -Times 0 -Exactly
    }
}
Describe 'Local detection and snapshot workflows' {
    It 'runs a copied detection script in a fresh process without the repository' {
        $copy=Join-Path $TestDrive 'copied-detection.ps1'
        Copy-Item "$script:repo/17_Intune_Workflows/355_Test-IntuneWin32AppDetection.ps1" $copy
        $fixture=Join-Path $TestDrive 'installed.exe'; Set-Content $fixture 'fixture'
        $rules=Join-Path $TestDrive 'isolated-rules.json'
        ConvertTo-Json -InputObject @(@{type='file';path=$fixture}) | Set-Content $rules
        $engine=if($PSVersionTable.PSEdition -eq 'Desktop'){Join-Path $PSHOME 'powershell.exe'}elseif($env:OS -eq 'Windows_NT'){Join-Path $PSHOME 'pwsh.exe'}else{Join-Path $PSHOME 'pwsh'}
        $output=& $engine -NoProfile -File $copy -RulePath $rules -IntuneOutput
        $LASTEXITCODE | Should -Be 0
        $output | Should -Contain 'Detected'
    }
    It 'runs a copied Teams summary with only the external command stub in a fresh process' {
        $copy=Join-Path $TestDrive 'copied-teams.ps1'
        Copy-Item "$script:repo/16_Teams_Telephony/350_Get-TeamsTelephonyTenantSummary.ps1" $copy
        $runner=Join-Path $TestDrive 'run-teams.ps1'
        @'
param([string]$Target)
function Get-CsOnlineUser { param($ResultSize) [pscustomobject]@{LineURI='tel:+491234';EnterpriseVoiceEnabled=$true;HostedVoiceMail=$true} }
$rows=@(& $Target -SkipConnect -OutputPath '' -PassThru)
if (($rows | Where-Object Metric -eq TotalUsers).Count -ne 1) { exit 1 }
'ISOLATED_TEAMS_OK'
'@ | Set-Content $runner
        $engine=if($PSVersionTable.PSEdition -eq 'Desktop'){Join-Path $PSHOME 'powershell.exe'}elseif($env:OS -eq 'Windows_NT'){Join-Path $PSHOME 'pwsh.exe'}else{Join-Path $PSHOME 'pwsh'}
        $output=& $engine -NoProfile -File $runner -Target $copy
        $LASTEXITCODE | Should -Be 0
        $output | Should -Contain 'ISOLATED_TEAMS_OK'
    }
    It 'detects a real local file and rejects a missing file' {
        $file=Join-Path $TestDrive 'app.exe'; Set-Content $file 'fixture'
        $rules=Join-Path $TestDrive 'rules.json'
        ConvertTo-Json -InputObject @(@{type='file';path=$file},@{type='file';path=(Join-Path $TestDrive 'absent.exe')}) | Set-Content $rules
        $rows=@(& "$script:repo/17_Intune_Workflows/355_Test-IntuneWin32AppDetection.ps1" -RulePath $rules)
        $rows[0].Status | Should -Be Detected
        $rows[1].Status | Should -Be NotDetected
    }
    It 'marks unsupported detection as unevaluable instead of compliant' {
        $rules=Join-Path $TestDrive 'unsupported.json'
        '{"type":"executePowerShell","path":"unused"}' | Set-Content $rules
        (& "$script:repo/17_Intune_Workflows/355_Test-IntuneWin32AppDetection.ps1" -RulePath $rules).Status | Should -Be NotEvaluated
    }
    It 'ignores property ordering but detects configuration changes' {
        $a=Join-Path $TestDrive 'a.json';$b=Join-Path $TestDrive 'b.json'
        $snapshot=@{SchemaVersion=1;TenantId='tenant';Complete=$true;Families=@('deviceConfigurations');Objects=@(@{Family='deviceConfigurations';Id='1';Configuration=@{name='One';enabled=$true};Children=@{}})}
        $snapshot | ConvertTo-Json -Depth 20 | Set-Content $a
        $snapshot | ConvertTo-Json -Depth 20 | Set-Content $b
        @(& "$script:repo/17_Intune_Workflows/354_Compare-IntuneConfigurationSnapshot.ps1" -BeforePath $a -AfterPath $b).Count | Should -Be 0
        $snapshot.Objects[0].Configuration.enabled=$false
        $snapshot | ConvertTo-Json -Depth 20 | Set-Content $b
        (& "$script:repo/17_Intune_Workflows/354_Compare-IntuneConfigurationSnapshot.ps1" -BeforePath $a -AfterPath $b).Change | Should -Be Changed
    }
    It 'refuses incomplete snapshots' {
        $a=Join-Path $TestDrive 'incomplete.json'
        '{"SchemaVersion":1,"Complete":false,"TenantId":"tenant"}'|Set-Content $a
        {& "$script:repo/17_Intune_Workflows/354_Compare-IntuneConfigurationSnapshot.ps1" -BeforePath $a -AfterPath $a} | Should -Throw '*vollstaendige*'
    }
    It 'reports missing package entry points without executing content' {
        $folder=Join-Path $TestDrive 'empty';New-Item -ItemType Directory $folder | Out-Null
        $findings=@(& "$script:repo/17_Intune_Workflows/356_Test-IntuneWin32PackageFolder.ps1" -PackagePath $folder)
        @($findings | Where-Object Status -eq Auffaellig).Count | Should -BeGreaterOrEqual 4
    }
}
