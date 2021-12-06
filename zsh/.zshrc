source <(antibody init)
set -o vi
setopt appendhistory autocd beep extendedglob nomatch notify

# History
HISTSIZE=100000000
SAVEHIST=100000000
HISTFILE=~/.zsh_history

export LANG=en_US.UTF-8
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs \
  -g "!{.git,.cache,.next,build,dist,node_modules}" \
  -g "!{package-lock.json}"';

eval "$(pyenv init -)"

export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'

typeset -U PATH path
path=( 
  /usr/local/sbin
  $HOME/.yarn/bin
  $HOME/.config/yabai/global/node_modules/.bin
  $HOME/.cargo/bin
  $path 
)

export GOPATH=$HOME/.go
export N_PREFIX="$HOME/.n/bin"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
export PATH="$PATH:$N_PREFIX/bin:$GOROOT/bin:$GOPATH/bin:$HOME/.bin:$HOME/.config/composer/vendor/bin"
export PATH="/home/hnktt/.deno/bin:$PATH"

antibody bundle zsh-users/zsh-autosuggestions 
antibody bundle zdharma-continuum/fast-syntax-highlighting
antibody bundle robobenklein/zdharma-history-search-multi-word
antibody bundle mafredri/zsh-async
# antibody bundle sindresorhus/pure

alias reload="source $HOME/.zshrc"
alias bu="brew update"
alias buu="brew upgrade"
alias vimconfig="$EDITOR ~/.config/nvim"
alias screenshare="/usr/lib/xdg-desktop-portal-wlr -l DEBUG"

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

autoload -Uz compinit 
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

eval "$(starship init zsh)"
export PATH=/usr/local/opt/openjdk@11/bin:$PATH
