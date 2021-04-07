typeset -U PATH path

export GOROOT_BIN="/Users/michal/.go/goroot/current/bin"
export GOPATH_BIN="/Users/michal/.go/gopath/bin"

path=("$GOROOT_BIN"
      "$GOPATH_BIN"
      "$path[@]")
export PATH
