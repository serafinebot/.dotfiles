export KEYTIMEOUT=10
export TERM="xterm-256color"
export EDITOR="$(which vim)"
export XDG_CONFIG_HOME="${HOME}/.config"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export HOMEBREW_HOME="/opt/homebrew"
export PIO_BIN="${HOME}/.platformio/penv/bin"
export HOME_BIN="${HOME}/bin"
export UNCRUSTIFY_CONFIG="${HOME}/.config/uncrustify/uncrustify.cfg"
export PATH="$HOME/.cargo/bin:${PATH}"
export PATH="${HOMEBREW_HOME}/opt/bison/bin:${PATH}"
export PATH="${HOMEBREW_HOME}/opt/flex/bin:${PATH}"
export PATH="${HOMEBREW_HOME}/bin:${HOMEBREW_HOME}/opt:${HOME_BIN}:${PIO_BIN}:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# ZSH
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_THEME="better-cypher"
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line root)
plugins=(
  git
  colored-man-pages
  # zsh-syntax-highlighting
  # vi-mode
  # zsh-autosuggestions
)

export FZF_DEFAULT_OPTS="--bind=ctrl-p:up,ctrl-n:down"

source $ZSH/oh-my-zsh.sh

alias grep="grep --color=always"
alias nv="nvim"
