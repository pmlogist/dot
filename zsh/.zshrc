source <(antibody init)
set -o vi
setopt appendhistory autocd beep extendedglob nomatch notify

# History
HISTSIZE=100000000
SAVEHIST=100000000
HISTFILE=~/.zsh_history

export LANG=en_US.UTF-8
export EDITOR="nvim"
export GOPATH="$HOME/.go"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs \
  -g "!{.git,.cache,.next,build,dist,node_modules}" \
  -g "!{package-lock.json}"';

eval "$(pyenv init -)"

typeset -U PATH path
path=( 
  /usr/local/sbin
  $HOME/.yarn/bin
  $HOME/.config/yabai/global/node_modules/.bin
  $HOME/.cargo/bin
  $path 
)
export N_PREFIX="$HOME/.n/bin"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
export PATH="$N_PREFIX/bin:$PATH"

antibody bundle zsh-users/zsh-autosuggestions 
antibody bundle zdharma/fast-syntax-highlighting
antibody bundle zdharma/history-search-multi-word
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure

alias reload="source $HOME/.zshrc"
alias bu="brew update"
alias buu="brew upgrade"
alias vimconfig="$EDITOR ~/.config/nvim"

case `uname` in
  Darwin)
    alias ls="ls -G"
    alias ll="ls -la"
  ;;
  Linux)
    alias ls="ls --color=auto"
    alias ll="ls -la"
  ;;
esac
