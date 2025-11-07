# 🧱 TP1 – Carte de profil interactive

## 🎯 Objectifs
- Découvrir la structure d’un projet Flutter  
- Manipuler les widgets de base (`Column`, `Row`, `Stack`, `Image`, `Text`, `Icon`)  
- Styliser son interface  
- Gérer une interaction simple (ouvrir un lien, partager une info)

🕐 **Durée estimée : 2 à 3 heures**

---

## 🪜 Étape 1 — Créer le projet

1. Ouvre ton terminal et exécute :
   ```bash
   flutter create tp1_nom_prenom
   cd tp1_nom_prenom
   ```
2. Ouvre le dossier dans VS Code ou Android Studio.
3. Dans le fichier `pubspec.yaml`, ajoute les dépendances suivantes :
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     url_launcher: ^6.1.10
     share_plus: ^6.3.0
   ```
4. Mets à jour ton projet :
   ```bash
   flutter pub get
   ```
5. Crée un dossier `assets/images/` et ajoute-y quelques images :
   - une photo de profil  
   - une image de couverture  
   - 2 ou 3 images de projets  
   
   Puis déclare-les dans le fichier `pubspec.yaml` :
   ```yaml
   flutter:
     assets:
       - assets/images/
   ```

---

## 🪜 Étape 2 — Préparer la structure de base

Ouvre `lib/main.dart` et reprend cet exemple :

```dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP1 - Mon profil',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mon profil')),
      body: const Center(child: Text('Bienvenue !')),
    );
  }
}
```

👉 Lance ton application (`flutter run`) pour vérifier qu’elle fonctionne.

---

## 🪜 Étape 3 — Ajouter une image de couverture et une photo de profil

Remplace le `body` par quelque chose comme :

```dart
body: SingleChildScrollView(
  child: Column(
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/cover.jpg',
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: -40,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/photo.jpg'),
            ),
          ),
        ],
      ),
      const SizedBox(height: 50),
    ],
  ),
),
```

✅ Tu dois maintenant voir une image de couverture et ton avatar au centre.

---

## 🪜 Étape 4 — Ajouter ton nom, ta spécialité et une bio

Sous le `SizedBox`, ajoute :

```dart
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: Column(
    children: [
      Text('Ton Nom', style: Theme.of(context).textTheme.headlineSmall),
      const SizedBox(height: 4),
      Text('MMI - Étudiant en Développement et Design'),
      const SizedBox(height: 8),
      Text(
        'Je suis passionné par le développement mobile et le design d’interfaces. '
        'J’apprends à créer des applications modernes avec Flutter.',
        textAlign: TextAlign.center,
      ),
    ],
  ),
),
```

---

## 🪜 Étape 5 — Ajouter des icônes de réseaux sociaux et un bouton de partage

Toujours dans la `Column`, ajoute :

```dart
const SizedBox(height: 12),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    IconButton(
      icon: const Icon(Icons.link),
      onPressed: () {
        launchUrl(Uri.parse('https://linkedin.com/in/tonprofil'));
      },
    ),
    IconButton(
      icon: const Icon(Icons.share),
      onPressed: () {
        Share.share('Découvrez mon profil Flutter !');
      },
    ),
  ],
),
```

✅ Tester que les icônes réagissent au clic.

---

## 🪜 Étape 6 — Créer une section "Mes projets"

Ajoute en bas de la page :

```dart
const SizedBox(height: 20),
Text('Mes projets', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
const SizedBox(height: 8),
SizedBox(
  height: 150,
  child: ListView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 12),
    children: [
      projectCard('assets/images/projet1.jpg', 'Projet 1'),
      projectCard('assets/images/projet2.jpg', 'Projet 2'),
      projectCard('assets/images/projet3.jpg', 'Projet 3'),
    ],
  ),
),
```

et crée cette fonction au-dessus de la classe `ProfilePage` :

```dart
Widget projectCard(String image, String title) {
  return SizedBox(
    width: 140,
    child: Card(
      child: Column(
        children: [
          Image.asset(image, height: 90, width: 140, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          ),
        ],
      ),
    ),
  );
}
```

✅ Tu dois pouvoir faire défiler tes projets horizontalement.

---

## ✅ Objectif final

À la fin du TP, ton application doit :
- Afficher ton profil (image, nom, bio)
- Contenir des liens vers tes réseaux
- Montrer une liste horizontale de projets
- Avoir un style harmonieux

---

## 💾 Rendu attendu

- Un projet Flutter complet nommé :  
  **`tp1_nom_prenom`**  
- Une capture d’écran de ton application  
- Un lien GitHub

---

## 🧮 Barème de notation

| Critère | Détails | Points |
|----------|----------|--------|
| **Structure du projet** | Organisation des fichiers, code clair, indentation correcte | 3 |
| **Widgets de base** | Utilisation cohérente des widgets (`Column`, `Row`, `Stack`, etc.) | 3 |
| **Code et bonnes pratiques** | Respect des conventions Flutter/Dart, pas d’erreurs, code lisible | 2 |
| **Affichage du profil** | Image, nom, bio et mise en page respectés | 3 |
| **Section projets** | Présentation claire, défilement horizontal fonctionnel | 2 |
| **Interactions** | Boutons (liens, partage) fonctionnels et pertinents | 2 |
| **Design et esthétique** | Choix des couleurs, marges, alignements, cohérence visuelle (au dela du code d'exemple) | 3 |
| **Créativité et personnalisation** | Originalité du contenu et du design | 2 |
| **Total** |  | **/20 + 2 bonus** |

### 🎁 Bonus (+2 points possibles)
1. Thème global (`ThemeData`) bien
2. Fonction de partage fonctionnelle

---

## 💡 Conseils
- Teste ton app sur ton téléphone pour voir le rendu réel.  
- Pense à utiliser `SingleChildScrollView` si tu as des erreurs d’overflow.  
- Inspire-toi de vraies cartes de profil sur Behance ou Dribbble pour ton design.  
- Découpe ton code en plusieurs widgets pour plus de clarté.
