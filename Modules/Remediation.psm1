function Invoke-Phase3ActionMenu {
    Write-Host "" 
    Write-Host "=====================================" -ForegroundColor Cyan
    Write-Host "   PHASE 3 - Actions guidées" -ForegroundColor Cyan
    Write-Host "=====================================" -ForegroundColor Cyan
    Write-Host "1. Redémarrer un service critique" 
    Write-Host "2. Vider la file d’impression" 
    Write-Host "3. Nettoyer les fichiers temporaires" 
    Write-Host "4. Lancer une analyse Defender" 
    Write-Host "5. Lancer les réparations système" 
    Write-Host "6. Préparer le poste de travail" 
    Write-Host "7. Retour au menu principal" 
    Write-Host "" 

    $choice = Read-Host 'Choisissez une action Phase 3'

    $technician = Read-Host 'Nom du technicien (ou validation)'
    if ([string]::IsNullOrWhiteSpace($technician)) { $technician = 'Technicien' }

    switch ($choice) {
        '1' {
            $confirmed = Read-Host "Confirmez-vous l’action ? (O/N)"
            if ($confirmed -match '^(o|O|y|Y|oui|Oui)$') {
                $result = Restart-CriticalService -ConfirmedBy $technician
                $result | Format-List | Out-Host
            }
            else {
                Write-Host 'Action annulée.' -ForegroundColor Yellow
            }
        }
        '2' {
            $confirmed = Read-Host "Confirmez-vous l’action ? (O/N)"
            if ($confirmed -match '^(o|O|y|Y|oui|Oui)$') {
                $result = Clear-PrintQueue -ConfirmedBy $technician
                $result | Format-List | Out-Host
            }
            else {
                Write-Host 'Action annulée.' -ForegroundColor Yellow
            }
        }
        '3' {
            $confirmed = Read-Host "Confirmez-vous l’action ? (O/N)"
            if ($confirmed -match '^(o|O|y|Y|oui|Oui)$') {
                $result = Clear-TemporaryFiles -ConfirmedBy $technician
                $result | Format-List | Out-Host
            }
            else {
                Write-Host 'Action annulée.' -ForegroundColor Yellow
            }
        }
        '4' {
            $confirmed = Read-Host "Confirmez-vous l’action ? (O/N)"
            if ($confirmed -match '^(o|O|y|Y|oui|Oui)$') {
                $result = Invoke-DefenseScan -ConfirmedBy $technician
                $result | Format-List | Out-Host
            }
            else {
                Write-Host 'Action annulée.' -ForegroundColor Yellow
            }
        }
        '5' {
            $confirmed = Read-Host "Confirmez-vous l’action ? (O/N)"
            if ($confirmed -match '^(o|O|y|Y|oui|Oui)$') {
                $result = Run-SystemRepair -ConfirmedBy $technician
                $result | Format-List | Out-Host
            }
            else {
                Write-Host 'Action annulée.' -ForegroundColor Yellow
            }
        }
        '6' {
            $confirmed = Read-Host "Confirmez-vous la préparation du poste ? (O/N)"
            if ($confirmed -match '^(o|O|y|Y|oui|Oui)$') {
                $result = Start-WorkspacePreparation -ConfirmedBy $technician
                $result | Format-List | Out-Host
            }
            else {
                Write-Host 'Préparation annulée.' -ForegroundColor Yellow
            }
        }
        '7' {
            Write-Host 'Retour au menu principal.' -ForegroundColor Cyan
        }
        default {
            Write-Host 'Choix non valide pour la phase 3.' -ForegroundColor Red
        }
    }
}

Export-ModuleMember -Function Invoke-Phase3ActionMenu
