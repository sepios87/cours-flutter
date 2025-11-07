# 🧱 TP5 – Projet final en binôme

## 🎯 Objectifs
- Concevoir et développer une **application Flutter complète en binôme**
- Appliquer l'ensemble des notions vues dans les TPs précédents
- Faire des choix techniques et architecturaux
- Travailler en équipe avec Git
- Produire une application fonctionnelle et/ou esthétique selon vos objectifs

🕐 **Durée estimée : 6 à 8 heures** (sur 2 séances minimum)

---

## 👥 Organisation

- **Travail en binôme obligatoire**
- **Dépôt GitHub** : Le projet doit être hébergé sur GitHub avec historique des commits des deux membres
- **Choix libre du sujet** : Vous êtes libres de choisir le thème de votre application (réseau social, e-commerce, productivité, jeu, etc.)
- **Choix d'orientation** : Vous devez choisir une des trois orientations ci-dessous

---

## 🎯 Trois orientations possibles

Vous devez choisir **UNE** des trois orientations suivantes pour votre projet :

### 📊 Option 1 : Riche en fonctionnel
**Focus : Aspect métier et technique fort**

Votre application doit respecter **TOUTES** les contraintes suivantes :
- ✅ Un aspect **métier fort** avec logique complexe (calculs, algorithmes, workflows)
- ✅ Utilisation de **stockage persistant** (local avec SharedPreferences/Hive/SQLite ou Firebase/Supabase)
- ✅ Intégration d'**au moins un package** de pub.dev (hors stockage) pertinent pour votre métier
- ✅ Consommation d'**une API** (publique ou créée par vous)

**Exemples de projets** :
- Application de suivi budgétaire avec catégories, graphiques et export
- Gestionnaire de tâches avec notifications, priorités et récurrence
- Application de fitness avec suivi des entraînements et statistiques
- Agrégateur de news avec sauvegarde d'articles et recherche

**Packages suggérés** : `charts_flutter`, `flutter_local_notifications`, `sqflite`, `provider`/`riverpod`, `intl`

---

### 🎨 Option 2 : Riche en design
**Focus : Interface utilisateur et expérience visuelle**

Votre application doit respecter **TOUTES** les contraintes suivantes :
- ✅ Design basé sur un **template mobile Dribbble** (avec lien dans le README)
- ✅ Utilisation d'**images** (assets locaux ou réseau) de manière cohérente
- ✅ Mise en place de **i18n** (internationalisation) avec au moins 2 langues
- ✅ Intégration d'**au moins une animation** (Hero, AnimatedContainer, Lottie, etc.)

**Exemples de projets** :
- Application de galerie photo avec transitions animées
- Portfolio interactif avec animations et multilingue
- Application de recettes avec design soigné et animations
- Onboarding moderne avec animations et changement de langue

**Packages suggérés** : `flutter_localizations`, `lottie`, `animations`, `google_fonts`, `cached_network_image`

---

### ⚖️ Option 3 : Équilibrée
**Focus : Mix entre fonctionnel et design**

Votre application doit respecter :
- ✅ **Au moins 2 contraintes** de l'option "Riche en fonctionnel"
- ✅ **Au moins 2 contraintes** de l'option "Riche en design"

**Exemples de projets** :
- Application météo avec API, stockage des villes favorites, design soigné et animations
- App de streaming musical avec API, design Dribbble, animations et i18n
- Réseau social minimaliste avec Firebase, design moderne, animations et images

---

## 📋 Livrables obligatoires

### 1. **Dépôt GitHub**
- Repository public ou privé (avec accès enseignant)
- README complet (voir section ci-dessous)
- `.gitignore` Flutter configuré
- Historique Git propre avec commits des deux membres

### 2. **README.md détaillé**
Votre README doit contenir :
```markdown
# Nom du Projet

## 👥 Équipe
- Prénom Nom (email)
- Prénom Nom (email)

## 📱 Description
[Description du projet en 3-5 phrases]

## 🎯 Orientation choisie
[Riche en fonctionnel / Riche en design / Équilibrée]

## ✅ Contraintes respectées
- [ ] Contrainte 1
- [ ] Contrainte 2
- [ ] Contrainte 3
- [ ] Contrainte 4

## 📦 Packages utilisés
- package_name: ^version (raison d'utilisation)
- package_name: ^version (raison d'utilisation)

## 🚀 Installation
[Instructions pour lancer le projet]

## 📸 Screenshots
[3-5 captures d'écran de l'application]

## 🏗️ Architecture
[Brève description de l'organisation du code]

## 🎨 Design (si applicable)
[Lien vers le template Dribbble utilisé]

## 🔑 API/Credentials (si applicable)
[Instructions pour obtenir les clés API nécessaires]

## 🧪 Tests
[Commande pour lancer les tests s'il y en a]

## 📝 Difficultés rencontrées
[2-3 défis techniques que vous avez surmontés]
```

### 3. **Vidéo de démonstration (2-3 minutes)**
- Présentation rapide de l'application
- Démonstration des fonctionnalités principales
- Format : MP4, lien YouTube ou Loom
- Uploadée sur le dépôt ou lien dans le README

### 4. **Code source**
- Structure claire : `lib/models/`, `lib/services/`, `lib/pages/`, `lib/widgets/`
- Code commenté aux endroits stratégiques
- Respect des conventions Dart/Flutter
- Pas de code mort ou commenté en masse

### 5. **Revue de code entre membres du binôme**
Les deux membres doivent se faire des **code reviews mutuelles** via GitHub :

**Comment procéder** :
1. Chaque membre travaille sur sa branche (`feature/login`, `feature/home`, etc.)
2. Avant de merger dans `main`, créer une **Pull Request**
3. L'autre membre review la PR en laissant des commentaires
4. Discuter des changements et les appliquer si nécessaire
5. Merger seulement après validation

**Ce qui sera évalué** :
- Présence de **Pull Requests** avec reviews dans l'historique GitHub
- Commentaires constructifs sur le code de l'autre
- Modifications apportées suite aux reviews
- Au moins **3 PR reviewées par membre** minimum

---

## 🧮 Barème de notation (/20)

| Critère | Détails | Points |
|----------|----------|--------|
| **Respect des contraintes** | Toutes les contraintes de l'orientation choisie sont respectées | 5 |
| **Fonctionnalités** | L'application fonctionne sans crash, features complètes | 3 |
| **Architecture et code** | Structure claire, code propre, bonnes pratiques | 2 |
| **Design et UX** | Interface soignée, navigation fluide, cohérence visuelle | 2 |
| **Travail d'équipe et revues** | Commits équilibrés, Pull Requests reviewées (min 3 par membre) | 3 |
| **Documentation** | README complet, code commenté, instructions claires | 2 |
| **Originalité et ambition** | Innovation, complexité du projet, features supplémentaires | 2 |
| **Vidéo de démo** | Présentation claire, exhaustive et professionnelle | 1 |
| **Total** |  | **/20** |

---

## 📅 Planning recommandé

### Séance 1 (2-3h)
- [ ] Former les binômes
- [ ] Choisir l'orientation et le sujet
- [ ] Créer le dépôt GitHub et inviter le binôme
- [ ] Définir les fonctionnalités principales
- [ ] Créer la structure du projet
- [ ] Répartir les tâches (qui fait quoi)
- [ ] Commencer l'implémentation

### Séance 2 (2-3h)
- [ ] Continuer l'implémentation des features
- [ ] Intégrer le travail des deux membres
- [ ] Résoudre les conflits Git éventuels
- [ ] Tester l'application

### Séance 3 (2h)
- [ ] Finaliser les fonctionnalités
- [ ] Peaufiner le design
- [ ] Rédiger le README
- [ ] Enregistrer la vidéo de démo
- [ ] Vérifier que toutes les contraintes sont respectées

---

## 💡 Conseils

### Git et collaboration
- Créez des **branches** pour chaque feature (`feature/login`, `feature/home-page`)
- Faites des **commits réguliers** avec des messages clairs
- Utilisez les **Pull Requests** pour review le code de l'autre
- Résolvez les conflits ensemble, ne forcez jamais un push

### Organisation du code
- Définissez l'architecture ensemble dès le début
- Créez des **fichiers de constantes** pour les couleurs, styles, API keys
- Utilisez des **widgets réutilisables** plutôt que de dupliquer du code
- Commentez les parties complexes

### Gestion du temps
- Ne soyez pas trop ambitieux : mieux vaut une app simple qui fonctionne bien qu'une app complexe buguée
- Priorisez les fonctionnalités : faites d'abord le MVP (Minimum Viable Product)
- Gardez du temps pour la documentation et la vidéo

### Choix techniques
- **Riche en fonctionnel** : Concentrez-vous sur la logique, le design peut être basique
- **Riche en design** : Choisissez un template réalisable, ne visez pas trop complexe
- **Équilibrée** : Trouvez le bon compromis, ne vous dispersez pas

### Ressources utiles
- **Templates Dribbble** : https://dribbble.com/search/mobile-app
- **APIs gratuites** : https://github.com/public-apis/public-apis
- **Icônes** : https://icons8.com/, https://www.flaticon.com/
- **Images** : https://unsplash.com/, https://www.pexels.com/
- **Animations Lottie** : https://lottiefiles.com/

---

## ⚠️ Pièges à éviter

- ❌ **Commits déséquilibrés** : Un membre fait tout le travail
- ❌ **Pas de commits** : Tout le code est pushé d'un coup à la fin
- ❌ **Clés API commitées** : Utilisez `.gitignore` et des fichiers d'exemple
- ❌ **App qui ne build pas** : Testez régulièrement sur différents devices
- ❌ **README incomplet** : C'est la première chose qu'on regarde
- ❌ **Copier-coller sans comprendre** : Vous devez être capables d'expliquer votre code
- ❌ **Contraintes non respectées** : Vérifiez votre checklist avant le rendu

---

## 🎓 Critères d'excellence

Pour viser les meilleures notes :
- ✨ Code propre et bien architecturé (SOLID, DRY)
- ✨ Gestion d'erreurs robuste (try-catch, états d'erreur UI)
- ✨ UX fluide avec loaders et feedbacks visuels
- ✨ Responsive design (fonctionne sur tablette et téléphone)
- ✨ Pas de warnings dans la console
- ✨ README avec screenshots et GIFs
- ✨ Commits atomiques avec messages descriptifs
- ✨ Code review entre membres du binôme visible sur GitHub

---

## 📤 Modalités de rendu

**Date limite** : [À définir par l'enseignant]

**Format du rendu** :
1. Lien vers le **repository GitHub** (déposé sur Moodle ou par email)
2. Lien vers la **vidéo de démonstration** (dans le README ou séparé)
3. **Aucune archive ZIP** : tout doit être sur GitHub

**Vérification avant rendu** :
- [ ] Le dépôt est accessible (public ou accès donné)
- [ ] Le README est complet
- [ ] L'application builde et run sans erreur
- [ ] Les deux membres ont au moins 40% des commits chacun
- [ ] Au moins 3 Pull Requests reviewées par membre sont visibles
- [ ] Toutes les contraintes de l'orientation choisie sont respectées
- [ ] La vidéo est accessible et complète
- [ ] Pas de fichiers sensibles commitées (clés API, .env)

---

## 🎉 Bon courage !

Ce TP final est l'occasion de montrer tout ce que vous avez appris et de créer quelque chose dont vous serez fiers.

N'oubliez pas : **une application simple et bien faite vaut mieux qu'une application complexe à moitié terminée**.

Soyez créatifs, collaborez efficacement, et amusez-vous ! 🚀
