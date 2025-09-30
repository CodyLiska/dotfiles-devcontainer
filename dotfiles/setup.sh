#!/usr/bin/env bash
set -e

echo "Setting up dotfiles..."

FILES=(".aliases" ".zshrc" ".bashrc" ".gitconfig")

for FILE in "${FILES[@]}"; do
    if [ -f ~/$FILE ]; then
        mv ~/$FILE ~/$FILE.backup
    fi
    ln -sf ~/dotfiles/$FILE ~/$FILE
done

mkdir -p ~/.config
ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml

echo "Dotfiles symlinked."

if [ -n "$ZSH_VERSION" ]; then
    exec zsh
elif [ -n "$BASH_VERSION" ]; then
    exec bash
else
    echo "Restart your shell to apply changes."
fi
