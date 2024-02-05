# Granted.dev assume
alias assume="source assume"
alias asr='assume $(aws configure list-profiles | fzf)'    # [as]sume [r]ole
alias asc='assume $(aws configure list-profiles | fzf) -c' # [as]sume [c]onsole
alias ast='assume $(aws configure list-profiles | fzf) -t' # [as]sume [t]erminal

# AWS CLI autocompletion
aws_completer_path=$(which aws_completer)
if [ -n "$aws_completer_path" ]; then
  complete -C "$aws_completer_path" aws
fi
