# 📚 Cheatsheet Flutter - TPs MMI

Ce document recense tous les widgets, concepts, objets et notions utilisés dans les TPs Flutter, avec des explications claires et des exemples concrets.

---

## 📦 Table des matières

1. [Widgets de base](#widgets-de-base)
2. [Widgets de layout](#widgets-de-layout)
3. [Widgets interactifs](#widgets-interactifs)
4. [Widgets de liste](#widgets-de-liste)
5. [Widgets de navigation](#widgets-de-navigation)
6. [Widgets d'affichage d'images](#widgets-daffichage-dimages)
7. [Widgets de chargement et d'erreur](#widgets-de-chargement-et-derreur)
8. [Types de widgets](#types-de-widgets)
9. [Concepts Dart](#concepts-dart)
10. [Collections Dart](#collections-dart)
11. [Programmation asynchrone](#programmation-asynchrone)
12. [Gestion d'état](#gestion-détat)
13. [Navigation](#navigation)
14. [Parsing et sérialisation](#parsing-et-sérialisation)
15. [Réseau et API](#réseau-et-api)
16. [Bonnes pratiques](#bonnes-pratiques)

---

## 📱 Widgets de base

### Text
Affiche du texte à l'écran.

```dart
Text('Bonjour')
Text(
  'Hello World',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
  textAlign: TextAlign.center,
)
```

**Propriétés principales** :
- `style` : TextStyle pour personnaliser l'apparence
- `textAlign` : Alignement du texte (left, center, right, justify)
- `maxLines` : Nombre maximum de lignes
- `overflow` : Comportement si le texte dépasse (ellipsis, fade, clip)

---

### Icon
Affiche une icône Material Design.

```dart
Icon(Icons.favorite)
Icon(
  Icons.star,
  size: 30,
  color: Colors.amber,
)
```

**Propriétés principales** :
- `size` : Taille de l'icône
- `color` : Couleur de l'icône

**Icônes courantes** :
- `Icons.home`, `Icons.favorite`, `Icons.share`, `Icons.delete`
- `Icons.add`, `Icons.remove`, `Icons.close`, `Icons.check`
- Liste complète : https://api.flutter.dev/flutter/material/Icons-class.html

---

### Container
Widget de base pour le style et le positionnement. C'est comme une "boîte" que tu peux personnaliser.

```dart
Container(
  width: 100,
  height: 100,
  color: Colors.blue,
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.only(top: 20),
  child: Text('Hello'),
)
```

**Propriétés principales** :
- `width` / `height` : Dimensions
- `color` : Couleur de fond
- `padding` : Espacement intérieur
- `margin` : Espacement extérieur
- `decoration` : BoxDecoration pour bordures, ombres, gradients
- `child` : Widget enfant

---

### SizedBox
Crée un espace vide de taille fixe. Très utile pour espacer des widgets.

```dart
SizedBox(height: 20)  // Espace vertical de 20 pixels
SizedBox(width: 50)   // Espace horizontal de 50 pixels
SizedBox(
  width: 100,
  height: 100,
  child: CircularProgressIndicator(),
)
```

**Quand l'utiliser** :
- Pour espacer des widgets dans une Column ou Row
- Pour forcer la taille d'un widget enfant

---

### Padding
Ajoute de l'espacement autour d'un widget.

```dart
Padding(
  padding: EdgeInsets.all(16),  // 16px de tous les côtés
  child: Text('Contenu'),
)

Padding(
  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  child: Text('Contenu'),
)

Padding(
  padding: EdgeInsets.only(left: 10, top: 5),
  child: Text('Contenu'),
)
```

**EdgeInsets types** :
- `EdgeInsets.all(value)` : Même espacement partout
- `EdgeInsets.symmetric(horizontal: x, vertical: y)` : Horizontal et vertical
- `EdgeInsets.only(left:, right:, top:, bottom:)` : Contrôle précis
- `EdgeInsets.zero` : Pas d'espacement

---

### Card
Crée une carte Material Design avec ombre et coins arrondis.

```dart
Card(
  margin: EdgeInsets.all(8),
  elevation: 4,  // Hauteur de l'ombre
  child: ListTile(
    title: Text('Titre'),
    subtitle: Text('Sous-titre'),
  ),
)
```

**Propriétés principales** :
- `elevation` : Hauteur de l'ombre (0-24)
- `margin` : Espacement extérieur
- `color` : Couleur de fond
- `shape` : Forme personnalisée

---

### Divider
Ligne de séparation horizontale.

```dart
Divider()
Divider(
  height: 20,
  thickness: 2,
  color: Colors.grey,
  indent: 20,    // Marge à gauche
  endIndent: 20, // Marge à droite
)
```

---

## 🏗️ Widgets de layout

### Column
Empile des widgets verticalement (de haut en bas).

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,  // Axe vertical
  crossAxisAlignment: CrossAxisAlignment.start, // Axe horizontal
  children: [
    Text('Premier'),
    Text('Deuxième'),
    Text('Troisième'),
  ],
)
```

**MainAxisAlignment** (axe principal = vertical) :
- `start` : En haut
- `center` : Au centre
- `end` : En bas
- `spaceBetween` : Espace égal entre les éléments
- `spaceAround` : Espace autour des éléments
- `spaceEvenly` : Espace égal partout

**CrossAxisAlignment** (axe croisé = horizontal) :
- `start` : À gauche
- `center` : Au centre
- `end` : À droite
- `stretch` : Étire les widgets sur toute la largeur

---

### Row
Aligne des widgets horizontalement (de gauche à droite).

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Icon(Icons.home),
    Text('Accueil'),
    Icon(Icons.arrow_forward),
  ],
)
```

**Propriétés** : Identiques à Column, mais inversées (mainAxis = horizontal)

**⚠️ Attention** : Row ne scroll pas ! Si les enfants sont trop larges, erreur. Utilise ListView ou SingleChildScrollView.

---

### Stack
Empile des widgets les uns sur les autres (comme des calques Photoshop).

```dart
Stack(
  alignment: Alignment.center,
  children: [
    Image.asset('fond.jpg'),
    Text('Texte par-dessus'),
    Positioned(
      top: 10,
      right: 10,
      child: Icon(Icons.favorite),
    ),
  ],
)
```

**Propriétés principales** :
- `alignment` : Alignement par défaut des enfants
- `fit` : Comment redimensionner les enfants (expand, loose, passthrough)

**Widget associé : Positioned**
Permet de positionner précisément un enfant dans un Stack.

```dart
Positioned(
  top: 20,
  left: 30,
  child: Text('En haut à gauche'),
)

Positioned(
  bottom: 0,
  right: 0,
  width: 100,
  height: 50,
  child: Container(color: Colors.red),
)
```

---

### Center
Centre son enfant horizontalement et verticalement.

```dart
Center(
  child: Text('Je suis centré'),
)
```

**Équivalent** :
```dart
Container(
  alignment: Alignment.center,
  child: Text('Je suis centré'),
)
```

---

### Expanded
Dans une Column ou Row, prend tout l'espace disponible restant.

```dart
Row(
  children: [
    Icon(Icons.menu),
    Expanded(
      child: Text('Ce texte prend tout l\'espace disponible'),
    ),
    Icon(Icons.search),
  ],
)
```

**Avec flex** (proportions) :
```dart
Row(
  children: [
    Expanded(flex: 2, child: Container(color: Colors.red)),  // 2/3
    Expanded(flex: 1, child: Container(color: Colors.blue)), // 1/3
  ],
)
```

---

### Spacer
Crée un espace flexible dans une Row ou Column.

```dart
Row(
  children: [
    Text('Gauche'),
    Spacer(),  // Pousse tout à droite
    Text('Droite'),
  ],
)
```

**Équivalent** : `Expanded(child: SizedBox())`

---

### SingleChildScrollView
Rend son contenu scrollable. Utilisé quand le contenu peut dépasser l'écran.

```dart
SingleChildScrollView(
  child: Column(
    children: [
      // Beaucoup de contenu...
    ],
  ),
)
```

**Propriétés principales** :
- `scrollDirection` : Axis.vertical (défaut) ou Axis.horizontal
- `padding` : Padding autour du contenu

**⚠️ Attention** : Ne pas utiliser avec des listes infinies ! Utilise ListView à la place.

---

### Scaffold
Structure de base d'une page Material Design avec AppBar, body, etc.

```dart
Scaffold(
  appBar: AppBar(
    title: Text('Titre'),
    actions: [
      IconButton(icon: Icon(Icons.search), onPressed: () {}),
    ],
  ),
  body: Center(child: Text('Contenu')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
  drawer: Drawer(),  // Menu latéral
  bottomNavigationBar: BottomNavigationBar(),
)
```

**Composants** :
- `appBar` : Barre d'application en haut
- `body` : Contenu principal
- `floatingActionButton` : Bouton flottant (FAB)
- `drawer` : Menu coulissant depuis la gauche
- `endDrawer` : Menu coulissant depuis la droite
- `bottomNavigationBar` : Barre de navigation en bas

---

### AppBar
Barre d'application en haut de l'écran.

```dart
AppBar(
  title: Text('Mon App'),
  centerTitle: true,
  backgroundColor: Colors.blue,
  leading: IconButton(
    icon: Icon(Icons.menu),
    onPressed: () {},
  ),
  actions: [
    IconButton(icon: Icon(Icons.search), onPressed: () {}),
    IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
  ],
)
```

---

## 🎮 Widgets interactifs

### ElevatedButton
Bouton Material Design avec élévation (ombre).

```dart
ElevatedButton(
  onPressed: () {
    print('Bouton cliqué');
  },
  child: Text('Cliquer'),
)

ElevatedButton(
  onPressed: null,  // Bouton désactivé
  child: Text('Désactivé'),
)

ElevatedButton.icon(
  onPressed: () {},
  icon: Icon(Icons.send),
  label: Text('Envoyer'),
)
```

**Autres types de boutons** :
- `TextButton` : Bouton plat sans élévation
- `OutlinedButton` : Bouton avec bordure
- `IconButton` : Bouton icône seule

---

### IconButton
Bouton sous forme d'icône.

```dart
IconButton(
  icon: Icon(Icons.favorite),
  color: Colors.red,
  iconSize: 30,
  onPressed: () {
    print('Favori cliqué');
  },
)
```

---

### TextField
Champ de saisie de texte.

```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Nom',
    hintText: 'Entrez votre nom',
    prefixIcon: Icon(Icons.person),
    border: OutlineInputBorder(),
  ),
  onChanged: (value) {
    print('Texte : $value');
  },
)
```

**Propriétés principales** :
- `controller` : TextEditingController pour gérer le texte
- `decoration` : InputDecoration pour le style
- `obscureText` : true pour masquer le texte (mot de passe)
- `keyboardType` : Type de clavier (text, number, email, phone)
- `maxLines` : Nombre de lignes (null pour illimité)

---

### Checkbox
Case à cocher.

```dart
bool isChecked = false;

Checkbox(
  value: isChecked,
  onChanged: (bool? newValue) {
    setState(() {
      isChecked = newValue ?? false;
    });
  },
)
```

---

### Switch
Interrupteur on/off.

```dart
bool isSwitched = false;

Switch(
  value: isSwitched,
  onChanged: (bool newValue) {
    setState(() {
      isSwitched = newValue;
    });
  },
)
```

---

### Slider
Curseur pour sélectionner une valeur.

```dart
double sliderValue = 50;

Slider(
  value: sliderValue,
  min: 0,
  max: 100,
  divisions: 10,  // 10 étapes
  label: sliderValue.toString(),
  onChanged: (double newValue) {
    setState(() {
      sliderValue = newValue;
    });
  },
)
```

---

## 📜 Widgets de liste

### ListView
Liste scrollable de widgets.

```dart
// ListView simple
ListView(
  children: [
    ListTile(title: Text('Item 1')),
    ListTile(title: Text('Item 2')),
    ListTile(title: Text('Item 3')),
  ],
)

// ListView.builder (optimisé pour grandes listes)
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(items[index]),
    );
  },
)

// ListView horizontal
ListView(
  scrollDirection: Axis.horizontal,
  children: [
    Container(width: 100, color: Colors.red),
    Container(width: 100, color: Colors.blue),
  ],
)
```

**Quand utiliser ListView.builder** :
- Pour des listes longues (> 10 items)
- Optimise les performances : ne construit que les items visibles
- Obligatoire pour des listes infinies

---

### GridView
Grille scrollable de widgets.

```dart
GridView.count(
  crossAxisCount: 2,  // 2 colonnes
  children: [
    Card(child: Center(child: Text('1'))),
    Card(child: Center(child: Text('2'))),
    Card(child: Center(child: Text('3'))),
    Card(child: Center(child: Text('4'))),
  ],
)

// GridView.builder (optimisé)
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  ),
  itemCount: items.length,
  itemBuilder: (context, index) {
    return Card(child: Text(items[index]));
  },
)
```

---

### ListTile
Widget préformaté pour les items de liste.

```dart
ListTile(
  leading: Icon(Icons.person),      // À gauche
  title: Text('John Doe'),          // Titre
  subtitle: Text('Developer'),      // Sous-titre
  trailing: Icon(Icons.arrow_forward), // À droite
  onTap: () {
    print('Item cliqué');
  },
)

ListTile(
  leading: CircleAvatar(
    backgroundImage: NetworkImage('url'),
  ),
  title: Text('Article'),
  subtitle: Text('Description'),
  isThreeLine: true,
  dense: true,  // Plus compact
)
```

---

## 🧭 Widgets de navigation

### MaterialApp
Point d'entrée de l'application. Configure le thème, les routes, etc.

```dart
MaterialApp(
  title: 'Mon App',
  theme: ThemeData(
    primarySwatch: Colors.blue,
    useMaterial3: true,
  ),
  home: HomePage(),
  debugShowCheckedModeBanner: false,  // Cache le bandeau DEBUG
)
```

---

### Navigator
Gestion de la navigation entre pages.

```dart
// Aller vers une nouvelle page
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondPage()),
)

// Retour arrière
Navigator.pop(context)

// Retour avec une valeur
Navigator.pop(context, 'Résultat')

// Remplacer la page actuelle
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => NewPage()),
)
```

---

## 🖼️ Widgets d'affichage d'images

### Image
Affiche une image.

```dart
// Image depuis les assets
Image.asset('assets/images/logo.png')

// Image depuis internet
Image.network('https://example.com/image.jpg')

// Image avec contrôle de taille
Image.asset(
  'assets/images/photo.jpg',
  width: 200,
  height: 150,
  fit: BoxFit.cover,  // Comment remplir l'espace
)

// Image avec gestion d'erreur
Image.network(
  'url',
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.error);
  },
)
```

**BoxFit types** :
- `cover` : Remplit tout l'espace, peut rogner l'image
- `contain` : Image entière visible, peut laisser des espaces vides
- `fill` : Étire l'image pour remplir l'espace (déformation possible)
- `fitWidth` / `fitHeight` : Ajuste selon la largeur/hauteur
- `none` : Taille originale de l'image

---

### CircleAvatar
Avatar circulaire.

```dart
CircleAvatar(
  radius: 40,
  backgroundImage: AssetImage('assets/images/avatar.jpg'),
)

CircleAvatar(
  radius: 30,
  backgroundColor: Colors.blue,
  child: Text('AB'),  // Initiales
)
```

---

### ClipRRect
Arrondit les coins d'un widget.

```dart
ClipRRect(
  borderRadius: BorderRadius.circular(10),
  child: Image.network('url'),
)

ClipRRect(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
  child: Container(color: Colors.blue),
)
```

---

## ⏳ Widgets de chargement et d'erreur

### CircularProgressIndicator
Roue de chargement circulaire.

```dart
CircularProgressIndicator()

CircularProgressIndicator(
  value: 0.7,  // Progression de 70%
  backgroundColor: Colors.grey,
  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
)
```

---

### LinearProgressIndicator
Barre de progression linéaire.

```dart
LinearProgressIndicator()

LinearProgressIndicator(
  value: 0.5,  // 50%
  backgroundColor: Colors.grey[300],
  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
)
```

---

### SnackBar
Notification temporaire en bas de l'écran.

```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('Action effectuée'),
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      label: 'Annuler',
      onPressed: () {
        // Action
      },
    ),
  ),
)
```

---

## 🏛️ Types de widgets

### StatelessWidget
Widget **immuable** qui ne change jamais une fois construit.

```dart
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Je ne change jamais');
  }
}
```

**Quand l'utiliser** :
- Pour des widgets statiques (textes fixes, icônes, layouts)
- Quand les données ne changent pas après la construction
- Meilleure performance que StatefulWidget

---

### StatefulWidget
Widget **mutable** qui peut changer au fil du temps.

```dart
class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $count'),
        ElevatedButton(
          onPressed: increment,
          child: Text('Increment'),
        ),
      ],
    );
  }
}
```

**Quand l'utiliser** :
- Quand les données changent suite à une interaction utilisateur
- Quand tu as besoin de `setState()`
- Pour des animations, formulaires, compteurs, etc.

**Lifecycle** (cycle de vie) :
1. `createState()` : Crée l'état
2. `initState()` : Appelé une fois au début (init des données)
3. `build()` : Construit l'UI (appelé après chaque setState)
4. `dispose()` : Nettoyage quand le widget est détruit

---

## 🎯 Concepts Dart

### Lambda function (fonction anonyme)
Fonction sans nom, souvent utilisée pour les callbacks.

```dart
// Syntaxe complète
onPressed: () {
  print('Cliqué');
  count++;
}

// Syntaxe courte (une seule instruction)
onPressed: () => print('Cliqué')

// Avec paramètres
items.map((item) => Text(item))

// Équivalent avec fonction nommée
void handlePress() {
  print('Cliqué');
}
onPressed: handlePress
```

**Pourquoi** : Pratique pour des fonctions courtes utilisées une seule fois.

---

### Spread operator (`...`)
"Décompresse" une collection pour en étaler les éléments.

```dart
// Sans spread
List<int> numbers = [1, 2, 3];
List<int> moreNumbers = [numbers, 4, 5];  // [[1,2,3], 4, 5] ❌

// Avec spread
List<int> moreNumbers = [...numbers, 4, 5];  // [1, 2, 3, 4, 5] ✅

// Dans un widget
Column(
  children: [
    Text('Titre'),
    ...items.map((item) => Text(item)),  // Décompresse tous les Text
    Text('Fin'),
  ],
)
```

**Sans spread** :
```dart
Column(
  children: [
    Text('Titre'),
    items.map((item) => Text(item)),  // ❌ Erreur : map() retourne un Iterable
    Text('Fin'),
  ],
)
```

**Avec spread** :
```dart
Column(
  children: [
    Text('Titre'),
    ...items.map((item) => Text(item)),  // ✅ Décompresse les Text individuels
    Text('Fin'),
  ],
)
```

---

### Null safety (`?`, `!`, `??`)
Gestion des valeurs nulles en Dart.

```dart
// Type nullable (peut être null)
String? name;  // Peut être null
name = null;   // OK
name = 'John'; // OK

// Type non-nullable (ne peut PAS être null)
String name;   // Ne peut PAS être null
name = 'John'; // OK
name = null;   // ❌ Erreur

// Opérateur ?? (valeur par défaut si null)
String name = userName ?? 'Anonyme';

// Opérateur ?. (appel sûr)
int? length = name?.length;  // null si name est null

// Opérateur ! (assertion non-null)
String name = nullableName!;  // ⚠️ Crash si nullableName est null

// if null check
if (name != null) {
  print(name.length);  // Ici Dart sait que name n'est pas null
}
```

**Bonnes pratiques** :
- Évite `!` sauf si tu es 100% sûr
- Préfère `?.` et `??` pour la sécurité
- Utilise `required` pour les paramètres obligatoires

---

### Cascade operator (`..`)
Permet d'appeler plusieurs méthodes sur le même objet.

```dart
// Sans cascade
var button = ElevatedButton(onPressed: () {});
button.style;
button.onPressed;

// Avec cascade
var paint = Paint()
  ..color = Colors.red
  ..strokeWidth = 5.0
  ..style = PaintingStyle.stroke;

// Équivalent sans cascade
var paint = Paint();
paint.color = Colors.red;
paint.strokeWidth = 5.0;
paint.style = PaintingStyle.stroke;
```

---

### String interpolation
Insérer des variables dans une chaîne.

```dart
String name = 'John';
int age = 25;

// Avec $
String message = 'Je m\'appelle $name';

// Avec ${} pour des expressions
String message = 'J\'ai ${age + 5} ans dans 5 ans';
String url = 'https://example.com/${movie.id}';

// Équivalent sans interpolation (lourd)
String message = 'Je m\'appelle ' + name;
String message = 'J\'ai ' + (age + 5).toString() + ' ans';
```

---

### Ternary operator (`? :`)
If-else compact en une ligne.

```dart
// Syntaxe : condition ? siVrai : siFaux

String status = age >= 18 ? 'Majeur' : 'Mineur';

// Équivalent avec if-else
String status;
if (age >= 18) {
  status = 'Majeur';
} else {
  status = 'Mineur';
}

// Dans un widget
Icon(
  isFavorite ? Icons.favorite : Icons.favorite_border,
  color: isFavorite ? Colors.red : null,
)
```

---

### `.map()`
Transforme chaque élément d'une collection.

```dart
List<int> numbers = [1, 2, 3];

// Transformer en multipliant par 2
List<int> doubled = numbers.map((n) => n * 2).toList();
// Résultat : [2, 4, 6]

// Transformer en widgets
List<String> names = ['Alice', 'Bob', 'Charlie'];
List<Widget> widgets = names.map((name) => Text(name)).toList();

// Sans .toList() : retourne un Iterable (pas une List)
var iterable = names.map((name) => Text(name));  // Lazy (pas encore calculé)
var list = names.map((name) => Text(name)).toList();  // Eager (calculé immédiatement)
```

**Autres méthodes utiles** :
- `.where()` : Filtre
- `.reduce()` : Réduit à une seule valeur
- `.forEach()` : Boucle sur chaque élément
- `.any()` : Vérifie si au moins un élément correspond
- `.every()` : Vérifie si tous les éléments correspondent

```dart
// .where() - Filtre
List<int> numbers = [1, 2, 3, 4, 5];
List<int> evens = numbers.where((n) => n % 2 == 0).toList();
// [2, 4]

// .any() - Au moins un
bool hasEven = numbers.any((n) => n % 2 == 0);  // true

// .every() - Tous
bool allPositive = numbers.every((n) => n > 0);  // true
```

---

### `as` (cast / conversion de type)
Convertit un type en un autre.

```dart
// Cast depuis Object vers String
Object data = 'Hello';
String text = data as String;

// Cast depuis dynamic
dynamic value = 42;
int number = value as int;

// Dans le parsing JSON
Map<String, dynamic> json = {'title': 'Film'};
String title = json['title'] as String;

// ⚠️ Crash si le type est incorrect
Object data = 123;
String text = data as String;  // ❌ Exception !

// Alternative plus sûre avec 'is'
if (data is String) {
  String text = data;  // Pas besoin de 'as', Dart sait que c'est un String
}
```

---

### `required`, `final`, `const`

#### `required`
Paramètre obligatoire dans un constructeur.

```dart
class User {
  final String name;
  final int age;

  User({
    required this.name,  // Obligatoire
    required this.age,   // Obligatoire
  });
}

// ✅ OK
User(name: 'John', age: 25);

// ❌ Erreur : manque 'age'
User(name: 'John');
```

#### `final`
Variable qui ne peut être assignée qu'une seule fois.

```dart
final String name = 'John';
name = 'Bob';  // ❌ Erreur

final List<int> numbers = [1, 2, 3];
numbers.add(4);  // ✅ OK (on modifie le contenu, pas la variable)
numbers = [5, 6];  // ❌ Erreur (on ne peut pas réassigner)
```

#### `const`
Valeur **compile-time constant** (connue à la compilation).

```dart
const String apiUrl = 'https://api.example.com';
const int maxItems = 100;

const List<int> numbers = [1, 2, 3];
numbers.add(4);  // ❌ Erreur : liste immuable

// const dans les widgets (optimisation)
const Text('Hello')  // Réutilisé, pas recréé
Text('Hello')        // Recréé à chaque build
```

**Différence final vs const** :
- `final` : Valeur assignée au runtime, peut dépendre de variables
- `const` : Valeur connue à la compilation, complètement immuable

---

### Getters
Propriété calculée qui se comporte comme une variable.

```dart
class Movie {
  final String posterPath;

  // Getter
  String get fullPosterUrl {
    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  // Ou en syntaxe courte
  String get fullPosterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
}

// Utilisation (comme une propriété)
String url = movie.fullPosterUrl;  // Pas de ()
```

**Avantages** :
- Syntaxe plus propre (pas de parenthèses)
- Peut contenir de la logique
- Calculé à chaque accès (toujours à jour)

---

## 📦 Collections Dart

### List
Liste ordonnée d'éléments (tableau).

```dart
// Création
List<int> numbers = [1, 2, 3, 4, 5];
List<String> names = ['Alice', 'Bob', 'Charlie'];
var mixedList = [1, 'text', true];  // Type dynamic (à éviter)

// Accès
int first = numbers[0];      // 1
int last = numbers[numbers.length - 1];  // 5

// Modification
numbers.add(6);              // [1, 2, 3, 4, 5, 6]
numbers.insert(0, 0);        // [0, 1, 2, 3, 4, 5, 6]
numbers.remove(3);           // [0, 1, 2, 4, 5, 6]
numbers.removeAt(0);         // [1, 2, 4, 5, 6]

// Propriétés
int length = numbers.length;
bool isEmpty = numbers.isEmpty;
bool isNotEmpty = numbers.isNotEmpty;

// Méthodes utiles
numbers.clear();             // Vide la liste
bool contains = numbers.contains(2);
int index = numbers.indexOf(4);
List<int> sublist = numbers.sublist(1, 3);  // [2, 3]
```

---

### Set
Collection **sans doublons** et **non ordonnée**.

```dart
// Création
Set<int> numbers = {1, 2, 3, 4, 5};
Set<String> favorites = {};  // Set vide

// Ajout (pas de doublons !)
favorites.add('Film 1');
favorites.add('Film 2');
favorites.add('Film 1');  // Ignoré, déjà présent
// Résultat : {'Film 1', 'Film 2'}

// Suppression
favorites.remove('Film 1');

// Vérification
bool hasFavorite = favorites.contains('Film 1');

// Conversion
List<String> favList = favorites.toList();
Set<String> favSet = favList.toSet();
```

**Quand utiliser Set vs List** :
- **Set** : Pas de doublons, vérification rapide (`contains`)
- **List** : Ordre important, accès par index

---

### Map
Collection de paires **clé-valeur** (comme un dictionnaire).

```dart
// Création
Map<String, int> ages = {
  'Alice': 25,
  'Bob': 30,
  'Charlie': 35,
};

Map<String, dynamic> user = {
  'name': 'John',
  'age': 25,
  'isAdmin': false,
};

// Accès
int aliceAge = ages['Alice']!;  // 25
String? name = user['name'] as String?;

// Modification
ages['Alice'] = 26;          // Modification
ages['David'] = 40;          // Ajout
ages.remove('Bob');          // Suppression

// Vérification
bool hasAlice = ages.containsKey('Alice');
bool hasAge30 = ages.containsValue(30);

// Itération
ages.forEach((key, value) {
  print('$key a $value ans');
});

// Propriétés
int length = ages.length;
Iterable<String> keys = ages.keys;      // ['Alice', 'Charlie', 'David']
Iterable<int> values = ages.values;     // [26, 35, 40]
```

**Map dans les TPs** :
```dart
// Structure de quiz
Map<String, Object> question = {
  'question': 'Quel langage ?',
  'answers': [
    {'text': 'Dart', 'isCorrect': true},
    {'text': 'Java', 'isCorrect': false},
  ],
};

String questionText = question['question'] as String;
List<Map<String, Object>> answers = question['answers'] as List<Map<String, Object>>;
```

---

## ⏱️ Programmation asynchrone

### Future
Représente une valeur qui sera disponible **dans le futur**.

```dart
// Future qui se complète après 2 secondes
Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () {
    return 'Données chargées';
  });
}

// Utilisation avec .then()
fetchData().then((data) {
  print(data);  // 'Données chargées' après 2s
});
```

**États d'un Future** :
- **Uncompleted** : En cours
- **Completed with value** : Terminé avec succès
- **Completed with error** : Terminé avec erreur

---

### async / await
Syntaxe moderne pour gérer les Futures.

```dart
// Fonction asynchrone
Future<List<Movie>> loadMovies() async {
  // Attend que les données soient chargées
  final data = await rootBundle.loadString('assets/data/movies.json');
  final List<dynamic> jsonList = json.decode(data);
  return jsonList.map((json) => Movie.fromJson(json)).toList();
}

// Utilisation
void initMovies() async {
  try {
    List<Movie> movies = await loadMovies();
    print('Chargé ${movies.length} films');
  } catch (e) {
    print('Erreur : $e');
  }
}
```

**async** : Dit que la fonction est asynchrone et retourne un Future
**await** : Attend qu'un Future se complète avant de continuer

**Sans async/await (équivalent avec .then())** :
```dart
void initMovies() {
  loadMovies().then((movies) {
    print('Chargé ${movies.length} films');
  }).catchError((e) {
    print('Erreur : $e');
  });
}
```

---

### try / catch / finally
Gestion des erreurs.

```dart
try {
  // Code qui peut échouer
  final result = await fetchData();
  print(result);
} catch (e) {
  // Gérer l'erreur
  print('Erreur : $e');
} finally {
  // Toujours exécuté (même si erreur)
  print('Terminé');
}

// Capturer différents types d'erreurs
try {
  final result = await fetchData();
} on FormatException catch (e) {
  print('Erreur de format : $e');
} on NetworkException catch (e) {
  print('Erreur réseau : $e');
} catch (e) {
  print('Autre erreur : $e');
}
```

---

### FutureBuilder
Widget qui reconstruit l'UI en fonction de l'état d'un Future.

```dart
FutureBuilder<List<Movie>>(
  future: movieService.loadMovies(),
  builder: (context, snapshot) {
    // En cours de chargement
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }

    // Erreur
    if (snapshot.hasError) {
      return Text('Erreur : ${snapshot.error}');
    }

    // Succès
    if (snapshot.hasData) {
      List<Movie> movies = snapshot.data!;
      return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) => Text(movies[index].title),
      );
    }

    // Cas par défaut
    return SizedBox();
  },
)
```

**ConnectionState** :
- `none` : Pas encore démarré
- `waiting` : En cours
- `active` : Stream actif (pour StreamBuilder)
- `done` : Terminé

---

## 🔄 Gestion d'état

### setState()
Met à jour l'état d'un StatefulWidget et redessine l'UI.

```dart
class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  void increment() {
    setState(() {
      count++;  // Modifie l'état
    });
    // L'UI se redessine automatiquement
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $count'),
        ElevatedButton(
          onPressed: increment,
          child: Text('+'),
        ),
      ],
    );
  }
}
```

**⚠️ Règles importantes** :
- Ne jamais modifier l'état sans `setState()`
- Tout le code qui modifie l'état doit être dans `setState(() { ... })`
- Ne pas appeler `setState()` pendant `build()`

**Sans setState** :
```dart
void increment() {
  count++;  // ❌ L'UI ne se met pas à jour !
}
```

---

### initState()
Appelé UNE SEULE FOIS quand le widget est créé.

```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();  // ⚠️ Toujours appeler super.initState()

    // Initialisation
    loadMovies();
    print('Widget créé');
  }

  Future<void> loadMovies() async {
    final loadedMovies = await movieService.getMovies();
    setState(() {
      movies = loadedMovies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) => Text(movies[index].title),
    );
  }
}
```

**Quand utiliser** :
- Charger des données au démarrage
- Initialiser des controllers (TextEditingController, etc.)
- Abonnements à des streams
- Timer, animations

---

### dispose()
Appelé quand le widget est détruit. Utilisé pour nettoyer les ressources.

```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late TextEditingController controller;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      print('Tick');
    });
  }

  @override
  void dispose() {
    controller.dispose();  // Libère la mémoire
    timer.cancel();        // Arrête le timer
    super.dispose();       // ⚠️ Toujours appeler super.dispose()
  }

  @override
  Widget build(BuildContext context) {
    return TextField(controller: controller);
  }
}
```

**À nettoyer dans dispose()** :
- TextEditingController
- AnimationController
- StreamSubscription
- Timer
- Listeners

---

## 🧭 Navigation

### Navigator.push()
Navigue vers une nouvelle page.

```dart
// Navigation simple
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SecondPage(),
  ),
);

// Avec paramètres
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailPage(movie: selectedMovie),
  ),
);
```

---

### Navigator.pop()
Retourne à la page précédente.

```dart
// Retour simple
Navigator.pop(context);

// Retour avec une valeur
Navigator.pop(context, 'Résultat');

// Recevoir la valeur
final result = await Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondPage()),
);
print(result);  // 'Résultat'
```

---

### MaterialPageRoute
Définit la transition entre pages (style Material Design).

```dart
MaterialPageRoute(
  builder: (context) => NewPage(),
  fullscreenDialog: true,  // Affiche en modal
)
```

---

### Routes nommées
Alternative à MaterialPageRoute pour gérer les routes centralement.

```dart
// Dans MaterialApp
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomePage(),
    '/details': (context) => DetailsPage(),
    '/settings': (context) => SettingsPage(),
  },
)

// Navigation
Navigator.pushNamed(context, '/details');
Navigator.pushNamed(context, '/settings', arguments: {'theme': 'dark'});

// Recevoir les arguments
class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Text('Theme: ${args['theme']}');
  }
}
```

---

## 📄 Parsing et sérialisation

### JSON parsing
Convertir du JSON en objets Dart.

```dart
import 'dart:convert';

// JSON string vers Map
String jsonString = '{"name": "John", "age": 25}';
Map<String, dynamic> jsonMap = json.decode(jsonString);

String name = jsonMap['name'];  // 'John'
int age = jsonMap['age'];       // 25

// JSON array vers List
String jsonArray = '[{"name": "Alice"}, {"name": "Bob"}]';
List<dynamic> jsonList = json.decode(jsonArray);

// Map vers JSON string
Map<String, dynamic> data = {'name': 'John', 'age': 25};
String jsonString = json.encode(data);
// '{"name":"John","age":25}'
```

---

### Factory constructor (fromJson)
Méthode pour créer un objet depuis JSON.

```dart
class Movie {
  final int id;
  final String title;
  final String overview;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
  });

  // Factory constructor
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'] ?? 'Sans titre',
      overview: json['overview'] ?? '',
    );
  }

  // Méthode inverse : objet vers JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
    };
  }
}

// Utilisation
String jsonString = '{"id": 1, "title": "Inception", "overview": "..."}';
Map<String, dynamic> jsonMap = json.decode(jsonString);
Movie movie = Movie.fromJson(jsonMap);

// Liste de films
List<dynamic> jsonList = json.decode(jsonArray);
List<Movie> movies = jsonList.map((json) => Movie.fromJson(json)).toList();
```

---

## 🌐 Réseau et API

### Dio
Package pour les requêtes HTTP (plus puissant que `http`).

```dart
import 'package:dio/dio.dart';

final dio = Dio();

// GET request
Future<List<Movie>> getMovies() async {
  try {
    final response = await dio.get('https://api.example.com/movies');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['results'];
      return data.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Erreur ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Erreur réseau : $e');
  }
}

// GET avec paramètres
final response = await dio.get(
  'https://api.example.com/movies',
  queryParameters: {
    'api_key': 'YOUR_KEY',
    'language': 'fr-FR',
    'page': 1,
  },
);

// POST request
final response = await dio.post(
  'https://api.example.com/users',
  data: {
    'name': 'John',
    'email': 'john@example.com',
  },
);
```

**Status codes HTTP** :
- `200` : OK (succès)
- `201` : Created (ressource créée)
- `400` : Bad Request (requête invalide)
- `401` : Unauthorized (non authentifié)
- `404` : Not Found (ressource non trouvée)
- `500` : Internal Server Error (erreur serveur)

---

### rootBundle (chargement d'assets)
Charger des fichiers depuis les assets.

```dart
import 'package:flutter/services.dart';

// Charger un fichier texte/JSON
Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/data/movies.json');
}

// Utilisation
Future<List<Movie>> loadLocalMovies() async {
  final data = await rootBundle.loadString('assets/data/movies.json');
  final List<dynamic> jsonList = json.decode(data);
  return jsonList.map((json) => Movie.fromJson(json)).toList();
}
```

---

### url_launcher
Ouvrir des URLs (sites web, emails, téléphone).

```dart
import 'package:url_launcher/url_launcher.dart';

// Ouvrir un site web
Future<void> openWebsite() async {
  final url = Uri.parse('https://flutter.dev');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  }
}

// Ouvrir un email
await launchUrl(Uri.parse('mailto:contact@example.com'));

// Appeler un numéro
await launchUrl(Uri.parse('tel:+33123456789'));
```

---

### share_plus
Partager du contenu.

```dart
import 'package:share_plus/share_plus.dart';

// Partager du texte
Share.share('Découvrez mon app Flutter !');

// Partager avec subject (pour email)
Share.share(
  'Contenu à partager',
  subject: 'Sujet du partage',
);

// Partager un fichier
Share.shareXFiles([XFile('/path/to/image.jpg')]);
```

---

## ✅ Bonnes pratiques

### Nommage

```dart
// Classes : PascalCase
class MovieService {}
class UserProfilePage {}

// Variables, fonctions : camelCase
int userAge = 25;
void loadMovies() {}

// Constantes : camelCase (pas SCREAMING_CASE comme en Java)
const String apiUrl = 'https://api.example.com';

// Fichiers : snake_case
// movie_service.dart
// user_profile_page.dart
```

---

### Organisation des fichiers

```
lib/
├── main.dart
├── models/
│   ├── movie.dart
│   └── user.dart
├── services/
│   ├── movie_service.dart
│   └── auth_service.dart
├── pages/
│   ├── home_page.dart
│   ├── detail_page.dart
│   └── settings_page.dart
└── widgets/
    ├── movie_card.dart
    └── custom_button.dart
```

---

### Imports

```dart
// Packages Flutter en premier
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Packages tiers ensuite
import 'package:dio/dio.dart';
import 'package:share_plus/share_plus.dart';

// Imports relatifs en dernier
import '../models/movie.dart';
import '../services/movie_service.dart';
```

---

### const partout où possible

```dart
// ✅ Bon : réutilisation, performance
const Text('Hello')
const SizedBox(height: 20)
const Icon(Icons.home)

// ❌ À éviter : recréé à chaque build
Text('Hello')
SizedBox(height: 20)
Icon(Icons.home)
```

---

### Éviter les nombres magiques

```dart
// ❌ Mauvais
Container(height: 56)
Padding(padding: EdgeInsets.all(16))

// ✅ Bon
class AppConstants {
  static const double appBarHeight = 56.0;
  static const double defaultPadding = 16.0;
}

Container(height: AppConstants.appBarHeight)
Padding(padding: EdgeInsets.all(AppConstants.defaultPadding))
```

---

### Extraire des widgets

```dart
// ❌ Mauvais : tout dans build()
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        Container(
          // 50 lignes de code...
        ),
        Container(
          // 50 lignes de code...
        ),
      ],
    ),
  );
}

// ✅ Bon : widgets séparés
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        _buildHeader(),
        _buildContent(),
      ],
    ),
  );
}

Widget _buildHeader() {
  return Container(
    // ...
  );
}

Widget _buildContent() {
  return Container(
    // ...
  );
}

// ✅ Encore mieux : widget réutilisable
class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(/* ... */);
  }
}
```

---

## 🎓 Ressources utiles

### Documentation officielle
- **Flutter** : https://docs.flutter.dev/
- **Dart** : https://dart.dev/guides
- **Widget Catalog** : https://docs.flutter.dev/ui/widgets
- **Cookbook** : https://docs.flutter.dev/cookbook

### Packages
- **pub.dev** : https://pub.dev/ (tous les packages Flutter/Dart)
- **Dio** : https://pub.dev/packages/dio
- **share_plus** : https://pub.dev/packages/share_plus
- **url_launcher** : https://pub.dev/packages/url_launcher

### Apprendre
- **Widget of the Week** : https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG
- **Flutter Codelabs** : https://docs.flutter.dev/codelabs
- **DartPad** : https://dartpad.dev/ (tester du code Dart en ligne)

### Design
- **Material Design** : https://m3.material.io/
- **Icons** : https://fonts.google.com/icons
- **Colors** : https://m3.material.io/styles/color/system/overview

---

**💡 Astuce** : Garde ce cheatsheet ouvert pendant tes TPs et utilise Ctrl+F / Cmd+F pour rechercher rapidement un widget ou concept !
