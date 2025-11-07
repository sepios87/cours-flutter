# 🧱 TP4 – Galerie de recettes avec tri et détails

## 🎯 Objectifs
- Manipuler des listes d’objets complexes (titre, image, description, difficulté, durée)  
- Créer une navigation vers une **page de détails**  
- Implémenter un **tri dynamique** (par nom, difficulté ou durée)  
- Structurer un projet Flutter modulaire et réutilisable  

🕐 **Durée estimée : 2 à 3 heures**

---

## 🪜 Étape 1 — Créer le modèle de données

Dans `lib/models/recipe.dart`, crée une classe `Recipe` :

```dart
class Recipe {
  final String title;
  final String image;
  final String description;
  final int duration;
  final String difficulty;

  Recipe({
    required this.title,
    required this.image,
    required this.description,
    required this.duration,
    required this.difficulty,
  });
}
```

Crée ensuite une liste d’exemples dans le même fichier :

```dart
final List<Recipe> recipes = [
  Recipe(
    title: 'Spaghetti Carbonara',
    image: 'assets/images/carbonara.jpg',
    description:
        'Un plat italien classique à base de pâtes, d’œufs, de fromage et de lardons.',
    duration: 20,
    difficulty: 'Facile',
  ),
  Recipe(
    title: 'Tiramisu maison',
    image: 'assets/images/tiramisu.jpg',
    description:
        'Dessert italien à base de mascarpone, café et cacao. Un vrai régal !',
    duration: 25,
    difficulty: 'Facile',
  ),
];
```

---

## 🪜 Étape 2 — Afficher la liste des recettes

Dans `lib/pages/recipe_list_page.dart` :

```dart
import 'package:flutter/material.dart';
import '../models/recipe.dart';
import 'recipe_detail_page.dart';

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({super.key});

  @override
  State<RecipeListPage> createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  List<Recipe> displayedRecipes = List.from(recipes);
  String selectedSort = 'Aucun';

  void sortRecipes(String criteria) {
    setState(() {
      selectedSort = criteria;
      if (criteria == 'Nom') {
        displayedRecipes.sort((a, b) => a.title.compareTo(b.title));
      } else if (criteria == 'Durée') {
        displayedRecipes.sort((a, b) => a.duration.compareTo(b.duration));
      } else if (criteria == 'Difficulté') {
        displayedRecipes.sort((a, b) => a.difficulty.compareTo(b.difficulty));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🍽️ Mes recettes'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
            onSelected: sortRecipes,
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'Nom', child: Text('Trier par nom')),
              const PopupMenuItem(value: 'Durée', child: Text('Trier par durée')),
              const PopupMenuItem(value: 'Difficulté', child: Text('Trier par difficulté')),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: displayedRecipes.length,
        itemBuilder: (context, index) {
          final recipe = displayedRecipes[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Image.asset(recipe.image, width: 60, fit: BoxFit.cover),
              title: Text(recipe.title),
              subtitle: Text('${recipe.duration} min • ${recipe.difficulty}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RecipeDetailPage(recipe: recipe),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
```

---

## 🪜 Étape 3 — Créer la page de détails

Dans `lib/pages/recipe_detail_page.dart` :

```dart
import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(recipe.image, width: double.infinity),
            ),
            const SizedBox(height: 12),
            Text(
              '${recipe.duration} min • ${recipe.difficulty}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            Text(
              recipe.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Recette ajoutée à vos favoris !')),
              ),
              icon: const Icon(Icons.favorite),
              label: const Text('Ajouter aux favoris'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 🪜 Étape 4 — Point d’entrée de l’application

Dans `lib/main.dart` :

```dart
import 'package:flutter/material.dart';
import 'pages/recipe_list_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP4 - Recettes Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const RecipeListPage(),
    );
  }
}
```

✅ Teste ton application : tu devrais voir ta liste de recettes, un tri fonctionnel et une page de détails complète.

---

## ✅ Objectif final

À la fin du TP, ton application doit :
- Afficher une liste de recettes avec image, titre, durée et difficulté  
- Permettre de trier la liste par **nom**, **durée** ou **difficulté**  
- Ouvrir une page de détails pour chaque recette  
- Avoir une interface claire et agréable à parcourir  

---

## 💾 Rendu attendu

- Projet Flutter complet nommé : **`tp4_nom_prenom`**  
- Une capture d’écran de la liste et une du détail d’une recette  
- Lien GitHub ou archive ZIP  

---

## 🧮 Barème de notation

| Critère | Détails | Points |
|----------|----------|--------|
| **Structure du projet** | Organisation claire en `models`, `pages`, `widgets` | 3 |
| **Affichage des données** | Liste fonctionnelle et responsive | 3 |
| **Navigation** | Passage fluide entre liste et détails | 3 |
| **Tri dynamique** | Fonction de tri opérationnelle | 3 |
| **Design et ergonomie** | Interface soignée, couleurs harmonieuses, lisibilité | 3 |
| **Code et bonnes pratiques** | Indentation, nommage cohérent, clarté | 2 |
| **Créativité et personnalisation** | Améliorations visuelles, animations, icônes, style | 3 |
| **Total** |  | **/20 + 2 bonus** |

---

### 🎁 Bonus (+2 points possibles)
1. Ajouter une **barre de recherche** pour filtrer les recettes par nom  
2. Permettre d’**enregistrer les favoris** (avec `SharedPreferences` ou équivalent local)

---

## 💡 Conseils
- Utilise des `ClipRRect` et des `Card` pour améliorer le rendu visuel.  
- Si tu ajoutes une recherche, pense à `TextEditingController` et `setState`.  
- Utilise `ListView.separated` pour mieux aérer ta liste.  
- Sois créatif dans le design : c’est un excellent TP pour montrer ton sens de l’UI/UX !
