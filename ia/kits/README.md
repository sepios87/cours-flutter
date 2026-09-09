# Kits à installer par les étudiants

Télécharge le dossier correspondant à ton outil et copie son contenu à la racine de chacun de tes projets Flutter, en conservant les sous-dossiers cachés.

| Outil | Dossier à télécharger | Emplacement final |
| --- | --- | --- |
| Codex | [codex](codex) | `mon-projet/AGENTS.md` |
| Claude Code | [claude](claude) | `mon-projet/.claude/rules/tuteur-flutter.md` |
| Gemini CLI | [gemini](gemini) | `mon-projet/GEMINI.md` |
| GitHub Copilot | [copilot](copilot) | `mon-projet/.github/copilot-instructions.md` |

## Installation par commande

Depuis la racine de ce dépôt, remplace `/chemin/vers/mon-projet` puis exécute une seule commande :

```sh
sh ia/kits/install.sh codex /chemin/vers/mon-projet
sh ia/kits/install.sh claude /chemin/vers/mon-projet
sh ia/kits/install.sh gemini /chemin/vers/mon-projet
sh ia/kits/install.sh copilot /chemin/vers/mon-projet
```

La commande s'arrête si le fichier existe déjà afin de ne pas écraser une règle personnelle. Après vérification, ajoute `--force` à la fin uniquement si tu veux la remplacer.

Ferme puis relance le chat ou la CLI après la copie. Dans Claude Code, `/context` permet de vérifier que la règle est chargée ; dans Gemini CLI, utilise `/memory reload`.

Ces fichiers guident l'assistant dans le projet où ils sont placés. Ils ne s'appliquent pas à un chat web externe qui n'ouvre pas le dépôt.
