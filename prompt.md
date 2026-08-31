Je te joins un fichier stations_cable_management.md qui décrit un projet de fiabilisation de 150 stations de travail (câblage, thin clients, imprimantes). Base-toi sur les données de ce document (sections 1, 2, 4 et 7) pour créer un fichier Excel (.xlsx) avec deux onglets.

## Onglet 1 : "Stock & Approvisionnement"

But : suivre le stock d'équipements et de consommables du projet.

Colonnes, dans cet ordre :
- Équipement
- Type (Équipement principal / Consommable)
- Stock initial disponible (saisie manuelle, 0 par défaut)
- Besoin théorique max (valeur fixe, voir tableau ci-dessous)
- Consommé à date (saisie manuelle, 0 par défaut)
- Stock restant (formule = Stock initial − Consommé à date)
- Seuil d'alerte (saisie manuelle, laisser vide)
- À commander ? (formule : si Seuil d'alerte vide → "À définir" ; sinon si Stock restant < Seuil d'alerte → "Oui" ; sinon "Non")
- Date commande / Quantité commandée / Fournisseur / Livraison prévue / Reçu ? (colonnes vides à saisir manuellement ; "Reçu ?" avec liste déroulante Oui/Non)

Lignes à créer (Équipement | Type | Besoin théorique max) :
- TC 630/640 → 655 | Équipement principal | 150
- Imprimante ZT 411/410 | Équipement principal | 36
- Imprimante ZD 421 / GX 420 (combiné) | Équipement principal | 150
- Genovation | Consommable | n/a
- Clavier | Consommable | n/a
- NFC Connect | Consommable | n/a
- Support 2D | Consommable | n/a
- Autocollant | Consommable | n/a
- Protection scanner central | Consommable | n/a
- Secure IT | Consommable | n/a
- Câbles | Consommable | n/a
- Rallonges | Consommable | n/a
- Extension rallonge | Consommable | n/a
- Vis | Consommable | n/a
- Serre-câbles noir | Consommable | n/a
- Serre-câbles réutilisables | Consommable | n/a
- Clips câbles autocollants | Consommable | n/a

Ajoute une ligne d'exemple tout en haut du tableau, clairement marquée "EXEMPLE (ligne à supprimer)", avec des valeurs réalistes dans toutes les colonnes pour montrer le format attendu.

## Onglet 2 : "Planning - Calendrier"

But : calendrier jour par jour du traitement des 150 stations, qui s'adapte automatiquement si le rythme réel diffère du prévu.

Tableau de référence à placer en haut de l'onglet :

| Process | Nb stations | Temps/station (min) |
|---|---|---|
| Medium | 54 | 130 |
| PCNS | 16 | 90 |
| KO | 4 | 110 |
| P2R | 60 | 30 |
| Les restes | 16 | 110 |

Ajoute une colonne "Cumul fin" calculée par formule (cumul progressif : 54, 70, 74, 134, 150).
Ordre de traitement : Medium → PCNS → KO → P2R → les restes.

Paramètres modifiables en haut de l'onglet :
- Cadence retenue : liste déroulante "1" / "2" / "Plein temps (7h)", "1" par défaut
- Date de démarrage : 31/08/2026

Règles de calcul du calendrier (jours ouvrés lundi-vendredi uniquement, environ 220 lignes à partir du 31/08/2026) :
- Chaque jour a un "Type de jour" : "Normal" par défaut, sauf le 02/09/2026 et le 09/09/2026 marqués "Dédié" (liste déroulante Normal/Dédié, éditable pour en ajouter d'autres plus tard)
- Jour "Normal" (et cadence ≠ "Plein temps (7h)") : stations prévues ce jour = la cadence retenue (1 ou 2)
- Jour "Dédié", ou cadence = "Plein temps (7h)" quel que soit le type de jour : stations prévues ce jour = PARTIE ENTIÈRE(420 minutes ÷ temps/station du process en cours)
- Le "process en cours" à un jour donné dépend du cumul de stations déjà traitées avant ce jour, comparé aux seuils cumulés du tableau de référence
- Plafonner les stations prévues à ce qu'il reste réellement à faire (150 − cumul avant ce jour)
- Colonne "Stations réalisées" : vide, saisie manuelle quotidienne
- Le "cumul avant ce jour" doit utiliser la valeur réelle du jour précédent si elle a été saisie, sinon la valeur prévue, pour que le planning se réajuste automatiquement une fois les vraies données saisies
- Ajoute "Écart du jour" (réalisé − prévu), "Écart cumulé", et "Cumul projeté après ce jour"
- Mets en surbrillance verte (mise en forme conditionnelle) la première ligne où "Cumul projeté après ce jour" atteint 150, pour repérer visuellement la date de fin de projet

Limite acceptée : il est normal que le calcul ne bascule pas sur le process suivant avec les minutes restantes d'une journée à budget-temps (simplification volontaire) — indique cette limite dans une note du fichier plutôt que de la laisser implicite.

## Exigences générales

- Police Arial, en-têtes en gras sur fond coloré, largeurs de colonnes lisibles
- Toutes les cellules à remplir manuellement en texte bleu sur fond jaune
- Vraies formules Excel (rien de codé en dur), pour que tout se recalcule si la cadence change
- Vérifie qu'il n'y a aucune erreur de formule (#REF!, #VALUE!, #DIV/0!...) avant de me livrer le fichier
- Ajoute une légende en haut de chaque onglet expliquant le code couleur


Imprimer les etiquettes avec l'imprimande zebra ZD.


peux tu me faire : le support de présentation en réunion, très peu de texte, un chiffre/message clé par slide. tu le construis merci.