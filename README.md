# dotfiles-devcontainer

A unified development environment for **macOS** and **WSL (Windows)**, with consistent dotfiles, VS Code settings, and Dev Containers.

## Overview
This repo standardizes Cody's development setup across platforms. It ensures that the same shell, prompt, editor settings, and developer tools are available whether working on macOS, WSL, or inside a container.

## Usage

### Important Notes for WSL Users
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
```bash
./dotfiles/bootstrap.sh
```

### 2. Apply dotfiles
```bash
./dotfiles/setup.sh
```

### 3. VS Code + Devcontainer
```bash
code .
```

## Prompt Options
- Default: Starship
- Minimal Git Prompt (commented fallback)
- Powerlevel10k (manual install + enable in `.zshrc`)
