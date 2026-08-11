function Get-SecurityInfo {
    $defender = 'Non disponible'
    $firewall = 'Non disponible'
    $bitlocker = 'Non disponible'

    try {
        $mp = Get-MpComputerStatus -ErrorAction Stop
        $defender = if ($mp.AntivirusEnabled -and $mp.AntispywareEnabled) { 'OK' } else { 'Attention' }
    } catch { }

    try {
        $profile = Get-NetFirewallProfile -ErrorAction Stop | Select-Object -First 1
        $firewall = if ($profile.Enabled -eq 'True') { 'OK' } else { 'Attention' }
    } catch { }

    try {
        $bl = Get-BitLockerVolume -ErrorAction Stop | Select-Object -First 1
        $bitlocker = if ($bl.ProtectionStatus -eq 'On') { 'OK' } else { 'Attention' }
    } catch { }

    $status = if ($defender -eq 'Attention' -or $firewall -eq 'Attention' -or $bitlocker -eq 'Attention') { 'Attention' } else { 'OK' }

    return [pscustomobject]@{
        Status = $status
        DefenderStatus = $defender
        FirewallStatus = $firewall
        BitLockerStatus = $bitlocker
        Summary = "Défender: $defender | Pare-feu: $firewall | BitLocker: $bitlocker"
    }
}

Export-ModuleMember -Function Get-SecurityInfo
