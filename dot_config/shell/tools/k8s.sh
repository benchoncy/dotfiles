SHELL_NAME=$(basename $SHELL)

alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"

alias kg="kubectl get"
alias kd="kubectl describe"
alias kl="kubectl logs"

function kdebug() { # [k]ubectl run [debug] pod
  kubectl run -i --tty --rm debug --image=busybox --restart=Never -- sh
}

function kexec() { # [k]ubectl [exec] into pod
  pod=$(kubectl get pods -o name | fzf)
  kubectl exec -it $pod -- /bin/sh
}

function klogs() {  # [k]ubectl [logs]
  pod=$(kubectl get pods -o name | fzf)
  kubectl logs $pod -f
}
