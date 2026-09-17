export KEYTIMEOUT=10
export EDITOR="$(which nvim)"
export XDG_CONFIG_HOME="${HOME}/.config"

export HOMEBREW_HOME="/opt/homebrew"
export PIO_BIN="${HOME}/.platformio/penv/bin"
export HOME_BIN="${HOME}/bin"
export UNCRUSTIFY_CONFIG="${HOME}/.config/uncrustify/uncrustify.cfg"
export PATH="/Applications/SWI-Prolog.app/Contents/MacOS:$PATH"
export PATH="$HOME/.cargo/bin:${PATH}"
export PATH="${HOMEBREW_HOME}/opt/bison/bin:${PATH}"
export PATH="${HOMEBREW_HOME}/opt/flex/bin:${PATH}"
export PATH="${HOMEBREW_HOME}/bin:${HOMEBREW_HOME}/opt:${HOME_BIN}:${PIO_BIN}:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"

# Ada (GNAT + gprbuild via Alire)
export PATH="${HOME}/.local/share/alire/toolchains/gnat_native_16.1.0_657cf254/bin:${PATH}"
export PATH="${HOME}/.local/share/alire/toolchains/gprbuild_26.0.1_6bf7d80c/bin:${PATH}"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --no-rehash -)"
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

# Cache completions: full rebuild only if the dump is missing or older than a day
compinit() {
  local dump="${ZSH_COMPDUMP:-${ZDOTDIR:-$HOME}/.zcompdump}"
  local -a opts
  if [[ ! -s $dump || -n $dump(#qN.mh+24) ]]; then
    opts=()
  else
    opts=(-C)
  fi
  unfunction compinit
  autoload -Uz compinit
  compinit "${opts[@]}" "$@"
}

source $ZSH/oh-my-zsh.sh

alias grep="grep --color=always"
alias nv="nvim"
alias dict='zk edit --interactive --notebook-dir ${HOME}/dev/dictionary'

# Lazy-load conda (the init hook costs ~150ms per shell)
if [[ -x "$HOME/miniconda3/bin/conda" ]]; then
  conda() {
    unfunction conda
    eval "$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2>/dev/null)"
    conda "$@"
  }
fi

