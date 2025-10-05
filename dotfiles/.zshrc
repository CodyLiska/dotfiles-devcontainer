## Aliases
[ -f ~/.aliases ] && source ~/.aliases

# Load colors and set prompt substitution
autoload -Uz colors && colors
setopt PROMPT_SUBST

# --- Prompt Configuration ---
# Clean, readable prompt showing user, host, path, and git branch
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "($(basename $ref))"
}

PROMPT='%{$fg[cyan]%}%n@%m %{$fg[yellow]%}%~ %{$fg[green]%}$(git_prompt_info)%{$reset_color%} $ '

# --- Platform Detection ---
if grep -qi microsoft /proc/version 2>/dev/null; then
  export PROMPT="[WSL] ${PROMPT}"
fi

# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_DUPS

# --- Path Adjustments ---
export PATH="$HOME/bin:$PATH"

# --- Editor ---
export EDITOR="code -w"


# --- Optional Plugins (if desired) ---
# Example: uncomment to enable if you install these manually
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- Final ---
echo "Zsh configuration loaded successfully."
