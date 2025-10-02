# First Run Setup Guide

This checklist ensures you can set up your dev environment on a fresh machine (macOS or WSL).

---

## 1. Clone the Repo
⚠️ Clone inside your **WSL home directory** (not `/mnt/c` or `/mnt/d`).

```bash
cd ~
git clone https://github.com/CodyLiska/dotfiles-devcontainer.git
cd dotfiles-devcontainer
```

---

## 2. Make Scripts Executable
```bash
chmod +x dotfiles/bootstrap.sh
chmod +x dotfiles/setup.sh
```

---

## 3. Run Bootstrap
Installs required packages.

- **macOS** → Homebrew + packages
- **WSL** → apt + packages

```bash
./dotfiles/bootstrap.sh
```

---

## 4. Apply Dotfiles
Symlinks configs into `$HOME`.

```bash
./dotfiles/setup.sh
```

This will:
- Backup existing dotfiles with a timestamp suffix
- Apply new configs
- Enable **Starship prompt**

---

## 5. Restart Shell
```bash
exec zsh   # if using zsh
exec bash  # if using bash
```

---

## 6. VS Code Setup
Open the repo in VS Code:

```bash
code .
```

VS Code will:
- Apply `.vscode/settings.json`
- Suggest extensions from `.vscode/extensions.json`
- Detect `.devcontainer/` and prompt to reopen inside container

---

## 7. Prompt Options
- **Default:** Starship  
- **Fallback:** Minimal Git prompt (commented in `.bashrc`/`.zshrc`)  
- **Optional:** Powerlevel10k (commented in `.zshrc`)  

To enable Powerlevel10k:
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
```

---

## ✅ Done!
You now have a unified development setup across macOS + WSL.
