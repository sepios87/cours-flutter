# 🧱 TP0 – Configuration de l'environnement et premiers pas

## 🎯 Objectifs
- Installer et configurer **Flutter** et **VS Code**
- Créer et lancer son premier projet Flutter "Hello World"
- Comprendre la **structure d'un projet Flutter**
- Découvrir les bases de **Git et GitHub**
- Se familiariser avec le **hot reload** et le debugging

🕐 **Durée estimée : 1 à 2 heures**

---

## 🪜 Étape 1 — Installer Flutter

### Windows

1. Télécharge le SDK Flutter : https://docs.flutter.dev/get-started/install/windows
2. Extrais l'archive dans un dossier (ex : `C:\flutter`)
3. Ajoute Flutter au PATH :
   - Recherche "variables d'environnement" dans Windows
   - Clique sur "Variables d'environnement"
   - Dans "Variables système", trouve "Path" et clique sur "Modifier"
   - Ajoute le chemin vers `C:\flutter\bin`
4. Ouvre un nouveau terminal et vérifie :
   ```bash
   flutter --version
   ```

### macOS

1. Télécharge le SDK Flutter : https://docs.flutter.dev/get-started/install/macos
2. Extrais l'archive dans un dossier (ex : `~/flutter`)
3. Ajoute Flutter au PATH en éditant `~/.zshrc` :
   ```bash
   export PATH="$PATH:$HOME/flutter/bin"
   ```
4. Recharge le terminal :
   ```bash
   source ~/.zshrc
   ```
5. Vérifie l'installation :
   ```bash
   flutter --version
   ```

### Vérification de l'environnement

Lance Flutter Doctor pour vérifier que tout est bien installé :
```bash
flutter doctor
```

Tu devrais voir une liste avec des coches vertes. Ne t'inquiète pas si certaines options sont manquantes (Android Studio, Xcode), nous allons les configurer.

---

## 🪜 Étape 2 — Installer VS Code et les extensions Flutter

1. **Télécharge VS Code** : https://code.visualstudio.com/
2. **Installe l'extension Flutter** :
   - Ouvre VS Code
   - Va dans l'onglet Extensions (Ctrl+Shift+X ou Cmd+Shift+X)
   - Recherche "Flutter" et installe l'extension officielle
   - L'extension Dart sera installée automatiquement

3. **Extensions recommandées** :
   - **Dart** (déjà installé avec Flutter)
   - **Error Lens** : affiche les erreurs directement dans le code
   - **Material Icon Theme** : icônes jolies pour les fichiers
   - **GitLens** : pour mieux visualiser l'historique Git

✅ Vérifie que VS Code reconnaît Flutter en ouvrant la palette de commandes (Ctrl+Shift+P ou Cmd+Shift+P) et en tapant "Flutter". Tu devrais voir plusieurs commandes Flutter.

---

## 🪜 Étape 3 — Configurer un émulateur ou appareil

Tu as plusieurs options pour tester tes applications :

### Option 1 : Navigateur Web (le plus simple pour débuter)
Flutter peut lancer directement dans Chrome :
```bash
flutter run -d chrome
```

### Option 2 : Émulateur Android
1. Installe Android Studio : https://developer.android.com/studio
2. Lance Android Studio
3. Va dans Tools > Device Manager
4. Clique sur "Create Device"
5. Choisis un modèle (ex : Pixel 6) et télécharge une image système
6. Lance l'émulateur

### Option 3 : Appareil physique
- **Android** : Active le mode développeur et le débogage USB
- **iOS** : Nécessite un Mac et Xcode

---

## 🪜 Étape 4 — Créer ton premier projet Flutter

1. Ouvre un terminal et navigue vers le dossier où tu veux créer ton projet :
   ```bash
   cd ~/Documents
   ```

2. Crée un nouveau projet Flutter :
   ```bash
   flutter create tp0_prenom_nom
   cd tp0_prenom_nom
   ```

3. Ouvre le projet dans VS Code :
   ```bash
   code .
   ```

4. Lance l'application :
   - Ouvre la palette de commandes (Ctrl+Shift+P ou Cmd+Shift+P)
   - Tape "Flutter: Select Device" et choisis ton appareil (Chrome, émulateur, etc.)
   - Appuie sur F5 ou va dans Run > Start Debugging

✅ Tu devrais voir une application avec un compteur qui s'incrémente quand tu cliques sur le bouton +

---

## 🪜 Étape 5 — Comprendre la structure du projet

Explore les fichiers et dossiers créés :

```
tp0_prenom_nom/
├── lib/                    # Code source de l'application
│   └── main.dart          # Point d'entrée de l'app
├── test/                   # Tests unitaires
├── android/               # Code spécifique Android
├── ios/                   # Code spécifique iOS
├── web/                   # Code spécifique Web
├── pubspec.yaml           # Configuration et dépendances
└── README.md              # Documentation du projet
```

### Fichier principal : `lib/main.dart`

Ouvre `lib/main.dart` et observe :

```dart
import 'package:flutter/material.dart';  // Import des widgets Flutter

void main() => runApp(const MyApp());    // Point d'entrée de l'app

class MyApp extends StatelessWidget {    // Widget racine
  // ...
}

class MyHomePage extends StatefulWidget { // Page avec état
  // ...
}

class _MyHomePageState extends State<MyHomePage> { // État de la page
  // ...
}
```

**Concepts clés** :
- `main()` : Point d'entrée de l'application
- `StatelessWidget` : Widget sans état (ne change pas)
- `StatefulWidget` : Widget avec état (peut changer)
- `MaterialApp` : Configure le thème et la navigation

### Fichier de configuration : `pubspec.yaml`

Ce fichier contient :
- Le nom de l'application
- Les dépendances (packages externes)
- Les assets (images, fonts, etc.)

---

## 🪜 Étape 6 — Modifier le code et tester le Hot Reload

1. **Garde l'application en cours d'exécution**

2. **Modifie le code** dans `lib/main.dart` :
   - Change le titre de l'AppBar (ligne ~28)
   - Change le texte de la page (ligne ~65)
   - Change la couleur primaire (ligne ~15)

3. **Sauvegarde le fichier** (Ctrl+S ou Cmd+S)

4. **Observe le hot reload** : L'app se met à jour automatiquement sans redémarrage !

**Exemple de modification** :
```dart
// Avant
title: 'Flutter Demo Home Page',

// Après
title: 'Mon Premier TP Flutter',
```

✅ L'application devrait se mettre à jour instantanément dans l'émulateur/navigateur.

---

## 🪜 Étape 7 — Créer un "Hello World" personnalisé

Remplace tout le contenu de `lib/main.dart` par :

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP0 - Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon premier TP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello World!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Je m\'appelle [Ton Prénom]',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                print('Bouton cliqué !');
              },
              child: const Text('Clique-moi'),
            ),
          ],
        ),
      ),
    );
  }
}
```

✅ Remplace `[Ton Prénom]` par ton vrai prénom et vérifie que tout fonctionne.

---

## 🪜 Étape 8 — Installer et configurer Git

### Installer Git

**Windows** : Télécharge et installe depuis https://git-scm.com/download/win

**macOS** : Git est déjà installé ou peut être installé avec :
```bash
brew install git
```

**Linux** :
```bash
sudo apt install git
```

### Configuration initiale

Configure ton identité Git :
```bash
git config --global user.name "Ton Nom"
git config --global user.email "ton.email@example.com"
```

Vérifie la configuration :
```bash
git config --list
```

---

## 🪜 Étape 9 — Créer un dépôt Git local

1. **Initialise Git** dans ton projet (si ce n'est pas déjà fait) :
   ```bash
   git init
   ```

2. **Vérifie le fichier `.gitignore`** : Flutter crée automatiquement ce fichier avec les bons patterns

3. **Fais ton premier commit** :
   ```bash
   git add .
   git commit -m "Initial commit - Hello World Flutter"
   ```

4. **Vérifie l'historique** :
   ```bash
   git log
   ```

✅ Tu devrais voir ton commit dans l'historique.

---

## 🪜 Étape 10 — Créer un dépôt GitHub et pousser le code

### Créer un compte GitHub (si nécessaire)
Va sur https://github.com et crée un compte gratuit.

### Créer un nouveau repository

1. Connecte-toi sur GitHub
2. Clique sur le bouton "+" en haut à droite > "New repository"
3. Nomme-le `tp0-prenom-nom`
4. Laisse-le **public**
5. **NE coche PAS** "Add a README" (on a déjà du code)
6. Clique sur "Create repository"

### Lier ton projet local à GitHub

GitHub te donne les commandes à exécuter. Copie-les dans ton terminal :

```bash
git remote add origin https://github.com/ton-username/tp0-prenom-nom.git
git branch -M main
git push -u origin main
```

✅ Rafraîchis la page GitHub : ton code devrait apparaître !

---

## 🪜 Étape 11 — Faire des modifications et les pousser

1. **Modifie le code** : Ajoute une icône ou change la couleur du bouton

2. **Ajoute et commite** :
   ```bash
   git add .
   git commit -m "modification du bouton et ajout d'icône"
   ```

3. **Pousse vers GitHub** :
   ```bash
   git push
   ```

✅ Vérifie sur GitHub que ton nouveau commit est visible.

---

## ✅ Objectif final

À la fin du TP, tu dois :
- Avoir Flutter et VS Code correctement installés et configurés
- Avoir créé et lancé ton premier projet Flutter
- Comprendre la structure de base d'un projet
- Avoir créé un "Hello World" personnalisé
- Avoir configuré Git et créé un dépôt GitHub
- Avoir poussé ton code sur GitHub

---

## ✅ Validation (non noté)

Pour valider ce TP0, assure-toi que tu as :
- ✅ Flutter installé et `flutter doctor` fonctionne
- ✅ VS Code configuré avec les extensions Flutter et Dart
- ✅ Créé et lancé ton premier projet Flutter
- ✅ Modifié le code pour afficher ton prénom
- ✅ Configuré Git avec ton nom et email
- ✅ Créé un dépôt GitHub et poussé ton code
- ✅ Au moins 2 commits avec des messages clairs

**Ce TP n'est pas noté** mais est **obligatoire** pour suivre les TPs suivants. Il pose les bases essentielles pour tous les projets à venir.

---

## 💡 Conseils

### Pour Flutter
- **Hot Reload** : Sauvegarde régulièrement pour voir les changements instantanément (r dans le terminal)
- **Hot Restart** : Si hot reload ne suffit pas, fais un restart complet (Shift+R ou R dans le terminal)
- **Debug Console** : Vérifie toujours la console pour les erreurs
- **Flutter Doctor** : Lance `flutter doctor` régulièrement pour vérifier ton installation

### Pour Git
- **Commits réguliers** : Fais des petits commits fréquents plutôt qu'un gros à la fin
- **Messages clairs** : Utilise des messages descriptifs (ex: "ajout du bouton", "correction couleur")
- **gitignore** : Ne commite jamais les dossiers `build/`, `.dart_tool/`, etc.

---

## 🔧 Dépannage

### Flutter doctor affiche des erreurs
- **Android toolchain** : Installe Android Studio et accepte les licences avec `flutter doctor --android-licenses`
- **Xcode** (macOS uniquement) : Installe Xcode depuis l'App Store
- **cmdline-tools** : Dans Android Studio > Settings > Android SDK > SDK Tools > Coche "Android SDK Command-line Tools"

### L'application ne se lance pas
- Vérifie qu'un device est sélectionné : `flutter devices`
- Essaie de lancer en ligne de commande : `flutter run`
- Vérifie qu'il n'y a pas d'erreurs de syntaxe dans le code

### Git push échoue
- Vérifie que tu as bien configuré ton remote : `git remote -v`
- Authentifie-toi sur GitHub (utilise un token personnel si nécessaire)
- Vérifie que tu as les droits sur le repository

### Hot reload ne fonctionne pas
- Fais un Hot Restart avec `R` dans le terminal
- Redémarre complètement l'application
- Vérifie qu'il n'y a pas d'erreurs de compilation

---

## 📚 Ressources utiles

- **Documentation Flutter** : https://docs.flutter.dev/
- **Flutter Codelabs** : https://docs.flutter.dev/codelabs
- **Git Cheat Sheet** : https://education.github.com/git-cheat-sheet-education.pdf
- **Dart Language Tour** : https://dart.dev/guides/language/language-tour
- **Widget Catalog** : https://docs.flutter.dev/ui/widgets

---

## 🎉 Félicitations !

Tu as configuré ton environnement de développement Flutter et créé ton premier projet !

Tu es maintenant prêt à attaquer les TPs suivants où tu vas créer de vraies applications Flutter. 🚀
