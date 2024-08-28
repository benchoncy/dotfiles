# Contains configurations related to python

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# conda
conda_init() {
  __conda_setup="$('$HOME/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  elif [ -f "$HOME/miniconda/etc/profile.d/conda.sh" ]; then
      . "$HOME/miniconda/etc/profile.d/conda.sh"
  else
      export PATH="$HOME/miniconda/bin:$PATH"
  fi
}
conda_init
