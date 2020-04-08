# Alias nvim as vim
alias vim='nvim'

# Alias for ctags installed with Homebrew
alias ctags="/usr/local/bin/ctags"

# Alias detailed ls command
alias ll='ls -la'

# User specific aliases and functions
alias ducks='du -cks * | sort -rn | head -15'

# Locking screen on OS X
alias lock='pmset displaysleepnow'

# PhD folders aliases
alias cdth='cd ~/Documents/_files/_research/monograph/body/thesis'
alias cdtr='cd ~/Documents/_files/_research/monograph/material/transcripts/transcript/transcript'
alias cdp='cd ~/Documents/_files/_research/monograph/material/transcripts/photos'
alias cdr='cd ~/Documents/_files/_research/monograph/phd_references'

# Coding aliases
alias cdd='cd ~/Documents/python/dev/'
alias cdg='cd ~/.go'

# Open PhD bibliography
alias bib='vim ~/Documents/_files/_research/monograph/body/thesis/local_bibliography.bib'

# Git aliases
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gch='git checkout'
alias gcl='git clone'
alias gd='git diff'
alias gds='git diff --staged'
alias gf='git fetch'
alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''       %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gm='git merge'
alias gnb='git checkout -b'
alias gpl='git pull'
alias gplom='git pull origin master'
alias gpu='git push'
alias gre='git restore'
alias gres='git restore --staged .'
alias grm='git remote'
alias gstat='git status'
