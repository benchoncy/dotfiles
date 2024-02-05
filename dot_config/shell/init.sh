# Initialise shell environment

SHELL_HOME=$HOME/.config/shell

source $SHELL_HOME/exports.sh
source $SHELL_HOME/aliases.sh
for f in $SHELL_HOME/tools/*; do source $f; done

# Start tmux
if command -v tmux &> /dev/null && \
   [ -n "$PS1" ] && \
   [[ ! "$TERM" =~ screen ]] && \
   [[ ! "$TERM" =~ tmux ]] && \
   [ -z "$TMUX" ]
then
    exec tmux new-session -A -D -s default
fi
