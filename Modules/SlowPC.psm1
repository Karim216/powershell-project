function Get-SlowPCInsight {
    param(
        [pscustomobject]$SystemInfo,
        [pscustomobject]$Performance,
        [pscustomobject]$Storage,
        [pscustomobject]$Network
    )

    $lines = @()
    $lines += 'Cause probable'
    $lines += ''

    if ($Performance.Status -eq 'Attention') {
        $lines += '- Saturation mémoire ou CPU détectée'
    }

    if ($Storage.Status -eq 'Attention') {
        $lines += '- Espace disque faible'
    }

    if ($Network.Status -eq 'Attention') {
        $lines += '- Problème de connectivité réseau détecté'
    }

    if ($lines.Count -eq 2) {
        $lines += '- Aucun symptôme majeur détecté à ce stade'
    }

    return [pscustomobject]@{
        Summary = ($lines -join [Environment]::NewLine)
    }
}

Export-ModuleMember -Function Get-SlowPCInsight
