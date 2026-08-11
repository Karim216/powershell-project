function Restart-CriticalService {
    param(
        [string]$ServiceName = 'Spooler',
        [string]$ConfirmedBy = 'Technicien'
    )

    try {
        $service = Get-Service -Name $ServiceName -ErrorAction Stop
        if ($service.Status -eq 'Running') {
            Stop-Service -Name $ServiceName -Force -ErrorAction Stop
        }

        Start-Service -Name $ServiceName -ErrorAction Stop

        $result = [pscustomobject]@{
            ServiceName = $ServiceName
            Status = 'OK'
            Message = "Le service $ServiceName a été redémarré avec succès."
        }

        Add-AuditEntry -Action "Redémarrage du service $ServiceName" -ConfirmedBy $ConfirmedBy -ComputerName $env:COMPUTERNAME -Confirmed $true -Result $result.Status -Details $result.Message | Out-Null
        return $result
    }
    catch {
        $errorResult = [pscustomobject]@{
            ServiceName = $ServiceName
            Status = 'Erreur'
            Message = $_.Exception.Message
        }

        Add-AuditEntry -Action "Redémarrage du service $ServiceName" -ConfirmedBy $ConfirmedBy -ComputerName $env:COMPUTERNAME -Confirmed $true -Result $errorResult.Status -Details $errorResult.Message | Out-Null
        return $errorResult
    }
}

Export-ModuleMember -Function Restart-CriticalService
