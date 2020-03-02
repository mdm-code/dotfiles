# .bashrc

# Set basic file editor
export EDITOR=nvim

# Path to Homebrew
export PATH="/usr/local/homebrew:$PATH"

# Setting locale for dmenu to work
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# added by Miniconda3 installer
export PATH="/Users/michal/Documents/python/miniconda3/bin:$PATH"

# The go language paths
export PATH="/Users/michal/.go/goroot/current/bin:$PATH"
export PATH="/Users/michal/.go/gopath/bin:$PATH"

# Added Java home path
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home"

# Path to shell scripts
export PATH="/Users/michal/.scripts:$PATH"

# Bibliography file
export BIB='~/Documents/_files/_research/monograph/body/thesis/local_bibliography.bib'

# Colors for folders/files/exec_files
export CLICOLOR=1

# Vim-like controls in bash. Press ESC to enter normal mode
set -o vi

# Get aliases from a separate file
source ~/.bash_aliases

# Changed native command promt
git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u \[\033[0;34m\]\W\[\033[0;31m\]\$(git_branch)\[\033[00m\] $ "

# Read colors from wal
(cat ~/.cache/wal/sequences &)

# Run neofetch
(neofetch)

# Git command completion
source ~/.git-completion.sh

# Some random MACOS crap: fucking BASH deprecation message on terminal start
export BASH_SILENCE_DEPRECATION_WARNING=1
