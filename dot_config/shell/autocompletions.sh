# Autocompletion for various commands
SHELL_NAME=$(basename $SHELL)

# AWS CLI autocompletion
aws_completer_path=$(which aws_completer)
if [ -n "$aws_completer_path" ]; then
  complete -C "$aws_completer_path" aws
fi

# kubectl autocompletion
if command -v kubectl &> /dev/null; then
  source <(kubectl completion $SHELL_NAME)
  complete -o default -F __start_kubectl k # extended completion to alias
fi

# git autocompletion
if [ -f "~/.git-completion.$SHELL_NAME" ]; then
  source "~/.git-completion.$SHELL_NAME"
fi
