# Pyenv configuration for bash

if [ -d "$HOME/.pyenv" ]; then
  # Load pyenv if it is installed
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  # eval "$(pyenv init --path)"
  # eval "$(pyenv init -)"
  # eval "$(pyenv virtualenv-init -)"
  eval "$(pyenv init - bash)"
else
  # If pyenv is not installed, provide a message or alternative action
  echo "Pyenv is not installed. Please install it to manage Python versions."
fi
