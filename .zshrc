# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set oh-my-zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# The following line sets command execution time format.
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
plugins=(git)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor
EDITOR='vim'

# Aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias py=python3
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# PATHs
export ZSH="$HOME/.oh-my-zsh"
export GEM_HOME="$HOME/.gems"
export GO_HOME="/usr/local/go"

# Local bin PATH
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$PATH:$HOME/.local/bin"
fi

# Go Home
if [ -d "$GO_HOME" ] ; then
    export PATH="$PATH:$GO_HOME"
fi

# Gems Home
if [ -d "$GEM_HOME" ] ; then
    export PATH="$PATH:$GEM_HOME"
fi

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
