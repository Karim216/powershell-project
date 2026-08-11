function Get-NetworkInfo {
    param([pscustomobject]$Settings)

    $ip = 'Non disponible'
    $gateway = 'Non disponible'
    $pingResult = 'Non disponible'

    try {
        $adapter = Get-NetIPAddress -AddressFamily IPv4 -ErrorAction Stop | Where-Object { $_.IPAddress -and $_.IPAddress -notmatch '127\.' } | Select-Object -First 1
        if ($adapter) {
            $ip = $adapter.IPAddress
            $gateway = 'Non disponible'
        }
    } catch { }

    $target = if ($Settings) { $Settings.PingTarget } else { '8.8.8.8' }

    try {
        $ping = Test-Connection -ComputerName $target -Count 1 -Quiet -ErrorAction Stop
        $pingResult = if ($ping) { 'OK' } else { 'Échec' }
    } catch {
        $pingResult = 'Non disponible'
    }

    return [pscustomobject]@{
        IpAddress = $ip
        Gateway = $gateway
        PingTarget = $target
        PingResult = $pingResult
        Status = if ($pingResult -eq 'OK') { 'OK' } else { 'Attention' }
    }
}

Export-ModuleMember -Function Get-NetworkInfo
