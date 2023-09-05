# Initialise shell environment

SHELL_HOME=$HOME/.config/shell

source $SHELL_HOME/exports.sh
source $SHELL_HOME/python.sh
source $SHELL_HOME/aliases.sh

# Start tmux
if command -v tmux &> /dev/null && \
   [ -n "$PS1" ] && \
   [[ ! "$TERM" =~ screen ]] && \
   [[ ! "$TERM" =~ tmux ]] && \
   [ -z "$TMUX" ]
then
    exec tmux new-session -A -D -s default
fi
