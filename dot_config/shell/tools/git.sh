SHELL_NAME=$(basename $SHELL)

alias g="git"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gac="git commit -a"

# git autocompletion
if [ -f "~/.git-completion.$SHELL_NAME" ]; then
  source "~/.git-completion.$SHELL_NAME"
fi
