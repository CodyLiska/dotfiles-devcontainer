# Dotfiles with Devcontainer

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

## Usage

### ⚠️ Important Notes for WSL Users

- **Clone into your WSL home directory**, not into a mounted Windows drive (`/mnt/c/...` or `/mnt/d/...`), to avoid line-ending and permission issues.

  ```bash
  cd ~
  git clone https://github.com/CodyLiska/dotfiles-devcontainer.git
  cd dotfiles-devcontainer
  ```

- Ensure scripts are executable before running them:
  ```bash
  chmod +x dotfiles/bootstrap.sh
  chmod +x dotfiles/setup.sh
  ```

### 1. Bootstrap (new machine only)

Installs required dependencies (`brew` on macOS, `apt` on WSL), Starship, NVM, Python, etc.

```bash
./dotfiles/bootstrap.sh
```

### 2. Apply dotfiles

Symlinks dotfiles into your home directory.

```bash
./dotfiles/setup.sh
```

### 3. VS Code + Devcontainer

Open the repo in VS Code. It will:

- Apply `.vscode/settings.json` and `.vscode/extensions.json`
- Detect `.devcontainer/` and prompt to reopen in a container

```bash
code .
```

From here you’ll be running Python 3.11 + Node.js 20 with consistent dotfiles and editor settings.

## ✅ Prompt Options

- Default: Starship
- Minimal Git Prompt (comment/uncomment in `.zshrc`)
- Powerlevel10k (manual install + enable in `.zshrc`)
