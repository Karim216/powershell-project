function Get-DisplayInfo {
    $displays = @()

    try {
        $monitors = Get-CimInstance -ClassName Win32_DesktopMonitor -ErrorAction Stop
        foreach ($monitor in $monitors) {
            $displays += [pscustomobject]@{
                DeviceID = $monitor.DeviceID
                Name = $monitor.Name
                Status = $monitor.Status
            }
        }
    } catch {
        $displays = @([pscustomobject]@{ Name = 'Non disponible'; Status = 'Non disponible' })
    }

    return [pscustomobject]@{
        Count = $displays.Count
        Displays = $displays
        Status = if ($displays.Count -gt 0) { 'OK' } else { 'Attention' }
    }
}

Export-ModuleMember -Function Get-DisplayInfo
