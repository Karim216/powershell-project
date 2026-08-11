function Get-PerformanceInfo {
    param([pscustomobject]$Settings)

    $cpu = 'Non disponible'
    $memory = 'Non disponible'

    try {
        $cpu = (Get-Counter -Counter '\Processor(_Total)\% Processor Time' -ErrorAction Stop | Select-Object -ExpandProperty CounterSamples | Select-Object -First 1 -ExpandProperty CookedValue).ToString('0.0') + '%'
    } catch { }

    try {
        $memoryInfo = Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction Stop
        $usedMemory = [math]::Round((($memoryInfo.TotalVisibleMemorySize - $memoryInfo.FreePhysicalMemory) / $memoryInfo.TotalVisibleMemorySize) * 100, 1)
        $memory = "$usedMemory% utilisée"
    } catch {
        $memory = 'Non disponible'
    }

    $warningThreshold = if ($Settings) { [int]$Settings.RamWarningThresholdPercent } else { 80 }
    $status = if ($memory -ne 'Non disponible' -and [int]($memory -replace '%.*', '') -ge $warningThreshold) { 'Attention' } else { 'OK' }

    return [pscustomobject]@{
        CpuUsage = $cpu
        MemoryUsage = $memory
        Status = $status
    }
}

Export-ModuleMember -Function Get-PerformanceInfo
