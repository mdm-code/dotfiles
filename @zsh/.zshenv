# Export modified PATH
typeset -U PATH path

path=("/usr/local/opt/openssl/bin"
      "/usr/local/homebrew"
      "/Users/michal/.dotfiles/exec"
      "$path[@]")
export PATH

source "${XDG_CONFIG_HOME:-$HOME/.config}/shell.d/.goenv"

# This is my Git user
export GITUSER="mdm-code"

# Make it stop!
export PYTHONDONTWRITEBYTECODE=1
