# 📋 Plan d'Action : Déploiement Flotte Tablettes Fire OS 5

## ⚠️ Constat de départ
* **Problème :** Le *Factory Reset* manuel ne remet pas la tablette dans la configuration d'entreprise (mode kiosque avec 3 applications et paramètres bloqués).
* **Cause :** Le système de verrouillage nécessite l'injection de l'**image système officielle** d'Amazon (Firmware d'entreprise) et non une simple réinitialisation.

---

## 🚀 Étapes de résolution pour demain

### 1. Recherche des ressources internes (Sur le PC Pro)
Ne plus passer de temps sur les tablettes pour le moment. Concentrer l'effort sur le PC pour trouver l'outil de flashage :
* [ ] **Vérifier le Self-Service / Software Center :** Rechercher les applications contenant les mots-clés `Provisioning`, `Flash Tool` ou `Device Enrollment`.
* [ ] **Consulter le Wiki Interne / SIM Tickets :** Chercher la documentation de l'équipe IT locale avec le nom du projet des tablettes pour trouver le lien de téléchargement de l'image `.bin` ou `.zip`.
* [ ] **Interroger l'équipe :** Demander au manager ou à un collègue tech où est stocké le "Master" (Clé USB ou dossier réseau partagé `\\share\IT...`).

### 2. Méthode de déploiement (Une fois l'image/outil trouvé)

#### Option A : Via le logiciel de Provisioning (Recommandé)
* [ ] Lancer l'application dédiée sur le PC Pro.
* [ ] Brancher la tablette en USB (l'outil doit la détecter automatiquement).
* [ ] Cliquer sur **Flash** ou **Enrôler** et laisser le processus se terminer.

#### Option B : Via ADB Sideload (Si méthode manuelle par script)
* [ ] Éteindre la tablette.
* [ ] Démarrer en *Recovery Mode* (Maintenir `Power + Volume Bas` ou `Haut`).
* [ ] Sélectionner **Apply update from ADB**.
* [ ] Brancher la tablette au PC et lancer le script `.bat` fourni par Amazon (ou taper `adb sideload nom_de_l_image.bin`).

---

## 🎯 Résultat attendu en fin de journée
* [ ] Toutes les tablettes doivent afficher uniquement les **3 applications autorisées**.
* [ ] L'accès aux menus sensibles (Profils, Gestion de famille, Comptes) doit être **inactif/bloqué** au clic.
