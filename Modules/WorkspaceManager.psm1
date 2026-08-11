function Start-WorkspacePreparation {
    param(
        [string]$ConfirmedBy = 'Technicien',
        [string[]]$Applications = @('outlook.exe', 'msedge.exe')
    )

    $results = @()

    foreach ($app in $Applications) {
        try {
            $process = Get-Command $app -ErrorAction Stop
            Start-Process $process.Source -ErrorAction Stop
            $results += "$app -> Lancé"
        }
        catch {
            $results += "$app -> Non disponible"
        }
    }

    $status = if ($results -match 'Non disponible') { 'Attention' } else { 'OK' }
    $message = ($results -join '; ')

    Add-AuditEntry -Action 'Préparation du poste et lancement des outils' -ConfirmedBy $ConfirmedBy -ComputerName $env:COMPUTERNAME -Confirmed $true -Result $status -Details $message | Out-Null

    return [pscustomobject]@{
        Status = $status
        Message = $message
    }
}

Export-ModuleMember -Function Start-WorkspacePreparation
