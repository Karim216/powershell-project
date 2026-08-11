function Get-WindowsUpdateInfo {
    $pending = 'Non disponible'
    $rebootRequired = 'Non disponible'
    $status = 'OK'

    try {
        $rebootKey = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending' -ErrorAction Stop
        if ($rebootKey) { $rebootRequired = 'Oui' }
    } catch { }

    try {
        $updates = Get-WindowsUpdateLog -ErrorAction SilentlyContinue
        if ($updates) { $pending = 'Des mises à jour sont disponibles' }
    } catch {
        $pending = 'Non disponible'
    }

    if ($rebootRequired -eq 'Oui') { $status = 'Attention' }

    return [pscustomobject]@{
        Status = $status
        PendingUpdates = $pending
        RebootRequired = $rebootRequired
        Summary = "Mises à jour: $pending | Redémarrage requis: $rebootRequired"
    }
}

Export-ModuleMember -Function Get-WindowsUpdateInfo
