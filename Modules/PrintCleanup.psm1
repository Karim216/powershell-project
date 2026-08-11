function Clear-PrintQueue {
    param(
        [string]$ConfirmedBy = 'Technicien'
    )

    try {
        $spoolerService = Get-Service -Name 'Spooler' -ErrorAction Stop
        if ($spoolerService.Status -eq 'Running') {
            Stop-Service -Name 'Spooler' -Force -ErrorAction Stop
        }

        $spoolerPath = Join-Path $env:SystemRoot 'System32\spool\PRINTERS'
        if (Test-Path $spoolerPath) {
            Get-ChildItem -Path $spoolerPath -Force | Remove-Item -Force -ErrorAction Stop
        }

        Start-Service -Name 'Spooler' -ErrorAction Stop

        $result = [pscustomobject]@{
            Status = 'OK'
            Message = "La file d’impression a été vidée et le service a été redémarré."
        }

        Add-AuditEntry -Action "Vidage de la file d’impression" -ConfirmedBy $ConfirmedBy -ComputerName $env:COMPUTERNAME -Confirmed $true -Result $result.Status -Details $result.Message | Out-Null
        return $result
    }
    catch {
        $errorResult = [pscustomobject]@{
            Status = 'Erreur'
            Message = $_.Exception.Message
        }

        Add-AuditEntry -Action "Vidage de la file d’impression" -ConfirmedBy $ConfirmedBy -ComputerName $env:COMPUTERNAME -Confirmed $true -Result $errorResult.Status -Details $errorResult.Message | Out-Null
        return $errorResult
    }
}

Export-ModuleMember -Function Clear-PrintQueue
