# Config
alias tmuxconfig="chezmoi edit ~/.tmux.conf"
alias vimconfig="chezmoi edit ~/.config/nvim/"
alias dotconfig="chezmoi edit"

# Editor
alias vim="nvim"

# Granted.dev assume
alias assume="source assume"
alias gar='assume $(aws configure list-profiles | fzf)'    # [g]ranted [a]ssume [r]ole
alias gac='assume $(aws configure list-profiles | fzf) -c' # [g]ranted [a]ssume [c]onsole
alias gat='assume $(aws configure list-profiles | fzf) -t' # [g]ranted [a]ssume [t]erminal
