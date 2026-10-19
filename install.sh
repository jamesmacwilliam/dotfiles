#!/usr/bin/env bash
# Symlink tracked dotfiles into $HOME. Existing files are moved to <file>.backup.
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
FILES=(.zshrc .zsh_alias .tmux.conf .vimrc .config/nvim/init.lua)

for f in "${FILES[@]}"; do
  src="$DOTFILES/$f"
  dest="$HOME/$f"
  mkdir -p "$(dirname "$dest")"

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok       $f"
    continue
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mv "$dest" "$dest.backup"
    echo "backup   $f -> $f.backup"
  fi

  ln -s "$src" "$dest"
  echo "linked   $f"
done

# vim swap dir (see .vimrc)
mkdir -p "$HOME/tmp"

[ -f "$HOME/.zsh_credentials" ] || echo "note: no ~/.zsh_credentials - see .zsh_credentials.example"
