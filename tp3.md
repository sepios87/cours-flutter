# 🧱 TP3 – Liste de films avec favoris (JSON local)

## 🎯 Objectifs
- Charger et afficher des données dynamiques depuis un JSON local
- Utiliser des widgets de liste (`ListView`, `ListTile`, `GridView`)
- Gérer des favoris localement
- Structurer son code en plusieurs fichiers
- Découvrir les tests unitaires en Flutter  

🕐 **Durée estimée : 2 à 3 heures**

---

## 🪜 Étape 1 — Créer le projet

1. Dans ton terminal :
   ```bash
   flutter create tp3_nom_prenom
   cd tp3_nom_prenom
   ```
2. Ouvre le dossier dans VS Code ou Android Studio.  
3. Mets à jour les packages :
   ```bash
   flutter pub get
   ```
4. Crée un dossier `assets/data/` et ajoute un fichier `movies.json` :
   ```json
   [
     {
       "title": "Inception",
       "year": 2010,
       "poster": "https://image.tmdb.org/t/p/w500/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg"
     },
     {
       "title": "Interstellar",
       "year": 2014,
       "poster": "https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg"
     },
     {
       "title": "The Dark Knight",
       "year": 2008,
       "poster": "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg"
     }
   ]
   ```
5. Déclare les assets dans `pubspec.yaml` :
   ```yaml
   flutter:
     assets:
       - assets/data/movies.json
   ```

---

## 🪜 Étape 2 — Charger les données du JSON

Crée un fichier `lib/service/movie_service.dart` :

```dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Movie {
  final String title;
  final int year;
  final String poster;

  Movie({required this.title, required this.year, required this.poster});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      year: json['year'],
      poster: json['poster'],
    );
  }
}

class MovieService {
  Future<List<Movie>> loadLocalMovies() async {
    final data = await rootBundle.loadString('assets/data/movies.json');
    final List<dynamic> jsonList = json.decode(data);
    return jsonList.map((json) => Movie.fromJson(json)).toList();
  }
}
```

> **💡 Notions clés expliquées :**
> - **Future** : Représente une valeur qui sera disponible "dans le futur". Comme commander une pizza : tu n'as pas encore la pizza (Future), mais tu l'auras bientôt.
> - **async/await** : `async` dit "cette fonction va prendre du temps", `await` dit "attends ici que ça se termine". C'est comme attendre que ton café soit prêt avant de le boire.
> - **factory constructor** : Une méthode spéciale pour créer des objets. Ici, `Movie.fromJson()` transforme des données brutes JSON en objet Movie structuré.
> - **rootBundle.loadString()** : Charge un fichier texte depuis les assets (comme lire un fichier sur le disque).

---

## 🪜 Étape 3 — Afficher la liste des films

Crée un fichier `lib/movie_list_page.dart` :

```dart
import 'package:flutter/material.dart';
import 'service/movie_service.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final MovieService movieService = MovieService();
  List<Movie> movies = [];
  final Set<String> favorites = {};

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    final loadedMovies = await movieService.loadLocalMovies();
    setState(() {
      movies = loadedMovies;
    });
  }

  void toggleFavorite(String title) {
    setState(() {
      if (favorites.contains(title)) {
        favorites.remove(title);
      } else {
        favorites.add(title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎬 Liste de films'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FavoritesPage(
                    favorites: favorites,
                    movies: movies,
                    toggleFavorite: toggleFavorite,
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: movies.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                final isFav = favorites.contains(movie.title);
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(movie.poster, width: 50),
                    title: Text(movie.title),
                    subtitle: Text('${movie.year}'),
                    trailing: IconButton(
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.red : null,
                      ),
                      onPressed: () => toggleFavorite(movie.title),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  final Set<String> favorites;
  final List<Movie> movies;
  final Function(String) toggleFavorite;

  const FavoritesPage({
    super.key,
    required this.favorites,
    required this.movies,
    required this.toggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final favMovies =
        movies.where((movie) => favorites.contains(movie.title)).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('❤️ Mes favoris')),
      body: favMovies.isEmpty
          ? const Center(child: Text('Aucun favori pour le moment.'))
          : ListView.builder(
              itemCount: favMovies.length,
              itemBuilder: (context, index) {
                final movie = favMovies[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(movie.poster, width: 50),
                    title: Text(movie.title),
                    subtitle: Text('${movie.year}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => toggleFavorite(movie.title),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
```

Et enfin ton `main.dart` :

```dart
import 'package:flutter/material.dart';
import 'movie_list_page.dart';
import 'service/movie_service.dart';

final movieService = MovieService();

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP3 - Liste de films',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MovieListPage(),
    );
  }
}
```

> **💡 Notions clés expliquées :**
> - **initState()** : Appelé UNE SEULE FOIS quand le widget est créé. C'est l'"allumage" du widget, parfait pour charger des données initiales.
> - **Set** : Une collection qui ne peut pas contenir de doublons. Ici, `Set<String>` stocke les titres favoris (impossible d'ajouter deux fois le même film).
> - **ListView.builder()** : Crée une liste optimisée qui ne construit que les éléments visibles à l'écran (performant pour de longues listes).
> - **Navigator.push()** : Change de page en "empilant" une nouvelle page par-dessus l'actuelle (comme ajouter une carte sur un tas).
> - **CircularProgressIndicator** : Une roue qui tourne pour indiquer qu'on attend que quelque chose charge.

✅ Tu devrais maintenant voir une liste de films avec la possibilité de les mettre ou retirer des favoris.

---

## 🪜 Étape 4 — Améliorer l’interface

Quelques idées :
- Transformer la liste en **grille** (`GridView.builder`)  
- Ajouter une **recherche** (`TextField` + `setState`)  
- Mettre une **animation** sur les favoris (`AnimatedIcon` ou `AnimatedContainer`)  
- Trier les films par **année ou titre**

---

## ✅ Objectif final

À la fin du TP, ton application doit :
- Charger des films depuis un **JSON local**  
- Les afficher dans une **liste claire et responsive**  
- Permettre de **mettre ou retirer des favoris**  
- Afficher une **page séparée** listant uniquement les favoris  

---

## 💾 Rendu attendu

- Projet complet nommé : **`tp3_nom_prenom`**  
- Une capture d’écran de la liste et une des favoris  
- Lien GitHub

---

## 🧮 Barème de notation

| Critère | Détails | Points |
|----------|----------|--------|
| **Structure du projet** | Fichiers bien organisés (`main`, `service`, `pages`) | 3 |
| **Chargement des données** | JSON bien lu et affiché sans erreur | 3 |
| **Affichage de la liste** | Liste lisible et responsive | 3 |
| **Gestion des favoris** | Ajout/suppression fonctionnels | 3 |
| **Navigation** | Passage entre pages fluide et sans erreur | 2 |
| **Design et ergonomie** | Couleurs, marges, icônes, lisibilité | 3 |
| **Code et bonnes pratiques** | Respect du style Flutter/Dart | 2 |
| **Créativité et personnalisation** | Bonus visuels, tri, recherche, animations | 1 |
| **Total** |  | **/20 + 2 bonus** |

---

### 🎁 Bonus (+2 points possibles)

#### Bonus 1 : Tests unitaires pour MovieService (+1 point)
Créer un fichier `test/movie_service_test.dart` et écrire au moins 3 tests unitaires qui vérifient :
- Le chargement correct des données depuis le JSON
- Le parsing et la conversion en objets `Movie`
- Le nombre de films retournés correspond au JSON

#### Bonus 2 : GridView avec plusieurs modes d'affichage (+1 point)
Ajouter un bouton dans l'AppBar pour basculer entre deux modes d'affichage :
- Mode Liste (`ListView`) : affichage actuel
- Mode Grille (`GridView.builder`) : affichage en grille 2 colonnes avec cartes visuelles

---

## 💡 Conseils
- Teste ton app sur plusieurs tailles d'écran.
- Utilise `FutureBuilder` si tu veux afficher le chargement plus proprement.
- Ajoute plus de films dans ton JSON pour tester le scroll et les performances.
- Garde ton code propre et bien séparé : c'est le début d'une vraie architecture Flutter !
- Pour les bonus tests, lance `flutter test` dans ton terminal pour exécuter tes tests unitaires.

### 🏗️ Architecture : Instance globale du service
Dans ce TP, `movieService` est définie comme une **instance globale** au niveau du `main.dart`. Cela garantit qu'une seule instance du service existe dans toute l'application. C'est une bonne pratique car :
- Facilite les tests unitaires (on peut remplacer l'instance)
- Permet d'ajouter facilement du cache ou de la configuration
- Prépare le terrain pour évoluer vers une API sans tout réécrire

C'est mieux que des méthodes `static` qui sont difficiles à tester et à étendre !  
