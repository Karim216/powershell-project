# IT Diagnostic Toolkit

Bienvenue dans IT Diagnostic Toolkit, un projet PowerShell modulaire destiné à faciliter le diagnostic sur les postes Windows.

Ce projet a pour objectif de centraliser plusieurs vérifications utiles au support IT, de les exécuter de façon répétable et de restituer un résultat structuré, sans remplacer le raisonnement du technicien.

---

## 1. À quoi sert ce projet ?

IT Diagnostic Toolkit permet de :
- réaliser un diagnostic rapide d’un poste Windows ;
- vérifier des éléments système, réseau, performances, stockage et affichage ;
- produire une synthèse utile pour un technicien ;
- exporter un rapport texte localement ;
- préparer la base d’un outil plus complet dans les phases suivantes.

Le projet est pensé pour gagner du temps lors d’une intervention, réduire les oublis et standardiser la manière de diagnostiquer.

---

## 2. Fonctionnement du projet

Le projet est organisé autour d’un point d’entrée principal :
- [IT-Diagnostic/Main.ps1](IT-Diagnostic/Main.ps1)

Ce script charge plusieurs modules situés dans :
- [IT-Diagnostic/Modules](IT-Diagnostic/Modules)

Les données de configuration sont stockées dans :
- [IT-Diagnostic/Config/settings.json](IT-Diagnostic/Config/settings.json)

Les résultats et rapports sont enregistrés dans :
- [IT-Diagnostic/Logs](IT-Diagnostic/Logs)
- [IT-Diagnostic/Reports](IT-Diagnostic/Reports)

---

## 3. Structure du projet

```text
IT-Diagnostic/
├── Main.ps1
├── Modules/
│   ├── SystemInfo.psm1
│   ├── Performance.psm1
│   ├── Storage.psm1
│   ├── Network.psm1
│   ├── Displays.psm1
│   ├── Printers.psm1
│   ├── SlowPC.psm1
│   ├── Security.psm1
│   ├── WindowsUpdate.psm1
│   ├── EventLogs.psm1
│   ├── Software.psm1
│   ├── Services.psm1
│   └── Reports.psm1
├── Config/
│   └── settings.json
├── Logs/
└── Reports/
```

---

## 4. Prérequis

Pour utiliser ce projet, il faut :
- un poste Windows ;
- PowerShell 5.1 ou une version récente ;
- les droits nécessaires pour lire les informations système et réseau du poste.

> Sur certains postes, certaines informations peuvent être limitées selon les droits disponibles ou la politique de sécurité locale.

---

## 5. Lancer le projet

### Sur Windows PowerShell
Ouvrez une fenêtre PowerShell dans le dossier du projet, puis exécutez :

```powershell
Set-Location .\IT-Diagnostic
powershell -ExecutionPolicy Bypass -File .\Main.ps1
```

### Si vous utilisez PowerShell 7
Vous pouvez aussi utiliser :

```powershell
Set-Location .\IT-Diagnostic
pwsh -File .\Main.ps1
```

---

## 6. Utilisation du menu

Une fois le script lancé, vous verrez un menu interactif avec plusieurs options :
- Diagnostic rapide
- Diagnostic complet
- PC lent
- Informations système
- Réseau
- Écrans
- Imprimantes
- Stockage
- Performances
- Sécurité
- Windows Update
- Journaux
- Logiciels
- Services critiques
- Rapport complet
- Quitter

Chaque option exécute un module précis et affiche le résultat dans la console.

---

## 7. Ce que la phase 1 et la phase 2 contiennent actuellement

La première phase MVP implémente un socle de diagnostic en lecture seule avec :
- collecte d’informations système ;
- vérification des performances ;
- analyse du stockage ;
- lecture de l’état réseau ;
- détection des écrans connectés ;
- état des imprimantes et du service Spooler ;
- synthèse “PC lent” ;
- export d’un rapport texte local.

La phase 2 ajoute un niveau de diagnostic plus approfondi avec :
- vérification de la sécurité de base (Défender, pare-feu, BitLocker) ;
- vérification de l’état des mises à jour Windows et du redémarrage requis ;
- analyse des journaux d’erreurs et événements critiques ;
- inventaire logiciel de base ;
- contrôle des services critiques ;
- génération d’un rapport structuré synthétique.

---

## 8. État actuel du projet

Le projet couvre maintenant les trois phases :

1. Phase 1 : socle de diagnostic en lecture seule
2. Phase 2 : diagnostic approfondi et rapport structuré
3. Phase 3 : actions correctives guidées avec validation explicite et journal d’audit

Le point d’entrée du projet reste le script principal dans [IT-Diagnostic/Main.ps1](IT-Diagnostic/Main.ps1), qui oriente vers le diagnostic et la remediation selon le besoin.

---

## 9. Améliorations prévues avant la phase de test entreprise

Avant la mise en production ou une phase de test plus large, plusieurs améliorations ciblées sont prévues afin d’obtenir un retour d’usage plus fiable :

- normaliser les objets de sortie de chaque module pour qu’ils utilisent un format cohérent ;
- intégrer le contexte de l’intervention dans les rapports (technicien, ticket, poste, contexte de diagnostic) ;
- améliorer les journaux pour qu’ils soient plus lisibles et plus exploitables en support ;
- limiter le périmètre fonctionnel pendant la phase de test pour cibler les vrais besoins métier ;
- recenser les scénarios de friction réels (droits insuffisants, services absents, postes atypiques, diagnostics non disponibles) ;
- préparer la base d’une vraie standardisation de tickets et d’exports.

Ces améliorations ne visent pas à faire plus de fonctionnalités, mais à créer une base solide pour une phase de test utile et exploitable par l’entreprise.

## 10. Notes importantes

- Ce projet ne remplace pas l’expertise humaine.
- Il est destiné à aider le technicien à travailler plus proprement et plus rapidement.
- Les rapports produits doivent être traités avec prudence, car ils peuvent contenir des informations sensibles.

---

## 10. Référence complémentaire

Pour une version plus détaillée du contexte métier, du périmètre et de la valeur du projet, consultez :
- [DOCUMENTATION-PROJET.md](DOCUMENTATION-PROJET.md)
# powershell-project
