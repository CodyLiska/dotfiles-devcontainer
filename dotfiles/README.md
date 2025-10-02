# Dotfiles & Devcontainer

Standardized setup for macOS + WSL with VS Code Dev Containers.

## Contents

- `.aliases` → shell aliases for git, python, node, navigation
- `.bashrc` → bash configuration (Starship prompt, fallback minimal prompt)
- `.zshrc` → zsh configuration (Starship prompt, Powerlevel10k optional)
- `.gitconfig` → git configuration and aliases
- `.config/starship.toml` → Starship prompt configuration
- `bootstrap.sh` → installs dependencies (brew/apt, starship, nvm, python)
- `setup.sh` → symlinks dotfiles into `$HOME`

## Setup

### 1. Bootstrap (new machine only)

```bash
./bootstrap.sh
```

### 2. Apply dotfiles

```bash
./setup.sh
```

## Prompt Options

- Default: Starship
- Minimal Git Prompt (comment/uncomment in .zshrc)
- Powerlevel10k (manual install + enable in .zshrc)

## Devcontainer

Comes with Python 3.11 + Node.js 20 + dotfiles + VS Code settings.

## Notes

- Starship is the default prompt
- Powerlevel10k is optional and commented in `.zshrc`
- Existing dotfiles are backed up with timestamp suffix when running `setup.sh`
