function Get-SoftwareInfo {
    $software = @()

    try {
        $software = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*' -ErrorAction Stop |
            Where-Object { $_.DisplayName -and $_.DisplayName -notmatch 'Microsoft|Windows' } |
            Select-Object -ExpandProperty DisplayName -ErrorAction SilentlyContinue
    } catch {
        $software = @()
    }

    $count = if ($software) { $software.Count } else { 0 }

    return [pscustomobject]@{
        Status = if ($count -gt 0) { 'OK' } else { 'Attention' }
        InstalledSoftwareCount = $count
        Summary = "$count logiciel(s) installé(s) détecté(s)"
    }
}

Export-ModuleMember -Function Get-SoftwareInfo
