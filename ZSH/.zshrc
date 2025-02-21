export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fwalch"

plugins=(git fast-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source /usr/share/nvm/init-nvm.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi
export PATH=$PATH:$HOME/.cargo/bin/
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="$HOME/.nvm/versions/node/v22.11.0/bin:$PATH"

export PATH=$PATH:/home/sins/.spicetify
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
