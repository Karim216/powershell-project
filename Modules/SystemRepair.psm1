function Run-SystemRepair {
    param(
        [string]$ConfirmedBy = 'Technicien'
    )

    $results = @()

    foreach ($command in @('sfc /scannow', 'DISM /Online /Cleanup-Image /RestoreHealth')) {
        try {
            $output = Invoke-Expression $command 2>&1
            $results += "$command -> OK"
        }
        catch {
            $results += "$command -> Erreur : $($_.Exception.Message)"
        }
    }

    $status = if ($results -match 'Erreur') { 'Attention' } else { 'OK' }
    $message = ($results -join '; ')

    Add-AuditEntry -Action 'Lancement des réparations système' -ConfirmedBy $ConfirmedBy -ComputerName $env:COMPUTERNAME -Confirmed $true -Result $status -Details $message | Out-Null

    return [pscustomobject]@{
        Status = $status
        Message = $message
    }
}

Export-ModuleMember -Function Run-SystemRepair
