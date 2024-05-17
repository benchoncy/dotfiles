SHELL_NAME=$(basename $SHELL)

alias g="git"
alias gp="git pull && git push"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gac="git commit -a"

# git autocompletion
if [ -f "~/.git-completion.$SHELL_NAME" ]; then
  source "~/.git-completion.$SHELL_NAME"
fi
