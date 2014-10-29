path[1,0]="$HOME/.nodenv/bin"
path[1,0]="$ZSH/nodenv/node-build/bin"
#eval "$(nodenv init -)"
export NODENV_SHELL=zsh
source "$HOME/.nodenv/completions/nodenv.zsh"
#nodenv rehash 2>/dev/null
nodenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "`nodenv "sh-$command" "$@"`";;
  *)
    command nodenv "$command" "$@";;
  esac
}
