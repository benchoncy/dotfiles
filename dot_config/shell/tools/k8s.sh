SHELL_NAME=$(basename $SHELL)

alias k="kubectl" # [k]ubectl
alias kctx="kubectx" # [k]ubectl [ctx]
alias kns="kubens" # [k]ubectl [ns]

alias kg="kubectl get" # [k]ubectl [g]et
alias kd="kubectl describe" # [k]ubectl [d]escribe

function kdebug() { # [k]ubectl run [debug] pod
  kubectl run -i --tty --rm debug --image=ubuntu --restart=Never -- sh
}

function kexec() { # [k]ubectl [exec] into pod
  pod=$(kubectl get pods -o name | fzf)
  kubectl exec -it $pod -- /bin/sh
}

function klogs() {  # [k]ubectl [logs]
  pod=$(kubectl get pods -o name | fzf)
  kubectl logs $pod -f
}
