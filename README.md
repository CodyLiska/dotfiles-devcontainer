# Dotfiles and Devcontainer

A unified development environment for **macOS** and **WSL (Windows)**, with consistent dotfiles, VS Code settings, and Dev Containers.

## Overview

This repo standardizes my development setup across platforms. It ensures that the same shell, prompt, editor settings, and developer tools are available whether working on macOS, WSL, or inside a container.

Key components:

- **Dotfiles** → zsh/bash config, git aliases, Starship prompt, Powerlevel10k optional
- **Devcontainer** → Python 3.11 + Node.js 20, dotfiles integration, VS Code settings/extensions
- **VS Code settings** → consistent formatting, trimming, line endings, and UI tweaks

## Philosophy

Switching between macOS and WSL often introduces small but frustrating differences (line endings, shells, environment paths, git behavior). This repo eliminates those differences by:

- Using **zsh + Starship** as the default prompt for consistency and speed.
- Keeping **aliases, git config, and Python/Node setups** identical in both environments.
- Leveraging **Dev Containers** for reproducible environments and dependency isolation.
- Storing **VS Code settings** in version control for predictable editing and formatting across platforms.

In short: _one developer experience, everywhere_.

## Contents

- `dotfiles/` → core configs (`.zshrc`, `.bashrc`, `.aliases`, `.gitconfig`, `starship.toml`)
- `.devcontainer/` → Dev Container definition with Python + Node features
- `.vscode/` → VS Code project settings and extension recommendations
- `.gitignore` → ignores virtualenvs, node_modules, logs, and system cruft
- `LICENSE` → MIT License

## Usage

### 1. Clone the repo

```bash
git clone https://github.com/CodyLiska/dotfiles-devcontainer.git
cd dotfiles-devcontainer
```

### 2. Run bootstrap (fresh machine only)

- Installs required packages via Homebrew (macOS) or apt (WSL)
- Installs Starship and nvm

```bash
./dotfiles/bootstrap.sh
```

### 3. Apply dotfiles

- Symlinks configs to `$HOME`
- Activates Starship prompt

```bash
./dotfiles/setup.sh
```

### 4. Open in VS Code

VS Code will:

- Apply `.vscode/settings.json` and `.vscode/extensions.json`
- Detect `.devcontainer/` and prompt to reopen in container

```bash
code .
```

### 5. Inside Dev Container

- Python 3.12 and Node.js 22 available
- Dotfiles applied automatically
- VS Code settings/extensions synced
- Dependencies auto-installed if `requirements.txt` or `package.json` exist

```bash
pip install -r requirements.txt   # optional
npm install                       # optional
```
