## Aliases
[ -f ~/.aliases ] && source ~/.aliases

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# PATH adjustments
if [[ "$(uname)" == "Darwin" ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
elif grep -qi microsoft /proc/version 2>/dev/null; then
  export PATH="/usr/local/bin:$PATH:/usr/bin:$PATH"
fi

# Editor
export EDITOR="code --wait"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Python virtualenvs
export WORKON_HOME=$HOME/.venvs
mkdir -p $WORKON_HOME

# === PROMPT OPTIONS ===

# 1. Starship (default)
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# 2. Minimal Git prompt (fallback)
# parse_git_branch() {
#   git branch 2>/dev/null | grep '^*' | colrm 1 2
# }
# PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f %F{blue}$(parse_git_branch)%f $ '

# 3. Powerlevel10k (optional)
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
# echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
