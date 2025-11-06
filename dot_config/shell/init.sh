# Initialise shell environment

SHELL_HOME=$HOME/.config/shell

source $SHELL_HOME/exports.sh
source $SHELL_HOME/aliases.sh
for f in $SHELL_HOME/tools/*; do source $f; done
