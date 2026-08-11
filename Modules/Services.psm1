function Get-CriticalServiceInfo {
    $servicesToCheck = @('Spooler', 'wuauserv', 'Dhcp', 'Dnscache')
    $results = @()

    foreach ($serviceName in $servicesToCheck) {
        try {
            $service = Get-Service -Name $serviceName -ErrorAction Stop
            $results += [pscustomobject]@{
                Name = $serviceName
                Status = $service.Status.ToString()
            }
        }
        catch {
            $results += [pscustomobject]@{
                Name = $serviceName
                Status = 'Non disponible'
            }
        }
    }

    $failed = $results | Where-Object { $_.Status -ne 'Running' -and $_.Status -ne 'Started' }
    $status = if ($failed) { 'Attention' } else { 'OK' }

    return [pscustomobject]@{
        Status = $status
        Services = $results
        Summary = "Services critiques vérifiés: $($results.Count)"
    }
}

Export-ModuleMember -Function Get-CriticalServiceInfo
