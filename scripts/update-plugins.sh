#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORK_DIR="$(mktemp -d /tmp/opencode/dotfiles-vim-update.XXXXXX)"

cleanup() {
  rm -rf "$WORK_DIR"
}

trap cleanup EXIT

if ! command -v nvim >/dev/null 2>&1; then
  printf 'Neovim is required to update plugins.\n' >&2
  exit 1
fi

mkdir -p "$WORK_DIR/config"
cp -a "$REPO_ROOT/.config/nvim" "$WORK_DIR/config/nvim"

XDG_CONFIG_HOME="$WORK_DIR/config" \
XDG_DATA_HOME="$WORK_DIR/data" \
XDG_STATE_HOME="$WORK_DIR/state" \
XDG_CACHE_HOME="$WORK_DIR/cache" \
  nvim --headless '+Lazy! sync' +qa

cp "$WORK_DIR/config/nvim/lazy-lock.json" "$REPO_ROOT/.config/nvim/lazy-lock.json"

printf 'Updated %s/.config/nvim/lazy-lock.json\n' "$REPO_ROOT"
