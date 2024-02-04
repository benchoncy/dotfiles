# Config
alias tmuxconfig="chezmoi edit ~/.tmux.conf"
alias vimconfig="chezmoi edit ~/.config/nvim/"
alias dotconfig="chezmoi edit"

# Editor
alias vim="nvim"

# Granted.dev assume
alias assume="source assume"
alias asr='assume $(aws configure list-profiles | fzf)'    # [as]sume [r]ole
alias asc='assume $(aws configure list-profiles | fzf) -c' # [as]sume [c]onsole
alias ast='assume $(aws configure list-profiles | fzf) -t' # [as]sume [t]erminal

# Jira
alias jf='jira open $(jira issue list \
    -q "assignee = currentUser() AND resolution = Unresolved AND project IS NOT EMPTY" \
    --plain \
    --no-headers \
    --columns key,summary \
    | fzf) > /dev/null'

function ja() {
    jira issue assign $1 ${2:-$(jira me)}
}

# Docker
alias drun="docker run -it --rm"

# K8s
alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"

# Terraform
alias tf="terraform"
