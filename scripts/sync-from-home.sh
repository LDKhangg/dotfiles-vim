#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HOME_DIR="${HOME}"

copy_file() {
  local src="$1"
  local dest="$2"

  mkdir -p "$(dirname "$dest")"
  cp "$src" "$dest"
}

copy_dir() {
  local src="$1"
  local dest="$2"

  mkdir -p "$(dirname "$dest")"
  rm -rf "$dest"
  cp -a "$src" "$dest"
}

copy_dir "$HOME_DIR/.config/nvim" "$REPO_ROOT/.config/nvim"
copy_file "$HOME_DIR/.ideavimrc" "$REPO_ROOT/.ideavimrc"
copy_file \
  "$HOME_DIR/.config/JetBrains/IntelliJIdea2026.1/options/editor.xml" \
  "$REPO_ROOT/.config/JetBrains/IntelliJIdea2026.1/options/editor.xml"
copy_file \
  "$HOME_DIR/.config/JetBrains/IntelliJIdea2026.1/options/vim_settings.xml" \
  "$REPO_ROOT/.config/JetBrains/IntelliJIdea2026.1/options/vim_settings.xml"
copy_file \
  "$HOME_DIR/.config/JetBrains/IntelliJIdea2026.1/keymaps/GNOME Proper Redo.xml" \
  "$REPO_ROOT/.config/JetBrains/IntelliJIdea2026.1/keymaps/GNOME Proper Redo.xml"

printf 'Synced dotfiles from %s into %s\n' "$HOME_DIR" "$REPO_ROOT"
