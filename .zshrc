# ~/.zshrc

# Enable plugins
plugins=(git)

# Preferred editor
EDITOR='vim'

# Aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias py=python3

# PATHs
export GEM_HOME="$HOME/.gems"
export GO_HOME="/usr/local/go"
export PATH="$PATH:$HOME/.local/bin:$GEM_HOME:$GO_HOME"
