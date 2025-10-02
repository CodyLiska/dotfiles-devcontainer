# Aliases
if [ -f ~/.aliases ]; then
  source ~/..aliases
fi

# PATH adjustments
if [[ "$(uname)" == "Darwin" ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
elif grep -qi microsoft /proc/version 2>/dev/null; then
  export PATH="/usr/local/bin:$PATH:/usr/bin:$PATH"
fi

# Editor
export EDITOR="code --wait"

# Python virtualenvs
export WORKON_HOME=$HOME/.venvs
mkdir -p $WORKON_HOME

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# === PROMPT OPTIONS ===

# 1. Starship (default)
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init bash)"
fi

# 2. Minimal Git prompt (fallback)
# parse_git_branch() {
#   git branch 2>/dev/null | grep '^*' | colrm 1 2
# }
# PS1="\u@\h \w \$(parse_git_branch)\$ "
