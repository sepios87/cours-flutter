#!/usr/bin/env sh

set -eu

usage() {
  printf '%s\n' "Usage : sh ia/kits/install.sh {codex|claude|gemini|copilot} /chemin/vers/projet [--force]"
  exit 64
}

[ "$#" -ge 2 ] || usage

tool="$1"
project="$2"
force="${3:-}"

[ -d "$project" ] || {
  printf '%s\n' "Erreur : le projet n'existe pas : $project" >&2
  exit 66
}

case "$tool" in
  codex)
    source_file="ia/kits/codex/AGENTS.md"
    target_file="$project/AGENTS.md"
    ;;
  claude)
    source_file="ia/kits/claude/.claude/rules/tuteur-flutter.md"
    target_file="$project/.claude/rules/tuteur-flutter.md"
    ;;
  gemini)
    source_file="ia/kits/gemini/GEMINI.md"
    target_file="$project/GEMINI.md"
    ;;
  copilot)
    source_file="ia/kits/copilot/.github/copilot-instructions.md"
    target_file="$project/.github/copilot-instructions.md"
    ;;
  *)
    usage
    ;;
esac

[ -f "$source_file" ] || {
  printf '%s\n' "Erreur : lance cette commande depuis la racine du dépôt du cours." >&2
  exit 66
}

if [ -e "$target_file" ] && [ "$force" != "--force" ]; then
  printf '%s\n' "Arrêt : $target_file existe déjà. Vérifie son contenu ou relance avec --force." >&2
  exit 73
fi

mkdir -p "$(dirname "$target_file")"
cp "$source_file" "$target_file"
printf '%s\n' "Installé : $target_file"
printf '%s\n' "Relance ensuite ton chat ou ta CLI pour charger la règle."
