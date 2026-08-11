function Clear-TemporaryFiles {
    param(
        [string]$ConfirmedBy = 'Technicien'
    )

    $results = @()

    foreach ($path in @($env:TEMP, $env:SystemRoot + '\Temp')) {
        if (-not (Test-Path $path)) { continue }

        try {
            Get-ChildItem -Path $path -Force -ErrorAction Stop | Where-Object { $_.Name -notmatch 'System|Windows' } | Remove-Item -Recurse -Force -ErrorAction Stop
            $results += "Nettoyage OK : $path"
        }
        catch {
            $results += "Nettoyage KO : $path - $($_.Exception.Message)"
        }
    }

    $status = if ($results -match 'KO') { 'Attention' } else { 'OK' }
    $message = ($results -join '; ')

    Add-AuditEntry -Action 'Nettoyage des fichiers temporaires' -ConfirmedBy $ConfirmedBy -ComputerName $env:COMPUTERNAME -Confirmed $true -Result $status -Details $message | Out-Null

    return [pscustomobject]@{
        Status = $status
        Message = $message
    }
}

Export-ModuleMember -Function Clear-TemporaryFiles
