## Aliases
[ -f ~/.aliases ] && source ~/.aliases

# --- History ---
HISTFILE=~/.bash_history
HISTSIZE=10000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# --- Colors ---
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  tput sgr0
  bold=$(tput bold)
  reset=$(tput sgr0)
  fg_cyan=$(tput setaf 6)
  fg_yellow=$(tput setaf 3)
  fg_green=$(tput setaf 2)
else
  bold=""
  reset=""
  fg_cyan=""
  fg_yellow=""
  fg_green=""
fi

# --- Git Branch Function ---
parse_git_branch() {
  git branch 2>/dev/null | sed -n '/\* /s///p'
}

# --- Prompt Configuration ---
PROMPT_COMMAND='PS1="[WSL] ${fg_cyan}\u@\h ${fg_yellow}\w ${fg_green}$(parse_git_branch)${reset} \$ "'

# --- PATH Adjustments ---
export PATH="$HOME/bin:$PATH"

# --- Editor ---
export EDITOR="code -w"

# --- Quality of Life ---
# Enable color support for common commands
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# --- Final Message ---
echo "Bash configuration loaded successfully (WSL environment)."
