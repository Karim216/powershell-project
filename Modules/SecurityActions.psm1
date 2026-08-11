function Invoke-DefenseScan {
    param(
        [string]$ConfirmedBy = 'Technicien'
    )

    try {
        $scan = Start-MpScan -ScanType QuickScan -ErrorAction Stop
        $result = [pscustomobject]@{
            Status = 'OK'
            Message = 'Une analyse Defender rapide a été lancée.'
            Details = $scan
        }

        Add-AuditEntry -Action "Lancement de l’analyse Defender" -ConfirmedBy $ConfirmedBy -ComputerName $env:COMPUTERNAME -Confirmed $true -Result $result.Status -Details $result.Message | Out-Null
        return $result
    }
    catch {
        $errorResult = [pscustomobject]@{
            Status = 'Erreur'
            Message = $_.Exception.Message
        }

        Add-AuditEntry -Action "Lancement de l’analyse Defender" -ConfirmedBy $ConfirmedBy -ComputerName $env:COMPUTERNAME -Confirmed $true -Result $errorResult.Status -Details $errorResult.Message | Out-Null
        return $errorResult
    }
}

Export-ModuleMember -Function Invoke-DefenseScan
