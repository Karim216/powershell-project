Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$modulesPath = Join-Path $scriptRoot 'Modules'
$configPath = Join-Path $scriptRoot 'Config/settings.json'
$logsPath = Join-Path $scriptRoot 'Logs'
$reportsPath = Join-Path $scriptRoot 'Reports'

if (-not (Test-Path $logsPath)) { New-Item -ItemType Directory -Path $logsPath -Force | Out-Null }
if (-not (Test-Path $reportsPath)) { New-Item -ItemType Directory -Path $reportsPath -Force | Out-Null }

foreach ($module in @(
    'SystemInfo.psm1',
    'Performance.psm1',
    'Storage.psm1',
    'Network.psm1',
    'Displays.psm1',
    'Printers.psm1',
    'SlowPC.psm1',
    'Security.psm1',
    'WindowsUpdate.psm1',
    'EventLogs.psm1',
    'Software.psm1',
    'Services.psm1',
    'Reports.psm1',
    'AuditLog.psm1',
    'ServicesActions.psm1',
    'PrintCleanup.psm1',
    'CleanupTools.psm1',
    'SecurityActions.psm1',
    'SystemRepair.psm1',
    'WorkspaceManager.psm1',
    'Remediation.psm1'
)) {
    Import-Module (Join-Path $modulesPath $module) -Force
}

function Get-ToolkitSettings {
    if (Test-Path $configPath) {
        return Get-Content -Path $configPath -Raw | ConvertFrom-Json
    }

    return [pscustomobject]@{
        RamWarningThresholdPercent = 80
        DiskWarningThresholdPercent = 85
        PingTarget = '8.8.8.8'
    }
}

function Get-DiagnosticContext {
    param([pscustomobject]$Settings)

    $technician = if ($Settings -and $Settings.DefaultTechnician) { [string]$Settings.DefaultTechnician } else { 'Support' }
    $ticketId = if ($Settings -and $Settings.DefaultTicketId) { [string]$Settings.DefaultTicketId } else { 'Non-renseigné' }
    $context = if ($Settings -and $Settings.DefaultContext) { [string]$Settings.DefaultContext } else { 'Diagnostic standard' }

    $inputTechnician = Read-Host "Nom du technicien [$technician]"
    if ([string]::IsNullOrWhiteSpace($inputTechnician)) { $inputTechnician = $technician }

    $inputTicketId = Read-Host "N° ticket / référence [$ticketId]"
    if ([string]::IsNullOrWhiteSpace($inputTicketId)) { $inputTicketId = $ticketId }

    $inputContext = Read-Host "Contexte de diagnostic [$context]"
    if ([string]::IsNullOrWhiteSpace($inputContext)) { $inputContext = $context }

    return [pscustomobject]@{
        Technician = $inputTechnician
        TicketId = $inputTicketId
        Context = $inputContext
    }
}

function Write-ToolkitLog {
    param(
        [string]$Message,
        [string]$Technician = 'Support',
        [string]$TicketId = 'Non-renseigné',
        [string]$Context = 'Diagnostic standard'
    )

    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    $line = "[$timestamp]|Technicien={$Technician}|Ticket={$TicketId}|Contexte={$Context}|$Message"
    $logFile = Join-Path $logsPath ("ITDiagnostic-{0}.log" -f (Get-Date -Format 'yyyyMMdd'))
    Add-Content -Path $logFile -Value $line
}

function Get-ReportPath {
    param(
        [string]$TicketId = 'Non-renseigné',
        [string]$Technician = 'Support'
    )

    $timestamp = Get-Date -Format 'yyyy-MM-dd_HHmm'
    $hostname = $env:COMPUTERNAME
    if ([string]::IsNullOrWhiteSpace($hostname)) { $hostname = 'POSTE' }
    $safeTech = ($Technician -replace '[^A-Za-z0-9_-]', '_')
    $safeTicket = ($TicketId -replace '[^A-Za-z0-9_-]', '_')
    return Join-Path $reportsPath ("PC-{0}-{1}-{2}-{3}.txt" -f $hostname, $safeTech, $safeTicket, $timestamp)
}

function Export-Report {
    param(
        [string]$Path,
        [string[]]$Lines,
        [string]$Technician = 'Support',
        [string]$TicketId = 'Non-renseigné',
        [string]$Context = 'Diagnostic standard'
    )

    $header = @(
        '========================================',
        'IT DIAGNOSTIC - Rapport support',
        '========================================',
        "Technicien : $Technician",
        "Ticket : $TicketId",
        "Contexte : $Context",
        "Poste : $env:COMPUTERNAME",
        "Date : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')",
        '========================================',
        ''
    )

    Set-Content -Path $Path -Value ($header + $Lines)
    return $Path
}

function Show-Menu {
    Write-Host "" 
    Write-Host "=====================================" -ForegroundColor Cyan
    Write-Host "   SUPPORT TOOLKIT - Phase 1, 2 & 3" -ForegroundColor Cyan
    Write-Host "=====================================" -ForegroundColor Cyan
    Write-Host "1. Diagnostic rapide" 
    Write-Host "2. Diagnostic complet" 
    Write-Host "3. PC lent" 
    Write-Host "4. Informations système" 
    Write-Host "5. Réseau" 
    Write-Host "6. Écrans" 
    Write-Host "7. Imprimantes" 
    Write-Host "8. Stockage" 
    Write-Host "9. Performances" 
    Write-Host "10. Sécurité" 
    Write-Host "11. Windows Update" 
    Write-Host "12. Journaux" 
    Write-Host "13. Logiciels" 
    Write-Host "14. Services critiques" 
    Write-Host "15. Rapport complet" 
    Write-Host "16. Quitter" 
    Write-Host "17. Phase 3 - Actions guidées" 
    Write-Host "" 
}

function Invoke-QuickDiagnostic {
    param([pscustomobject]$Settings)

    $context = Get-DiagnosticContext -Settings $Settings
    $lines = @()
    $lines += "=================================="
    $lines += " IT DIAGNOSTIC - Diagnostic rapide"
    $lines += "=================================="
    $lines += ""

    $system = Get-SystemInfo
    $performance = Get-PerformanceInfo -Settings $Settings
    $storage = Get-StorageInfo -Settings $Settings
    $network = Get-NetworkInfo -Settings $Settings
    $displays = Get-DisplayInfo
    $printers = Get-PrinterInfo
    $slowpc = Get-SlowPCInsight -SystemInfo $system -Performance $performance -Storage $storage -Network $network

    $lines += "[Systeme]" 
    $lines += "- Nom du PC : $($system.HostName)"
    $lines += "- Utilisateur : $($system.UserName)"
    $lines += "- Windows : $($system.WindowsVersion)"
    $lines += ""

    $lines += "[Performances]"
    $lines += "- CPU : $($performance.CpuUsage)"
    $lines += "- RAM : $($performance.MemoryUsage)"
    $lines += ""

    $lines += "[Stockage]"
    $lines += "- Disque principal : $($storage.PrimaryDriveSummary)"
    $lines += ""

    $lines += "[Réseau]"
    $lines += "- IP : $($network.IpAddress)"
    $lines += "- Passerelle : $($network.Gateway)"
    $lines += "- Ping cible : $($network.PingTarget)"
    $lines += ""

    $lines += "[Écrans]"
    $lines += "- Écrans : $($displays.Count)"
    $lines += ""

    $lines += "[Imprimantes]"
    $lines += "- Spooler : $($printers.SpoolerStatus)"
    $lines += ""

    $lines += "[Synthèse PC lent]"
    $lines += $slowpc.Summary

    $reportPath = Export-Report -Path (Get-ReportPath -TicketId $context.TicketId -Technician $context.Technician) -Lines $lines -Technician $context.Technician -TicketId $context.TicketId -Context $context.Context
    $lines += ""
    $lines += "Rapport texte : $reportPath"

    Write-Host ""
    Write-Host "Diagnostic rapide terminé." -ForegroundColor Green
    Write-Host "Rapport enregistré : $reportPath" -ForegroundColor Green
    Write-Host ""

    return $reportPath
}

function Get-Phase2DiagnosticData {
    param([pscustomobject]$Settings)

    $system = Get-SystemInfo
    $performance = Get-PerformanceInfo -Settings $Settings
    $storage = Get-StorageInfo -Settings $Settings
    $network = Get-NetworkInfo -Settings $Settings
    $security = Get-SecurityInfo
    $windowsUpdate = Get-WindowsUpdateInfo
    $eventLogs = Get-EventLogSummary
    $software = Get-SoftwareInfo
    $services = Get-CriticalServiceInfo

    $reportLines = New-StructuredReport -SystemInfo $system -Performance $performance -Storage $storage -Network $network -Security $security -WindowsUpdate $windowsUpdate -EventLogs $eventLogs -Software $software -Services $services

    return [pscustomobject]@{
        SystemInfo = $system
        Performance = $performance
        Storage = $storage
        Network = $network
        Security = $security
        WindowsUpdate = $windowsUpdate
        EventLogs = $eventLogs
        Software = $software
        Services = $services
        ReportLines = $reportLines
    }
}

function Invoke-ModuleByName {
    param([string]$Choice, [pscustomobject]$Settings)

    switch ($Choice) {
        '2' {
            $data = Get-Phase2DiagnosticData -Settings $Settings
            Write-Host "=== Diagnostic complet ===" -ForegroundColor Cyan
            $data.ReportLines | ForEach-Object { Write-Host $_ }
        }
        '3' {
            $system = Get-SystemInfo
            $performance = Get-PerformanceInfo -Settings $Settings
            $storage = Get-StorageInfo -Settings $Settings
            $network = Get-NetworkInfo -Settings $Settings
            $slowpc = Get-SlowPCInsight -SystemInfo $system -Performance $performance -Storage $storage -Network $network
            Write-Host $slowpc.Summary -ForegroundColor Yellow
        }
        '4' {
            $system = Get-SystemInfo
            $system | Format-List | Out-Host
        }
        '5' {
            $network = Get-NetworkInfo -Settings $Settings
            $network | Format-List | Out-Host
        }
        '6' {
            $displays = Get-DisplayInfo
            $displays | Format-List | Out-Host
        }
        '7' {
            $printers = Get-PrinterInfo
            $printers | Format-List | Out-Host
        }
        '8' {
            $storage = Get-StorageInfo -Settings $Settings
            $storage | Format-List | Out-Host
        }
        '9' {
            $performance = Get-PerformanceInfo -Settings $Settings
            $performance | Format-List | Out-Host
        }
        '10' {
            $security = Get-SecurityInfo
            $security | Format-List | Out-Host
        }
        '11' {
            $windowsUpdate = Get-WindowsUpdateInfo
            $windowsUpdate | Format-List | Out-Host
        }
        '12' {
            $eventLogs = Get-EventLogSummary
            $eventLogs | Format-List | Out-Host
        }
        '13' {
            $software = Get-SoftwareInfo
            $software | Format-List | Out-Host
        }
        '14' {
            $services = Get-CriticalServiceInfo
            $services | Format-List | Out-Host
        }
        '15' {
            $data = Get-Phase2DiagnosticData -Settings $Settings
                    $context = Get-DiagnosticContext -Settings $Settings
            $reportPath = Export-Report -Path (Get-ReportPath -TicketId $context.TicketId -Technician $context.Technician) -Lines $data.ReportLines -Technician $context.Technician -TicketId $context.TicketId -Context $context.Context
            Write-Host "Rapport complet enregistré : $reportPath" -ForegroundColor Green
        }
        default {
            Invoke-QuickDiagnostic -Settings $Settings | Out-Null
        }
    }
}

$settings = Get-ToolkitSettings
$bootContext = Get-DiagnosticContext -Settings $settings
Write-ToolkitLog -Message 'Démarrage du toolkit' -Technician $bootContext.Technician -TicketId $bootContext.TicketId -Context $bootContext.Context

while ($true) {
    Show-Menu
    $choice = Read-Host 'Choisissez une option'
    if ($choice -eq '16') { Write-ToolkitLog 'Sortie du toolkit'; break }
    if ($choice -eq '17') {
        try {
            Invoke-Phase3ActionMenu
            Write-ToolkitLog 'Exécution Phase 3'
        }
        catch {
            Write-Host ("Erreur Phase 3 : {0}" -f $_.Exception.Message) -ForegroundColor Red
            Write-ToolkitLog ("Erreur Phase 3 : {0}" -f $_.Exception.Message)
        }
        continue
    }
    if ($choice -notin @('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15')) {
        Write-Host 'Choix non valide.' -ForegroundColor Red
        continue
    }

    try {
        Invoke-ModuleByName -Choice $choice -Settings $settings
        Write-ToolkitLog -Message ("Exécution option {0}" -f $choice) -Technician $bootContext.Technician -TicketId $bootContext.TicketId -Context $bootContext.Context
    }
    catch {
        Write-Host ("Erreur : {0}" -f $_.Exception.Message) -ForegroundColor Red
        Write-ToolkitLog ("Erreur : {0}" -f $_.Exception.Message)
    }
}
