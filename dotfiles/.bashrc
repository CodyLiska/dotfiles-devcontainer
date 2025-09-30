# Cody's bash config

if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

if [[ "$(uname)" == "Darwin" ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
elif [[ "$(uname -r)" == *"microsoft"* ]]; then
  export PATH="/usr/local/bin:$PATH:/usr/bin:$PATH"
fi

export EDITOR="code --wait"

export WORKON_HOME=$HOME/.venvs
mkdir -p $WORKON_HOME

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

parse_git_branch() {
  git branch 2>/dev/null | grep '^*' | colrm 1 2
}
PS1="\u@\h \w \$(parse_git_branch)\$ "
