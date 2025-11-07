# 🧱 TP0 – Configuration de l'environnement et premiers pas

## 🎯 Objectifs
- Installer **Flutter** et **VS Code**
- Créer et lancer son premier projet "Hello World"
- Découvrir **Git et GitHub**

🕐 **Durée estimée : 1 heure**

---

## 🪜 Étape 1 — Installer Flutter

### Windows
1. Télécharge le SDK Flutter : https://docs.flutter.dev/get-started/install/windows
2. Extrais l'archive dans `C:\flutter`
3. Ajoute Flutter au PATH :
   - Recherche "variables d'environnement" dans Windows
   - Dans "Variables système", trouve "Path" → "Modifier"
   - Ajoute `C:\flutter\bin`

### macOS
1. Télécharge le SDK Flutter : https://docs.flutter.dev/get-started/install/macos
2. Extrais l'archive dans `~/flutter`
3. Ajoute au PATH (édite `~/.zshrc`) :
   ```bash
   export PATH="$PATH:$HOME/flutter/bin"
   source ~/.zshrc
   ```

### ✅ Checkpoint : Vérifie l'installation

Lance dans un terminal :
```bash
flutter doctor
```

Tu dois voir :
```
[✓] Flutter (Channel stable, 3.x.x)
[✓] ou [!] Android toolchain / Chrome
```

**❌ Si `[✗] Flutter` :** Reprends l'installation et vérifie le PATH
**⚠️ Si `[!]` :** C'est normal, continue !

---

## 🪜 Étape 2 — Installer VS Code

1. Télécharge VS Code : https://code.visualstudio.com/
2. Installe l'extension **Flutter** (Ctrl+Shift+X ou Cmd+Shift+X)
   - L'extension Dart s'installera automatiquement

---

## 🪜 Étape 3 — Installer Android Studio (optionnel mais recommandé)

Android Studio permet de lancer l'application sur un émulateur Android.

1. **Télécharge Android Studio** : https://developer.android.com/studio
2. **Installe-le** et lance-le
3. **Accepte les licences** :
   ```bash
   flutter doctor --android-licenses
   ```
   (Tape `y` pour accepter toutes les licences)

4. **Crée un émulateur** :
   - Dans Android Studio, va dans **Tools > Device Manager**
   - Clique sur **Create Device**
   - Choisis un modèle (ex : **Pixel 6**)
   - Télécharge une image système (ex : **Android 13**)
   - Clique sur **Finish**

5. **Lance l'émulateur** :
   - Dans Device Manager, clique sur le bouton ▶️ à côté de ton émulateur

### ✅ Checkpoint : Vérifie l'émulateur

Lance dans un terminal :
```bash
flutter devices
```

Tu dois voir ton émulateur dans la liste :
```
Android SDK built for x86 (mobile) • emulator-5554 • android-x86 • Android 13 (API 33)
```

**❌ Si l'émulateur n'apparaît pas :** Relance-le depuis Android Studio

---

## 🪜 Étape 4 — Créer ton premier projet

1. Ouvre un terminal :
   ```bash
   cd ~/Localisation/De/Ton/Choix
   flutter create tp0_prenom_nom
   cd tp0_prenom_nom
   code .
   ```

2. Lance l'application :
   - Dans VS Code, ouvre la palette (Ctrl+Shift+P ou Cmd+Shift+P)
   - Tape "Flutter: Select Device"
   - Choisis un device :
     - **Chrome** (le plus simple pour débuter)
     - **Ton émulateur Android** (si tu as installé Android Studio)
   - Appuie sur **F5**

### ✅ Checkpoint : Vérifie le lancement

Tu dois voir une application avec un compteur qui s'incrémente quand tu cliques sur **+**

**Sur Chrome :** L'app s'ouvre dans le navigateur
**Sur Android :** L'app s'ouvre dans l'émulateur

**❌ Si erreur :** Lance `flutter devices` pour voir les devices disponibles

---

## 🪜 Étape 4 — Créer un "Hello World" personnalisé

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

### ✅ Checkpoint : Teste le Hot Reload

1. Remplace `[Ton Prénom]` par ton vrai prénom
2. Sauvegarde (Ctrl+S ou Cmd+S)
3. L'app doit se mettre à jour instantanément

**❌ Si pas de mise à jour :** Appuie sur `R` dans le terminal pour forcer un Hot Restart

---

## 🪜 Étape 5 — Configurer Git et GitHub

### Installer et configurer Git

**Windows** : https://git-scm.com/download/win
**macOS** : Déjà installé

Configure ton identité :
```bash
git config --global user.name "Ton Nom"
git config --global user.email "ton.email@example.com"
```

### Créer un dépôt GitHub

1. Va sur https://github.com et connecte-toi
2. Clique sur "+" → "New repository"
3. Nomme-le `tp0-prenom-nom` et laisse-le **public**
4. **NE coche PAS** "Add a README"
5. Clique sur "Create repository"

### Pousser ton code

Dans le terminal de ton projet :
```bash
git add .
git commit -m "Initial commit - Hello World Flutter"
git remote add origin https://github.com/ton-username/tp0-prenom-nom.git
git branch -M main
git push -u origin main
```

### ✅ Checkpoint : Vérifie GitHub

Rafraîchis la page GitHub : ton code doit apparaître !

**❌ Si erreur d'authentification :** Tu dois créer un Personal Access Token sur GitHub

---

## 🪜 Étape 6 — Faire une modification et la pousser

1. Modifie le code (change la couleur du bouton, ajoute du texte, etc.)
2. Commite et pousse :
   ```bash
   git add .
   git commit -m "modification de l'interface"
   git push
   ```

### ✅ Checkpoint : Vérifie le commit

Sur GitHub, tu dois voir ton nouveau commit dans l'historique.

---

## ✅ Validation finale (non noté)

Pour valider ce TP0, tu dois avoir :
- ✅ Flutter installé (`flutter doctor` fonctionne)
- ✅ VS Code avec l'extension Flutter
- ✅ Un projet Flutter qui se lance avec ton prénom
- ✅ Un dépôt GitHub avec au moins 2 commits

---

## 🔧 Dépannage rapide

### Flutter doctor affiche des erreurs
- **Android toolchain** : Lance `flutter doctor --android-licenses` pour accepter les licences
- **cmdline-tools** : Dans Android Studio → Settings → Android SDK → SDK Tools → Coche "Android SDK Command-line Tools"

### L'émulateur Android ne démarre pas
- Vérifie que la virtualisation est activée dans le BIOS (Windows)
- Relance Android Studio et ouvre Device Manager
- Essaie de créer un nouvel émulateur avec une image système plus récente

### L'application ne se lance pas
- Vérifie qu'un device est sélectionné : `flutter devices`
- Si tu utilises l'émulateur, assure-toi qu'il est bien lancé
- Essaie de lancer avec : `flutter run -d chrome` ou `flutter run -d <device-id>`

---

## 📚 Ressources utiles

- **Documentation Flutter** : https://docs.flutter.dev/
- **Dart Language Tour** : https://dart.dev/guides/language/language-tour
- **Widget Catalog** : https://docs.flutter.dev/ui/widgets

---

## 🎉 Félicitations !

Tu es maintenant prêt à attaquer les TPs suivants ! 🚀
