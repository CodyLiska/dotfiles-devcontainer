#!/usr/bin/env bash
set -e

echo "Running bootstrap script..."

if [[ "$(uname)" == "Darwin" ]]; then
    echo "Detected macOS"
    if ! command -v brew >/dev/null 2>&1; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install git zsh starship nvm python3 uv

elif [[ "$(uname -r)" == *"microsoft"* ]]; then
    echo "Detected WSL"
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y git curl build-essential zsh python3 python3-venv

    if ! command -v starship >/dev/null 2>&1; then
        curl -sS https://starship.rs/install.sh | sh -s -- -y
    fi

    if [ ! -d "$HOME/.nvm" ]; then
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    fi
else
    echo "Unsupported OS. Exiting."
    exit 1
fi

echo "Bootstrap complete. Next, run ./setup.sh"
