function Get-StorageInfo {
    param([pscustomobject]$Settings)

    $primaryDrive = 'Non disponible'
    $summary = 'Non disponible'

    try {
        $drive = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID='C:'" -ErrorAction Stop
        if ($drive) {
            $usedPercent = [math]::Round((($drive.Size - $drive.FreeSpace) / $drive.Size) * 100, 1)
            $primaryDrive = "C: $usedPercent% utilisé"
            $warningThreshold = if ($Settings) { [int]$Settings.DiskWarningThresholdPercent } else { 85 }
            $status = if ($usedPercent -ge $warningThreshold) { 'Attention' } else { 'OK' }
            $summary = "Statut $status - $primaryDrive"
        }
    } catch {
        $summary = 'Non disponible'
    }

    return [pscustomobject]@{
        PrimaryDriveSummary = $summary
        Status = if ($summary -match 'Attention') { 'Attention' } else { 'OK' }
    }
}

Export-ModuleMember -Function Get-StorageInfo
