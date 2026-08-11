function Get-EventLogSummary {
    $errors = @()

    try {
        $errors = Get-WinEvent -MaxEvents 20 -ErrorAction Stop | Where-Object { $_.LevelDisplayName -match 'Error|Critical' } | Select-Object -First 10
    } catch {
        $errors = @()
    }

    $count = $errors.Count
    $status = if ($count -gt 0) { 'Attention' } else { 'OK' }

    return [pscustomobject]@{
        Status = $status
        ErrorCount = $count
        Summary = "$count événement(s) d’erreur critique détecté(s)"
    }
}

Export-ModuleMember -Function Get-EventLogSummary
