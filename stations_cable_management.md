# Stations Cable Management - Dossier de présentation

*Détails, point par point, aux étapes de gestion de projet retenues avec les chiffres à l'appui.*

## En bref

| | |
|---|---|
| Nombre de stations | **150** |
| Charge de travail totale | **12 460 min = 207 h 40** |
| Fenêtre de réalisation | **de ≈ 1,4 mois à ≈ 6,7 mois** selon la cadence retenue (voir §4) |
| Ordre de traitement retenu | Medium → PCNS → KO → P2R → Jackpot → Vred → Slam → Solving |
| Équipe | 2 personnes |
| Décisions encore en attente | Cadence, quantités de stock actuelles (voir synthèse en fin de document) |

## Contexte du projet

Le projet s'articule autour de trois axes :

- **Fiabilisation** des câbles et des équipements → réduire les risques liés aux mouvements des OPS (logique « Secure IT »).
- **Life Cycle Thin Clients** → gestion du cycle de vie des postes clients légers.
- **Génération** → suivi des générations / modèles de thin clients dans le temps.

La méthode retenue pour piloter ce projet tient en 5 étapes : **Audit → Check stock → Planifier → Benchmark → Réalisation** (avec un retour possible vers l'Audit si l'estimation révèle un écart). Ce document reprend cette trame et y répond point par point avec les données consolidées.

---

## 1. Audit - État des lieux

### a) Volumétrie et temps par process

| Process | Sous-catégorie | Nb stations | Temps total (min) | Temps / station (min) |
|---|---|---:|---:|---:|
| **Pack single** | *(70 stations, 8 460 min)* | **70** | **8 460** | 120,9 *(moyenne pondérée)* |
| ↳ Medium | Medium Mix (27) + Medium (27) | **54** | **7 020** | **130** |
| ↳ PCNS | PCNS 1 (9) + PCNS 2 (7) | **16** | **1 440** | **90** |
| **KO, Jackpot** | KO (4) + Jackpot (2) | **6** | **660** | **110** |
| **Vred, Slam, Solving** | Vred (6) + Slam (4) + Solving (4) | **14** | **1 540** | **110** |
| **Pack P2R** | — | **60** | **1 800** | **30** |
| **TOTAL** | | **150** | **12 460** | ≈ 83,1 *(moyenne globale)* |

*Les totaux ont été recoupés et vérifiés (150 stations, 12 460 min) — aucun écart.* Le temps de 110 min/station pour KO, Vred, Jackpot, Slam et Solving est uniforme, ces 5 sous-types partageant le même profil, faute de temps différencié par sous-type dans les données sources.

### b) Équipement principal requis par process

| Process | TC (→655) | ZT (411/410) | ZD / GX |
|---|:---:|:---:|:---:|
| Medium | ✔ | — | ✔ |
| PCNS | ✔ | ✔ | ✔ |
| Pack P2R | ✔ | — | ✔ |
| KO, Jackpot | ✔ | ✔ | ✔ |
| Vred, Slam, Solving | ✔ | — | ✔ |


Le reste du matériel (Genovation, clavier, NFC Connect, support 2D, autocollants, protections, câblage, serre-câbles, etc.) est présent sur la quasi-totalité des postes et n'est remplacé qu'en cas d'usure constatée, il n'est donc pas rattaché à un process en particulier.

---

## 2. Check stock - Ressources disponibles

### a) Consommables et petit matériel *(remplacés seulement si usure)*

Genovation, clavier, NFC Connect, support 2D, autocollant, protection scanner central, Secure IT, câbles, rallonges, extension rallonge, vis, serre-câbles noir, serre-câbles réutilisables, clips câbles autocollants.

### b) Équipements principaux à disposer

- TC 630/640 → migration vers **TC 655**
- Imprimante **ZT 411/410** *(modèles anciens, à envisager en remplacement)*
- Imprimante **ZD 421 / GX 420** *(mêmes types, interchangeables : l'un ou l'autre convient)*

### c) Besoin maximum théorique (scénario le plus défavorable)

Si l'on suppose que *toutes* les stations concernées par un équipement devaient effectivement le remplacer (hypothèse haute, avant vérification terrain de l'état réel) :

| Équipement | Process concernés | Besoin maximum théorique |
|---|---|---:|
| TC | Medium + PCNS + P2R + (KO, Jackpot) + (Vred, Slam, Solving) | **150 stations** |
| ZT | PCNS + (KO, Jackpot) | **22 stations** (16 + 6) |
| ZD / GX | Medium + PCNS + P2R + (KO, Jackpot) + (Vred, Slam, Solving) | **150 stations** |

Ce plafond sert de base de sécurité pour dimensionner la commande ; le besoin réel sera probablement inférieur puisque le remplacement de TC/ZT/ZD/GX se fait « si besoin » (état d'usure), et non systématiquement.

### d) Détail du besoin par process *(chiffres fictifs - à remplacer par les données réelles de l'audit terrain, station par station)*

**TC - répartition par modèle actuel**

| Process | Nb stations | TC 630 *(à remplacer)* | TC 640 *(à remplacer)* | TC 655 *(déjà conforme)* | Manquant *(à équiper)* | Total TC à commander |
|---|---:|---:|---:|---:|---:|---:|
| Medium | 54 | 20 | 25 | 6 | 3 | **48** |
| PCNS | 16 | 5 | 8 | 2 | 1 | **14** |
| KO, Jackpot | 6 | 2 | 3 | 1 | 0 | **5** |
| Vred, Slam, Solving | 14 | 5 | 6 | 2 | 1 | **12** |
| P2R | 60 | 22 | 28 | 8 | 2 | **52** |
| **TOTAL** | **150** | **54** | **70** | **19** | **7** | **131** |

**Imprimantes ZT (411/410) - uniquement PCNS, (KO, Jackpot)** *(les deux modèles sont considérés valides ; seuls les manquants ou defectueux sont à commander)*

| Process | Nb stations concernées | ZT 411 présent | ZT 410 présent *(à envisager remplacement)* | Manquant *(à équiper)* | Total ZT à commander |
|---|---:|---:|---:|---:|---:|
| PCNS | 16 | 9 | 5 | 2 | **7** |
| KO, Jackpot | 6 | 3 | 2 | 1 | **3** |
| **TOTAL** | **22** | **12** | **7** | **3** | **10** |

**Imprimantes ZD 421 / GX 420 - tous process** *(les deux modèles sont considérés valides ; seuls les manquants ou defectueux sont à commander)*

| Process | Nb stations | ZD 421 présent | GX 420 présent | Manquant *(à équiper)* | Total ZD/GX à commander |
|---|---:|---:|---:|---:|---:|
| Medium | 54 | 30 | 20 | 4 | **4** |
| PCNS | 16 | 7 | 7 | 2 | **2** |
| KO, Jackpot | 6 | 3 | 2 | 1 | **1** |
| Vred, Slam, Solving | 14 | 7 | 6 | 1 | **1** |
| P2R | 60 | 33 | 24 | 3 | **3** |
| **TOTAL** | **150** | **80** | **59** | **11** | **11** |

**Synthèse - quantités à commander par process**

| Process | TC à commander | ZT à commander | ZD/GX à commander |
|---|---:|---:|---:|
| Medium | 48 | — | 4 |
| PCNS | 14 | 7 | 2 |
| KO, Jackpot | 5 | 3 | 1 |
| Vred, Slam, Solving | 12 | — | 1 |
| P2R | 52 | — | 3 |
| **TOTAL** | **131** | **10** | **11** |

*Ce niveau de détail (par process et par modèle) a vocation à être piloté depuis le fichier Excel (onglet Stock & Approvisionnement) une fois l'audit terrain fait - pour rester à jour sans avoir à réécrire ce document à chaque comptage.*

### e) Point à trancher

- **Quantités actuellement disponibles en stock non encore connues**, et les répartitions par modèle ci-dessus sont fictives : il faut confronter les vraies données terrain au plafond du §2c et au détail du §2d pour savoir ce qu'il faut réellement commander avant de lancer la réalisation.

---

## 3. Planifier - Blocages, impact OPS, ressources

### a) Ordre de traitement retenu

**Medium → PCNS → KO → P2R → Jackpot → Vred → Slam → Solving**. Les "singles" (Medium + PCNS, 70 stations) sont traités en priorité.

### b) Blocages identifiés

- Stock potentiellement insuffisant tant que les quantités actuelles ne sont pas vérifiées (cf. §2e).
- La cadence de traitement (1, 2 ou 7h/jour) n'est pas encore arbitrée, elle conditionne directement les délais (§4).

### c) Impact sur les OPS selon la cadence - analyse

Il y a un vrai arbitrage entre *intensité* de l'impact et *durée* du risque :

- **1 station/jour** : impact quasi invisible au quotidien sur les OPS (quelques minutes prélevées chaque jour), mais la fenêtre pendant laquelle les stations restent non fiabilisées s'étale sur **≈ 6,7 mois**.
- **2 stations/jour** : impact modéré mais régulier, fenêtre ramenée à **≈ 3,3 mois**.
- **7h/jour dédiées** : impact fort les jours travaillés (plus aucune disponibilité pour les autres tâches ces jours-là), mais la fenêtre de risque se referme en seulement **≈ 1,4 mois**.

Plus on va vite, plus l'effort est concentré et plus le risque est vite couvert.Mais au prix d'une indisponibilité totale de la ressource sur la période. Ce choix reste à trancher selon la priorité donnée à la réduction rapide du risque vs. la continuité des OPS.

### d) Ressources humaines

Nous sommes **deux sur le projet, et cet effectif est fixe**. Les temps par station du §1a (130 min pour Medium, 90 pour PCNS, 110 pour KO/Jackpot et Vred/Slam/Solving, 30 pour P2R) sont déjà le temps que nous mettons à deux pour finaliser une station, ce ne sont pas des temps par personne. Tous les calculs de charge et de calendrier du §4 sont donc directement utilisables tels quels, sans ajustement lié à l'effectif.

---

## 4. Benchmark - Charge de travail et délais

### a) Charge totale

- **12 460 min = 207 h 40** de travail effectif à deux (ce temps représente déjà notre travail en binôme par station, cf. §3d)
- ≈ **29,7 jours** si on y consacrait 7h/jour en continu, ou ≈ **26,0 jours** sur une base de 8h/jour à titre de repère, cette hypothèse « temps plein en continu » correspond au Cas 3 du §4b

### b) Comparatif des 3 cadences envisagées

*Hypothèses communes : démarrage lundi 31 août 2026, semaine lundi-vendredi, ordre Medium → PCNS → KO → P2R → Jackpot → Vred → Slam → Solving. Les 2 et 9 septembre 2026 sont deux journées « arrêt » où 7h sont entièrement dédiées au projet (cas 1 et 2 uniquement en cas 3, tous les jours sont déjà en 7h dédiées).*

| Cadence | Singles finis (Medium+PCNS) | Projet complet fini | Durée totale (≈) |
|---|---|---|---:|
| 1 station/jour | 30 novembre 2026 | 22 mars 2027 | 6,7 mois |
| 2 stations/jour | 15 octobre 2026 | 10 décembre 2026 | 3,3 mois |
| 7h/jour (temps plein) | 29 septembre 2026 | 14 octobre 2026 | 1,4 mois |

**Détail par process, pour chaque cadence :**

**Cas 1 - 1 station/jour**

| Process | Stations | Terminé le |
|---|---:|---|
| Medium | 54 | vendredi 6 novembre 2026 |
| PCNS | 16 | lundi 30 novembre 2026 |
| KO | 4 | vendredi 4 décembre 2026 |
| P2R | 60 | vendredi 26 février 2027 |
| Jackpot, Vred, Slam, Solving | 16 | lundi 22 mars 2027 |

**Cas 2 - 2 stations/jour**

| Process | Stations | Terminé le |
|---|---:|---|
| Medium | 54 | lundi 5 octobre 2026 |
| PCNS | 16 | jeudi 15 octobre 2026 |
| KO | 4 | lundi 19 octobre 2026 |
| P2R | 60 | lundi 30 novembre 2026 |
| Jackpot, Vred, Slam, Solving | 16 | jeudi 10 décembre 2026 |

**Cas 3 - 7h/jour dédiées tous les jours**

Capacité max/jour : Medium 3, PCNS 4, KO 3, P2R 14, Les restes 3 (calculée sur 420 min/jour).

| Process | Stations | Terminé le |
|---|---:|---|
| Medium | 54 | mercredi 23 septembre 2026 |
| PCNS | 16 | mardi 29 septembre 2026 |
| KO | 4 | jeudi 1 octobre 2026 |
| P2R | 60 | mercredi 7 octobre 2026 |
| Jackpot, Vred, Slam, Solving | 16 | mercredi 14 octobre 2026 |

### c) À trancher

Le choix final de cadence reste à trancher, en fonction de l'arbitrage impact-OPS / durée du risque décrit au §3c.

---

## 5. Réalisation - Exécution, tests, suivi

### a) Préparation des outils/équipements

Vérification et mise à disposition du stock (§2), en priorité l'équipement du premier process traité (Medium : TC + ZD/GX).

### b) Exécution des tâches

Traitement station par station, dans l'ordre retenu (Medium → PCNS → KO → P2R → Jackpot → Vred → Slam → Solving), à la cadence retenue (§4).

### c) Recette / tests *(proposition, à valider en équipe)*

Avant de considérer une station comme terminée :
- Vérifier le démarrage et la connexion du TC (réseau/NFC selon le poste).
- Vérifier l'impression sur l'imprimante concernée (ZT/ZD/GX).
- Vérifier le scanner et sa protection.
- Vérifier que le câblage est fixé et rangé (câbles, serre-câbles, rallonges) — objectif "Secure IT" du projet.

### d) Suivi : liste + statistiques

L'objectif est d'avoir des statistiques de suivi claires. Ce sera l'objet du fichier Excel à construire ensuite (plan détaillé en §7), avec a minima :
- Statut par station (à faire / en cours / fait), process, date de traitement, technicien.
- Équipement remplacé le cas échéant (TC / ZT / ZD-GX).
- Indicateurs cumulés : nombre de stations traitées par jour et par process, % d'avancement global, projection de la date de fin en fonction du rythme réel constaté.

---

## 6. Bilan

Une fois le projet terminé, un retour d'expérience court (ce qui a bien/mal fonctionné, écarts entre estimation et réalité) permettra d'affiner les temps par process pour les prochains projets similaires.

---

## 7. Plan du fichier Excel de suivi

Un seul classeur, plusieurs onglets. Principe : chaque onglet "process" est la **seule source de saisie** (une ligne = une station) ; le Dashboard, le Stock et le Planning se remplissent **automatiquement par formule** à partir de ces 4 onglets, pour éviter les doubles saisies et les incohérences.

### a) Onglets par process - Medium / PCNS / Autres / P2R

*(l'onglet "Autres" regroupe KO, Vred, Jackpot, Slam et Solving — nom court conservé car Excel limite un nom d'onglet à 31 caractères, la liste complète ne rentre pas.)*

Même structure de colonnes sur les 4 onglets, pour rester intuitif d'un onglet à l'autre :

| Colonne | Contenu |
|---|---|
| N° station | Identifiant unique de la station |
| Sous-type | Ex. Medium Mix / Medium — PCNS 1 / PCNS 2 — KO+Jackpot / Vred+Slam+Solving (onglet Autres) |
| Statut | À faire / En cours / Fait *(liste déroulante, avec code couleur rouge/orange/vert)* |
| Date de traitement | |
| Technicien | |
| TC remplacé ? | Oui / Non |
| ZT remplacé ? | Oui / Non *(laissé vide si le process n'utilise pas de ZT — cf. §1b)* |
| ZD/GX remplacé ? | Oui / Non |
| Temps théorique (min) | Pré-rempli selon le sous-type (130 / 90 / 110 / 30 — cf. §1a) |
| Temps réel (min) | Saisi par le technicien |
| Écart (min) | = Temps réel − Temps théorique *(calcul automatique)* |
| Recette / test | OK / KO / À refaire *(cf. checklist proposée en §5c)* |
| Remarques | Texte libre |

*Sur l'onglet Autres uniquement, une colonne supplémentaire "Priorité" (Avant P2R / Après P2R) reflète l'ordre retenu : KO est traité avant le P2R, les 4 autres sous-types après (cf. §3a).*

### b) Onglet Dashboard - vue d'ensemble (stats)

- **Indicateurs globaux** en tête : total stations (150), faites, restantes, % d'avancement global.
- **Tableau récap par process** : stations faites / total, % d'avancement, temps théorique cumulé vs temps réel cumulé (pour visualiser l'écart d'estimation en direct).
- **Graphique d'avancement** : réel constaté vs prévisionnel selon la cadence retenue (§4b).
- **Date de fin projetée**, recalculée automatiquement à partir du rythme réel (liée à l'onglet Planning).
- **Indicateur simple** : en avance / à l'heure / en retard, par comparaison réel vs prévu.

### c) Onglet Stock & Approvisionnement

| Colonne | Contenu |
|---|---|
| Équipement | TC, ZT, ZD/GX (combiné), + consommables (§2a) |
| Stock initial disponible | À saisir une fois l'inventaire réel fait *(point ouvert du §2e ; détail par process en §2d)* |
| Besoin théorique max | Repris du §2c (TC 150, ZT 22, ZD/GX 150) |
| Consommé à date | *Calcul automatique* : compte des "remplacé = Oui" dans les 4 onglets process |
| Stock restant | = Stock initial − Consommé à date |
| Seuil d'alerte | Quantité minimum avant réappro |
| À commander ? | Oui / Non *(automatique si stock restant < seuil)* |
| Commandes en cours | Date, quantité, fournisseur, date de livraison prévue, reçu (Oui/Non) |

### d) Onglet Planning / Calendrier

| Colonne | Contenu |
|---|---|
| Date de démarrage | Paramètre modifiable en tête d'onglet |
| Date de fin (projetée) | *Calcul automatique*, juste en dessous de la date de démarrage — recalculée dès que la liste des process ou la cadence change |
| Cadence retenue | Paramètre modifiable en tête d'onglet (1 / 2 / 7h par jour - §4b) |
| Date | Jour par jour |
| Type de jour | Normal / Journée dédiée (ex. 2 et 9 septembre) |
| Process prévu | Selon l'ordre retenu (Medium → PCNS → KO → P2R → Jackpot → Vred → Slam → Solving) |
| Stations prévues ce jour | *Calcul automatique* selon la cadence choisie |
| Stations réellement faites | *Calcul automatique*, récupéré depuis les dates de traitement des onglets process |
| Écart du jour / écart cumulé | Prévu réalisé |

*Le tableau de référence des process (nombre de stations, temps/station) est conçu pour rester à capacité fixe avec des lignes vides prêtes à l'emploi : ajouter un process = remplir la prochaine ligne vide, en retirer un = vider ses cellules (sans supprimer la ligne, même au milieu de la liste). Le "Total stations", le process en cours chaque jour et la "Date de fin" se recalculent alors automatiquement, sans qu'aucune formule n'ait besoin d'être retouchée.*

### e) Pour que ce soit intuitif

- **Listes déroulantes** partout où c'est possible (Statut, Oui/Non, Sous-type) pour éviter les fautes de saisie.
- **Code couleur** cohérent sur tous les onglets : rouge = à faire/retard, orange = en cours, vert = fait/à l'heure.
- **Une seule vraie source de données** (les 4 onglets process) ; tout le reste (Dashboard, Stock, Planning) se calcule dessus, jamais resaisi à la main.

---

## Synthèse - Points restant à trancher

1. **Cadence retenue** : 1, 2 ou 7h/jour (voir §3c et §4b pour l'arbitrage impact OPS / délai).
2. **Quantités actuellement en stock**, à comparer au plafond du §2c avant de lancer la réalisation.

## Prochaine étape

Construction du fichier Excel de suivi, sur la base du plan détaillé au §7 (onglets Medium, PCNS, Autres, P2R, Dashboard, Stock & Approvisionnement, Planning/Calendrier).