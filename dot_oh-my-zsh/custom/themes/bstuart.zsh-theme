# zsh theme bstuart

directory() {
  echo "%F{045}%c%f"
} 

prompt() {
  echo ' %F{040}$%f'
}

ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ±"
#ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
#ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%} +"
#ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
#ZSH_THEME_GIT_PROMPT_BRANCH=""
#ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
#ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
#ZSH_THEME_GIT_PROMPT_STASHED="*%G"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT=' $(directory)$(git_prompt_info)$(prompt) '