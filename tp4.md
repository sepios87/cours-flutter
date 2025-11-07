# 🧱 TP4 – Liste de films avec API (TMDB) et Dio

## 🎯 Objectifs
- Reprendre le projet du TP3 et le faire évoluer vers une API réelle
- Utiliser **Dio** pour effectuer des requêtes HTTP
- Intégrer l'API **The Movie Database (TMDB)**
- Gérer les états de chargement et les erreurs réseau
- Afficher des données dynamiques provenant d'une source externe

🕐 **Durée estimée : 2 à 3 heures**

---

## 🪜 Étape 1 — Préparer le projet

1. Reprends ton projet du TP3 ou crée un nouveau projet :
   ```bash
   flutter create tp4_nom_prenom
   cd tp4_nom_prenom
   ```

2. Ajoute la dépendance **Dio** dans `pubspec.yaml` :
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     dio: ^5.4.0
   ```

3. Mets à jour les packages :
   ```bash
   flutter pub get
   ```

4. Crée un compte gratuit sur [The Movie Database](https://www.themoviedb.org/) et obtiens une clé API :
   - Inscris-toi sur https://www.themoviedb.org/signup
   - Va dans ton compte → Paramètres → API
   - Demande une clé API (choisis l'option "Developer")
   - Copie ta clé API (API Key v3)

---

## 🪜 Étape 2 — Créer le modèle Movie adapté à TMDB

Dans `lib/models/movie.dart` :

```dart
class Movie {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final String releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'] ?? 'Sans titre',
      overview: json['overview'] ?? 'Aucune description disponible',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      releaseDate: json['release_date'] ?? '',
    );
  }

  String get fullPosterUrl => posterPath != null
      ? 'https://image.tmdb.org/t/p/w500$posterPath'
      : 'https://via.placeholder.com/500x750?text=No+Image';

  String get fullBackdropUrl => backdropPath != null
      ? 'https://image.tmdb.org/t/p/w780$backdropPath'
      : 'https://via.placeholder.com/780x439?text=No+Image';
}
```

---

## 🪜 Étape 3 — Créer le service API avec Dio

Dans `lib/services/movie_service.dart` :

```dart
import 'package:dio/dio.dart';
import '../models/movie.dart';

class MovieService {
  final Dio _dio = Dio();
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey = 'TA_CLE_API_ICI'; // ⚠️ Remplace par ta clé API

  Future<List<Movie>> getPopularMovies() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/movie/popular',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'fr-FR',
          'page': 1,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Erreur lors du chargement des films');
      }
    } catch (e) {
      throw Exception('Erreur réseau : $e');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/search/movie',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'fr-FR',
          'query': query,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Erreur lors de la recherche');
      }
    } catch (e) {
      throw Exception('Erreur réseau : $e');
    }
  }
}
```

---

## 🪜 Étape 4 — Créer la page de liste avec gestion des états

Dans `lib/pages/movie_list_page.dart` :

```dart
import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';
import 'movie_detail_page.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final MovieService _movieService = MovieService();
  List<Movie> movies = [];
  bool isLoading = true;
  String? errorMessage;
  final Set<int> favorites = {};

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final loadedMovies = await _movieService.getPopularMovies();
      setState(() {
        movies = loadedMovies;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  void toggleFavorite(int movieId) {
    setState(() {
      if (favorites.contains(movieId)) {
        favorites.remove(movieId);
      } else {
        favorites.add(movieId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎬 Films populaires'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadMovies,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, size: 60, color: Colors.red),
                      const SizedBox(height: 16),
                      Text(errorMessage!),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadMovies,
                        child: const Text('Réessayer'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    final isFav = favorites.contains(movie.id);
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            movie.fullPosterUrl,
                            width: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.movie, size: 50),
                          ),
                        ),
                        title: Text(movie.title),
                        subtitle: Text(
                          '⭐ ${movie.voteAverage.toStringAsFixed(1)} • ${movie.releaseDate.split('-')[0]}',
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Colors.red : null,
                          ),
                          onPressed: () => toggleFavorite(movie.id),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MovieDetailPage(movie: movie),
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

## 🪜 Étape 5 — Créer la page de détails

Dans `lib/pages/movie_detail_page.dart` :

```dart
import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image de couverture
            Image.network(
              movie.fullBackdropUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 250,
                color: Colors.grey[300],
                child: const Icon(Icons.movie, size: 100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Note et date
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 28),
                      const SizedBox(width: 8),
                      Text(
                        movie.voteAverage.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Sortie : ${movie.releaseDate}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Synopsis',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.overview,
                    style: const TextStyle(fontSize: 16, height: 1.5),
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

---

## 🪜 Étape 6 — Point d'entrée de l'application

Dans `lib/main.dart` :

```dart
import 'package:flutter/material.dart';
import 'pages/movie_list_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP4 - Films API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MovieListPage(),
    );
  }
}
```

✅ Teste ton application : tu devrais voir une liste de films populaires chargés depuis TMDB !

---

## ✅ Objectif final

À la fin du TP, ton application doit :
- Charger des films depuis l'**API TMDB** avec **Dio**
- Afficher une liste de films populaires avec images et notes
- Gérer les **états de chargement et d'erreur**
- Permettre de naviguer vers une page de détails complète
- Gérer les favoris (stockage local)

---

## 💾 Rendu attendu

- Projet Flutter complet nommé : **`tp4_nom_prenom`**
- Une capture d'écran de la liste et une du détail d'un film
- Lien GitHub ou archive ZIP
- **Important** : Ne commite PAS ta clé API ! Utilise un fichier `.env` ou laisse une instruction pour l'ajouter

---

## 🧮 Barème de notation

| Critère | Détails | Points |
|----------|----------|--------|
| **Structure du projet** | Organisation claire en `models`, `services`, `pages` | 3 |
| **Intégration API avec Dio** | Requêtes fonctionnelles, clé API correctement utilisée | 4 |
| **Gestion des états** | Loading, erreur, et données affichées correctement | 3 |
| **Affichage de la liste** | Liste fonctionnelle, images chargées, informations claires | 3 |
| **Navigation et détails** | Page de détails avec informations complètes et mise en page soignée | 2 |
| **Gestion des favoris** | Ajout/suppression fonctionnels | 2 |
| **Design et ergonomie** | Interface soignée, gestion des erreurs d'images | 2 |
| **Code et bonnes pratiques** | Code propre, gestion d'erreurs, pas de clé API commitée | 1 |
| **Total** |  | **/20 + 2 bonus** |

---

### 🎁 Bonus (+2 points possibles)

#### Bonus 1 : Fonction de recherche (+1 point)
Ajouter une barre de recherche qui utilise l'endpoint `/search/movie` de TMDB pour rechercher des films par titre. Utilise `searchMovies()` du service.

#### Bonus 2 : Pagination ou catégories (+1 point)
Implémenter soit :
- Un scroll infini avec pagination (charger plus de films au scroll)
- Plusieurs catégories de films (populaires, mieux notés, à venir) avec des onglets

---

## 💡 Conseils

- **Sécurité** : Ne commite jamais ta clé API. Utilise un fichier `.gitignore` ou des variables d'environnement.
- **Gestion d'erreurs** : Teste ton app en mode avion pour voir si les erreurs sont bien gérées.
- **Images** : Utilise toujours `errorBuilder` pour les widgets `Image.network`.
- **Performance** : Dio met automatiquement en cache certaines requêtes, ce qui améliore les performances.

### 🌐 Documentation utile
- [TMDB API Documentation](https://developer.themoviedb.org/docs/getting-started)
- [Dio Package](https://pub.dev/packages/dio)
- [Guide des endpoints TMDB](https://developer.themoviedb.org/reference/movie-popular-list)

### 🔄 Différences avec le TP3
Dans le TP3, tu chargeais des données depuis un JSON local. Maintenant tu :
- Charges des données depuis une API réelle avec Dio
- Gères les états de chargement et les erreurs réseau
- Travailles avec des données dynamiques qui changent dans le temps
- Apprends à sécuriser une clé API

C'est le passage d'une app statique à une app connectée !
