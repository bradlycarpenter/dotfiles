# ---- prompt: current dir + git branch/dirty ----
autoload -Uz vcs_info
setopt PROMPT_SUBST

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '✗'
zstyle ':vcs_info:git:*' stagedstr   '+'
zstyle ':vcs_info:git:*' formats       ' (%F{red}%b%f%F{yellow}%u%c%f)'
zstyle ':vcs_info:git:*' actionformats ' (%F{red}%b%f|%F{yellow}%a%f)'

precmd() { vcs_info }
PROMPT='%F{cyan}%c%f${vcs_info_msg_0_} $ '

# ---- keys: explicit emacs bindings (zsh picks vi-mode from $EDITOR otherwise)
bindkey -e

# ---- completion: minimal, cached (fixes TAB's stray trailing slash)
autoload -Uz compinit
compinit -C -d "$HOME/.zcompdump"
setopt AUTO_REMOVE_SLASH

# ---- history ----
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE

export EDITOR=nvim
export VISUAL=nvim

# ---- paths: each guarded, so this file is portable ----
[[ -d $HOME/.local/bin ]]     && PATH="$HOME/.local/bin:$PATH"
[[ -d $HOME/.cargo/bin ]]     && PATH="$HOME/.cargo/bin:$PATH"
[[ -d $HOME/.tmuxifier/bin ]] && PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH

# ---- nvm: resolve default version onto PATH directly (sourcing nvm.sh costs ~600ms)
export NVM_DIR="$HOME/.nvm"
if [[ -r $NVM_DIR/alias/default ]]; then
  _v=$(<"$NVM_DIR/alias/default")
  while [[ $_v != v* && -r "$NVM_DIR/alias/$_v" ]]; do _v=$(<"$NVM_DIR/alias/$_v"); done
  [[ -d $NVM_DIR/versions/node/$_v/bin ]] && PATH="$NVM_DIR/versions/node/$_v/bin:$PATH"
  unset _v
fi
# full nvm loads only when you invoke it
nvm() { unfunction nvm; source "$NVM_DIR/nvm.sh"; nvm "$@"; }
[[ -s /usr/share/nvm/init-nvm.sh ]] && { unfunction nvm; source /usr/share/nvm/init-nvm.sh; }

# ---- optional tooling, only if actually installed ----
[[ -d $HOME/.local/share/helix/runtime ]] && export HELIX_RUNTIME="$HOME/.local/share/helix/runtime"
command -v pyenv >/dev/null && { export PYENV_ROOT="$HOME/.pyenv"; eval "$(pyenv init - zsh)"; }

# ---- aliases (were in .bashrc, which zsh does not read) ----
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alF'
alias la='ls -A'

# ---- zoxide ----
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
