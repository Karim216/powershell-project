function Get-SystemInfo {
    $computer = $null
    $os = $null
    $bios = $null

    try { $computer = Get-CimInstance -ClassName Win32_ComputerSystem -ErrorAction Stop } catch { $computer = $null }
    try { $os = Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction Stop } catch { $os = $null }
    try { $bios = Get-CimInstance -ClassName Win32_BIOS -ErrorAction Stop } catch { $bios = $null }

    $hostName = if ($computer) { $computer.Name } else { $env:COMPUTERNAME }
    $userName = if ($computer) { $computer.UserName } else { $env:USERNAME }
    $domain = if ($computer) { $computer.Domain } else { $env:USERDOMAIN }
    $windowsVersion = if ($os) { $os.Caption } else { 'Non disponible' }
    $biosVersion = if ($bios) { $bios.SMBIOSBIOSVersion } else { 'Non disponible' }

    return [pscustomobject]@{
        HostName = $hostName
        UserName = $userName
        Domain = $domain
        WindowsVersion = $windowsVersion
        BiosVersion = $biosVersion
        Status = 'OK'
    }
}

Export-ModuleMember -Function Get-SystemInfo
