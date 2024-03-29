# zsh theme bstuart

if [[ $terminfo[colors] -ge 256 ]]; then
    error="%F{196}"
    warning="%F{220}"
    good="%F{034}"
    info="%F{075}"
    muted="%F{245}"
else
    error="%F{red}"
    warning="%F{yellow}"
    good="%F{green}"
    info="%F{cyan}"
    muted="%F{white}"
fi
reset_color="%f"

function git_remote_name() {
  local remote_name="$(__git_prompt_git config --local --get remote.origin.url | sed -e 's/.*\///' -e 's/.git$//')"

  echo "$remote_name"
}

function git_repo_path() {
  local git_repo_name="$(git_remote_name)"
  local git_relative_path="$(__git_prompt_git rev-parse --show-prefix 2>/dev/null)"
  local git_repo_path="${git_repo_name}/${git_relative_path}"

  echo "${git_repo_path:0:-1}"
}

function directory() {
  if [[ "$(git_repo_name)" == "" ]]; then
    echo "%{$info%}%~%f"
  else
    echo "%{$info%}$(git_repo_path)%f"
  fi
} 

function prompt() {
  echo " %{$good%}%(!.#.>)%f "
}

function git_custom_status() {
  AHEAD_REMOTE="%{$good%}⇡$(git_commits_ahead)%{$reset_color%}"
  BEHIND_REMOTE="%{$error%}⇣$(git_commits_behind)%{$reset_color%}"

  ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE=""
  ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="|$AHEAD_REMOTE"
  ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="|$BEHIND_REMOTE"
  ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="|$AHEAD_REMOTE$BEHIND_REMOTE"

  ZSH_THEME_GIT_PROMPT_DIRTY="%{$warning%}*"
  ZSH_THEME_GIT_PROMPT_PREFIX=" [%{$muted%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}$(git_remote_status)]"
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  echo "$(git_prompt_info)"
}

PROMPT='$(directory)$(git_custom_status)$(prompt)'
