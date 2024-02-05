SHELL_NAME=$(basename $SHELL)

alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"

alias kg="kubectl get"
alias kd="kubectl describe"
alias kl="kubectl logs"

# kubectl autocompletion
if command -v kubectl &> /dev/null; then
  source <(kubectl completion $SHELL_NAME)
  complete -o default -F __start_kubectl k # extended completion to alias
fi

function kdebug() { # [k]ubectl [debug]
  kubectl run -i --tty --rm debug --image=busybox --restart=Never -- sh
}

function kep() { # [k]ubectl [exec] into [p]od
  pod=$(kubectl get pods -o name | fzf)
  kubectl exec -it $pod -- /bin/sh
}

function kdp() {  # [k]ubectl [d]escribe [p]od
  pod=$(kubectl get pods -o name | fzf)
  kubectl describe $pod
}

function klp() {  # [k]ubectl [l]ogs [p]od
  pod=$(kubectl get pods -o name | fzf)
  kubectl logs $pod
}
