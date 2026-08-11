function New-StructuredReport {
    param(
        [pscustomobject]$SystemInfo,
        [pscustomobject]$Performance,
        [pscustomobject]$Storage,
        [pscustomobject]$Network,
        [pscustomobject]$Security,
        [pscustomobject]$WindowsUpdate,
        [pscustomobject]$EventLogs,
        [pscustomobject]$Software,
        [pscustomobject]$Services
    )

    $issues = @()
    $moduleStatuses = @()

    foreach ($entry in @(
        @{ Name = 'Performance'; Status = if ($null -ne $Performance) { [string]$Performance.Status } else { 'Inconnu' } },
        @{ Name = 'Stockage'; Status = if ($null -ne $Storage) { [string]$Storage.Status } else { 'Inconnu' } },
        @{ Name = 'Réseau'; Status = if ($null -ne $Network) { [string]$Network.Status } else { 'Inconnu' } },
        @{ Name = 'Sécurité'; Status = if ($null -ne $Security) { [string]$Security.Status } else { 'Inconnu' } },
        @{ Name = 'Windows Update'; Status = if ($null -ne $WindowsUpdate) { [string]$WindowsUpdate.Status } else { 'Inconnu' } },
        @{ Name = 'Journaux'; Status = if ($null -ne $EventLogs) { [string]$EventLogs.Status } else { 'Inconnu' } }
    )) {
        $moduleStatuses += $entry
        if ($entry.Status -eq 'Attention') { $issues += $entry.Name }
    }

    $score = 100
    $score -= ($issues.Count * 7)
    if ($score -lt 0) { $score = 0 }

    $lines = @()
    $lines += '============================'
    $lines += 'Rapport IT Diagnostic'
    $lines += '============================'
    $lines += ''
    $lines += "Poste : $($SystemInfo.HostName)"
    $lines += "Utilisateur : $($SystemInfo.UserName)"
    $lines += "Windows : $($SystemInfo.WindowsVersion)"
    $lines += ''
    $lines += "Score de santé : $score / 100"
    if ($issues.Count -gt 0) {
        $lines += "Points d’attention : $($issues -join ', ')"
    } else {
        $lines += "Points d’attention : Aucun"
    }
    $lines += ''
    $lines += 'Résumé par module'
    foreach ($module in $moduleStatuses) {
        $lines += "- $($module.Name) : $($module.Status)"
    }
    $lines += "- Logiciels : $($Software.Status)"
    $lines += "- Services critiques : $($Services.Status)"
    $lines += ''
    $lines += 'Actions recommandées'
    $lines += '- Vérifier les points signalés ci-dessus'
    $lines += '- Documenter les résultats dans le ticket associé'

    return $lines
}

Export-ModuleMember -Function New-StructuredReport
