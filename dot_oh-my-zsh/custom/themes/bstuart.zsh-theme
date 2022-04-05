# zsh theme bstuart

if [[ $terminfo[colors] -ge 256 ]]; then
    error="%F{160}"
    warning="%F{184}"
    good="%F{35}"
    info="%F{81}"
    muted="%F{247}"
else
    error="%F{red}"
    warning="%F{yellow}"
    good="%F{green}"
    info="%F{cyan}"
    muted="%F{white}"
fi

directory() {
  if [[ "$(git_repo_name)" == "" ]]; then
    echo "%{$info%}%~%f"
  else
    echo "%{$info%}$(git_repo_name)%f"
  fi
} 

prompt() {
  echo " %{$good%}%(!.#.$)%f "
}

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=" %{$error%}⇣$(git_commits_behind)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" %{$good%}⇡$(git_commits_ahead)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE=" %{$good%}⇡$(git_commits_ahead)%{$error%}⇣$(git_commits_behind)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$warning%}*"
ZSH_THEME_GIT_PROMPT_PREFIX=" [%{$muted%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}$(git_prompt_status)$(git_remote_status)]"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='$(directory)$(git_prompt_info)$(prompt)'