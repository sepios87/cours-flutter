# 📘 Guide – Structure des TPs Flutter

Bienvenue dans l'arène ! Ce document explique **comment seront organisés tous les TPs Flutter** du module.
Chaque TP suit une structure identique pour vous permettre de progresser étape par étape vers un projet complet.

**Spoiler alert** : À la fin de ce module, vous serez capables de build votre propre app. Oui oui, une vraie.

---

## 🧱 Structure générale d’un TP

Chaque TP est présenté sous la forme d’un document contenant les sections suivantes :

### 1. **Titre et description**
Exemple :
```markdown
# 🧱 TP1 – Carte de profil interactive
```
Le titre indique le numéro du TP et le sujet (assez logique jusque là).
Une brève description et des **objectifs pédagogiques** vous indiquent ce que vous allez apprendre (oui, vraiment apprendre, pas juste copier-coller).

---

### 2. **🎯 Objectifs**
Cette section liste les **compétences et notions Flutter** travaillées :
- Les widgets ou concepts abordés
- Les fonctionnalités à mettre en place (ce qui va impressionner votre grand-mère)
- L'objectif d'apprentissage global : UI, navigation, data, etc.

---

### 3. **🕐 Durée estimée**
Indique le **temps moyen** prévu pour réaliser le TP.
Vous pouvez prendre plus ou moins de temps selon votre rythme (et le nombre de cafés consommés).

Chaque TP devra être rendu au début du TP suivant. ⏰ Oui, c'est une deadline, pas une suggestion optimiste.

---

### 4. **🪜 Étapes**
Les étapes sont numérotées et décrivent **le déroulé du travail à effectuer**.  
Chaque étape contient :
- une explication simple de l’objectif (ex : “Créer un nouveau projet”)
- parfois un **exemple de code** à reproduire ou adapter
- des ✅ **indications de validation** pour vérifier que votre code fonctionne

> ⚠️ Les exemples de code sont là pour vous guider, **pas pour être copiés à la lettre**.  
> Vous pouvez (et devez) personnaliser le code à travers le style, les couleurs, les textes, etc.

---

### 5. **✅ Objectif final**
Cette partie résume **le rendu attendu à la fin du TP** (la ligne d'arrivée, le graal, le moment où vous pourrez enfin souffler) :
quelles fonctionnalités doivent être présentes et ce que l'application doit faire.

---

### 6. **💾 Rendu attendu**
Cette section indique :
- le **nom du projet Flutter** à rendre (ex : `tp1_nom_prenom`)
- les **fichiers ou captures** à déposer (souvent une capture d’écran + projet complet)
- le **format du rendu** (GitHub, Moodle, archive ZIP, etc.)

---

### 7. **🧮 Barème de notation**
Chaque TP est noté sur **20 points** 
Le barème est présenté sous forme de tableau avec plusieurs critères d'évaluation en fonction du projet. Par exemple sur :
- structure du projet 
- respect des consignes techniques 
- qualité du design
- interaction et fonctionnement
- créativité, propreté du code, etc. (les variables `a`, `b`, `c` ne sont pas vos amies)

---

### 8. **🎁 Bonus**
Chaque TP comporte **jusqu'à 2 points bonus**.  
Ces bonus sont des **défis facultatifs** permettant d'aller plus loin (et de briller en société).

> 💡 Les bonus **n'ont pas d'instructions détaillées** : ils sont volontairement ouverts (oui, c'est fait exprès).
> Vous devez chercher par vous-même comment les réaliser à partir des notions vues en cours ou à partir de recherches et de la documentation.
> C'est là qu'on sépare les ninjas des simples mortels.
> Exemple : "Ajouter un mode sombre avec `ThemeData`" ou "Mettre en place un partage sur les réseaux".
> Conseil de pro : Stack Overflow et la doc Flutter sont vos meilleurs alliés ici.

---

### 9. **💡 Conseils**
À la fin de chaque TP, quelques astuces sont proposées :
- conseils de bonnes pratiques Flutter  
- gestion des erreurs fréquentes  
- pistes pour améliorer votre projet ou aller plus loin

---

## 📅 Organisation d'une séance de TP

Chaque séance de TP suit le déroulé suivant :

### 🎬 **Début de séance (20-30 minutes)**

1. **Présentation des TPs précédents** (10-15 min)
   - 2 étudiants tirés au sort présentent leur TP précédent devant la classe
   - Présentation de 5 minutes maximum par étudiant
   - Objectif : partager les solutions, apprendre des autres, s'entraîner à présenter son travail

2. **Widget of the Week** (10-15 min)
   - Visionnage collectif de 2 vidéos "Widget of the Week" de Flutter
   - Discussion rapide sur les widgets présentés et leurs cas d'usage
   - Ces vidéos courtes (1-2 min chacune) présentent des widgets utiles pour vos TPs
   - Playlist : https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG

### 💻 **Pendant le TP**

- **Règle des 10 minutes** : Si vous êtes bloqué sur un problème pendant plus de 10 minutes, appelez l'enseignant
  - Ne restez JAMAIS bloqué en silence
  - Expliquez ce que vous avez déjà essayé
- Utilisez les ressources : documentation Flutter, Stack Overflow, vos camarades

### 🏁 **Fin de séance (5-10 minutes)**

- **Checkpoint collectif** : "Est-ce que tout est OK ?"
- Questions/réponses sur les difficultés rencontrées
- Rappel des délais de rendu

---

## 📆 Planning des séances

Le module est organisé en **7 séances d'environ 2h30 (soit 17h30)** :

| Séance | Contenu | Description |
|--------|---------|-------------|
| **Séance 1** | Présentation + TP0 | Installation et configuration de l'environnement |
| **Séance 2** | TP1 | Introduction aux concepts de base |
| **Séance 3** | TP2 | Navigation et gestion d'état |
| **Séance 4** | TP3 | Formulaires et stockage local |
| **Séance 5** | TP4 | Consommation d'API et affichage de données |
| **Séances 6** | TP5 - Développement projet | Travail sur le projet final en binôme |
| **Séance 7** | TP5 - Finalisation + démo | Dernières touches et présentation des projets finaux |

> 💡 **Rappel** : Chaque TP doit être rendu au début de la séance suivante. Organisez-vous en conséquence !

---

## 🧰 Bonnes pratiques à suivre dans tous les TPs

- Toujours nommer vos projets `tpX_nom_prenom`
- Bien commenter votre code pour expliquer vos choix (votre futur vous dans 2 semaines vous remerciera)
- Tester sur **un vrai téléphone** quand c'est possible
- Respecter la **structure Flutter standard** (`lib/`, `assets/`, etc.)
- Ne pas laisser de code inutilisé ou de variables non nommées clairement
- **⏱️ Règle des 10 minutes** : Bloqué ? Appelez l'enseignant ! Ne perdez pas de temps à tourner en rond
