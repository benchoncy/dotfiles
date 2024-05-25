# Granted.dev assume
alias assume="source assume"
alias asr='assume $(aws configure list-profiles | fzf)'    # [as]sume [r]ole
alias asc='assume $(aws configure list-profiles | fzf) -c' # [as]sume [c]onsole
alias ast='assume $(aws configure list-profiles | fzf) -t' # [as]sume [t]erminal
