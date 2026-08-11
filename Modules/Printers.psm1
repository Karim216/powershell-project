function Get-PrinterInfo {
    $spooler = 'Non disponible'
    $queue = 'Non disponible'

    try {
        $service = Get-Service -Name Spooler -ErrorAction Stop
        $spooler = if ($service.Status -eq 'Running') { 'Running' } else { $service.Status }
    } catch { }

    try {
        $printers = Get-Printer -ErrorAction Stop
        if ($printers) { $queue = ($printers | Measure-Object).Count }
    } catch { }

    return [pscustomobject]@{
        SpoolerStatus = $spooler
        PrinterCount = $queue
        Status = if ($spooler -eq 'Running') { 'OK' } else { 'Attention' }
    }
}

Export-ModuleMember -Function Get-PrinterInfo
