path[1,0]="$HOME/.nodenv/bin"
path[1,0]=$0:A:h/node-build/bin
path[1,0]="$HOME/.nodenv/shims"

if [ ! -h $HOME/.nodenv ]; then
  ln -sf $0:A:h/nodenv $HOME/.nodenv
fi

export NODENV_SHELL=zsh
source "$HOME/.nodenv/completions/nodenv.zsh"

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
