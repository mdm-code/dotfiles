# Export modified PATH
typeset -U PATH path

# Pyenv and Poetry setup
export PYENV_ROOT="$HOME/.pyenv/bin"
export POETRY_ROOT="$HOME/.poetry/bin"

path=("$PYENV_ROOT"
      "$POETRY_ROOT"
      "/usr/local/opt/openssl/bin"
      "/usr/local/homebrew"
      "/Users/michal/.go/goroot/current/bin"
      "/Users/michal/.go/gopath/bin"
      "/Users/michal/.dotfiles/scripts"
      "$path[@]")
export PATH

# Added Java home path
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home"

# Bibliography file
export BIB='~/Documents/_files/_research/monograph/body/thesis/local_bibliography.bib'
