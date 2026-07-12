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

copy_dir "$REPO_ROOT/.config/nvim" "$HOME_DIR/.config/nvim"
copy_file "$REPO_ROOT/.ideavimrc" "$HOME_DIR/.ideavimrc"
copy_file \
  "$REPO_ROOT/.config/JetBrains/IntelliJIdea2026.1/options/editor.xml" \
  "$HOME_DIR/.config/JetBrains/IntelliJIdea2026.1/options/editor.xml"
copy_file \
  "$REPO_ROOT/.config/JetBrains/IntelliJIdea2026.1/options/vim_settings.xml" \
  "$HOME_DIR/.config/JetBrains/IntelliJIdea2026.1/options/vim_settings.xml"
copy_file \
  "$REPO_ROOT/.config/JetBrains/IntelliJIdea2026.1/keymaps/GNOME Proper Redo.xml" \
  "$HOME_DIR/.config/JetBrains/IntelliJIdea2026.1/keymaps/GNOME Proper Redo.xml"

printf 'Installed dotfiles from %s to %s\n' "$REPO_ROOT" "$HOME_DIR"
