function Get-AuditLogPath {
    $logsPath = Join-Path (Split-Path -Parent (Split-Path -Parent $PSScriptRoot)) 'Logs'
    if (-not (Test-Path $logsPath)) { New-Item -ItemType Directory -Path $logsPath -Force | Out-Null }

    $fileName = "Audit-{0}.log" -f (Get-Date -Format 'yyyyMMdd')
    return Join-Path $logsPath $fileName
}

function Add-AuditEntry {
    param(
        [string]$Action,
        [string]$ConfirmedBy,
        [string]$ComputerName,
        [bool]$Confirmed,
        [string]$Result,
        [string]$Details
    )

    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    $path = Get-AuditLogPath
    $line = "{0}|{1}|{2}|{3}|{4}|{5}|{6}" -f $timestamp, $Action, $ConfirmedBy, $ComputerName, $Confirmed, $Result, $Details
    Add-Content -Path $path -Value $line
    return $path
}

Export-ModuleMember -Function Get-AuditLogPath, Add-AuditEntry
