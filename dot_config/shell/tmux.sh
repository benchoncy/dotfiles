# Enter tmux if it exists and we're not already in a tmux session
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  # Ensure default session exists before attaching
  if tmux has-session -t default; then
    exec tmux attach
  else
    tmux new-session -d -s default && exec tmux attach
  fi
fi
