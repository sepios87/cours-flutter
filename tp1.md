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

   > **💡 Pourquoi ?** Le fichier `pubspec.yaml` est comme le "gestionnaire de courses" de ton projet. Il liste tous les packages externes dont tu as besoin. `url_launcher` permet d'ouvrir des liens (LinkedIn, sites web), et `share_plus` permet de partager du contenu depuis ton app.

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

> **💡 Pourquoi ces widgets ?**
> - **SingleChildScrollView** : Permet de scroller si le contenu dépasse l'écran (évite les erreurs d'overflow)
> - **Stack** : Empile des widgets les uns sur les autres (comme des calques Photoshop). Ici, l'avatar est posé PAR-DESSUS l'image de couverture
> - **Positioned** : Contrôle précisément où placer un widget dans un Stack (ici `bottom: -40` fait déborder l'avatar vers le bas)

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

> **💡 Pourquoi `onPressed: () { ... }` ?**
> C'est une **fonction anonyme** (ou lambda). En Dart, `onPressed` attend une fonction à exécuter quand on clique. Les `() { }` créent une fonction "à la volée" sans avoir besoin de la nommer. C'est comme dire : "Quand on clique, fais ça".

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

> **💡 Pourquoi ListView ?**
> - **ListView** crée une liste scrollable automatiquement. Avec `scrollDirection: Axis.horizontal`, elle devient horizontale (comme les stories Instagram)
> - C'est mieux que `Row` car avec Row, si tu as beaucoup d'éléments, ils dépasseront de l'écran et causeront une erreur

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

## 🪜 Étape 7 — Améliorer avec le passage de données entre widgets

Pour rendre ton code plus propre et réutilisable, transformons la fonction `projectCard` en un vrai widget personnalisé qui reçoit des données.

### Créer un widget personnalisé

Au lieu d'une simple fonction, crée une nouvelle classe `ProjectCard` :

```dart
class ProjectCard extends StatelessWidget {
  final String image;
  final String title;
  final String? description; // Optionnel

  const ProjectCard({
    super.key,
    required this.image,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
        child: Column(
          children: [
            Image.asset(image, height: 90, width: 140, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (description != null)
                    Text(
                      description!,
                      style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Utiliser le widget personnalisé

Maintenant, remplace les appels à `projectCard()` par :

```dart
children: [
  ProjectCard(
    image: 'assets/images/projet1.jpg',
    title: 'Projet 1',
    description: 'Application mobile',
  ),
  ProjectCard(
    image: 'assets/images/projet2.jpg',
    title: 'Projet 2',
    description: 'Site web responsive',
  ),
  ProjectCard(
    image: 'assets/images/projet3.jpg',
    title: 'Projet 3',
  ),
],
```

> **💡 Passage de données entre widgets - Concepts clés :**
> - **Constructor parameters** : Les widgets reçoivent des données via leur constructeur (comme `image`, `title`)
> - **required** : Indique qu'un paramètre est obligatoire. Sans ça, l'app ne compile pas.
> - **final** : Les variables d'un widget sont immuables (ne changent jamais). C'est une règle de Flutter.
> - **`?` (nullable)** : `String?` signifie que `description` peut être null (optionnel). Si null, on ne l'affiche pas.
> - **`!` (null assertion)** : `description!` dit à Dart "je suis sûr que ce n'est pas null ici". Utilisé après avoir vérifié avec `if (description != null)`.
>
> **Avantages des widgets personnalisés** :
> - **Réutilisabilité** : Tu peux utiliser `ProjectCard` partout dans ton app
> - **Lisibilité** : Le code est plus clair et organisé
> - **Maintenance** : Si tu veux changer l'apparence des cartes, tu modifies un seul endroit
> - **Type safety** : Flutter vérifie que tu passes les bonnes données au bon moment

✅ Ton code est maintenant plus professionnel et réutilisable !

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

#### Bonus 1 : Thème personnalisé complet (+1 point)
Créer un thème global cohérent avec `ThemeData` personnalisé (couleurs, typographie, styles de composants).

#### Bonus 2 : Partage d'image (+1 point)
Modifier le bouton de partage pour partager une image depuis les assets (une capture d'écran de ton profil) avec `share_plus`.

---

## 💡 Conseils
- Teste ton app sur ton téléphone pour voir le rendu réel.  
- Pense à utiliser `SingleChildScrollView` si tu as des erreurs d’overflow.  
- Inspire-toi de vraies cartes de profil sur Behance ou Dribbble pour ton design.  
- Découpe ton code en plusieurs widgets pour plus de clarté.
