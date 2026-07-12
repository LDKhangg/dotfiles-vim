#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

have() {
  command -v "$1" >/dev/null 2>&1
}

need_sudo() {
  [[ "${EUID}" -ne 0 ]]
}

run_pkg() {
  if need_sudo; then
    sudo "$@"
  else
    "$@"
  fi
}

install_with_pacman() {
  run_pkg pacman -Sy --needed \
    neovim git curl unzip fd ripgrep fzf wl-clipboard xclip \
    nodejs npm python python-pynvim gcc make jre-openjdk
}

install_with_apt() {
  run_pkg apt-get update
  run_pkg apt-get install -y \
    neovim git curl unzip fd-find ripgrep fzf wl-clipboard xclip \
    nodejs npm python3 python3-pynvim build-essential default-jre
}

install_with_dnf() {
  run_pkg dnf install -y \
    neovim git curl unzip fd-find ripgrep fzf wl-clipboard xclip \
    nodejs npm python3 python3-pynvim gcc make java-21-openjdk-headless
}

install_with_zypper() {
  run_pkg zypper install -y \
    neovim git curl unzip fd ripgrep fzf wl-clipboard xclip \
    nodejs npm python3 python3-pynvim gcc make java-21-openjdk-headless
}

bootstrap_packages() {
  if have pacman; then
    install_with_pacman
    return
  fi

  if have apt-get; then
    install_with_apt
    return
  fi

  if have dnf; then
    install_with_dnf
    return
  fi

  if have zypper; then
    install_with_zypper
    return
  fi

  printf 'Unsupported package manager. Install dependencies manually, then run %s/scripts/install.sh\n' "$REPO_ROOT" >&2
  exit 1
}

bootstrap_packages
bash "$REPO_ROOT/scripts/install.sh"

printf '\nBootstrap complete.\n'
printf 'Next steps:\n'
printf '1. Open Neovim once and let lazy.nvim install plugins.\n'
printf '2. Open IntelliJ IDEA and enable IdeaVim if it is not already enabled.\n'
printf '3. If you use Java in IntelliJ, install your preferred JDK from Toolbox or your distro packages.\n'
