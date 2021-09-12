alias reload="source $HOME/.zshrc"
alias vimconfig="$EDITOR ~/.config/nvim"

case `uname` in
  Darwin)
    alias ls="ls -G"
    alias ll="ls -la"
    alias bu="brew update"
    alias buu="brew upgrade"
  ;;
  Linux)
    alias ls="ls --color=auto"
    alias ll="ls -la"
  ;;
esac
