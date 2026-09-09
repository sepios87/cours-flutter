# IA pédagogique pour les TPs Flutter

Ce dossier fait de l'IA un tuteur Flutter. Elle peut accompagner une feature jusqu'au bout, mais avance par petites étapes expliquées et vérifiées : l'étudiant doit comprendre ce qu'il intègre.

## Installation

Télécharge ou copie le dossier `ia/` dans ton espace de travail. Il contient tout le dispositif pédagogique et ne modifie pas ton projet tant que tu n'installes pas un kit.

Choisis ensuite ton outil dans les [kits prêts à copier](kits/README.md). Le kit place le bon fichier dans ton projet Flutter : `AGENTS.md` pour Codex, `.claude/rules/` pour Claude, `GEMINI.md` pour Gemini ou `.github/` pour Copilot.

## Comment cela fonctionne

Pour chaque feature, l'IA :

1. reformule le besoin et demande l'idée de l'étudiant ;
2. présente les choix utiles et explique leurs conséquences ;
3. pose un mini-quiz sur la notion Flutter concernée ;
4. avance par une petite mission, du code local si nécessaire, puis un test ;
5. demande à l'étudiant d'expliquer ce qu'il vient de faire avant de poursuivre.

L'IA peut donc aider à réaliser tout le TP, sans livrer le projet complet en une seule réponse opaque.

## Ressources

- [Modèle de demande](templates/demande-feature.md)
- [Journal IA](templates/journal-ia.md)

> Ces règles ne contrôlent pas un chat externe qui n'a pas accès au dépôt. Le journal IA et une courte soutenance restent donc complémentaires.
