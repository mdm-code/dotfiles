#         ______ _____ _   _     ______  _____ 
#        |___  //  ___| | | |    | ___ \/  __ \
#           / / \ `--.| |_| |    | |_/ /| /  \/
#          / /   `--. \  _  |    |    / | |    
#        ./ /___/\__/ / | | |    | |\ \ | \__/\
#        \_____/\____/\_| |_/    \_| \_| \____/



# Version control information
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'

# Enable colors and change prompt
autoload -U colors && colors  # Load colors
setopt autocd		          # Automatically cd into typed directory
stty stop undef		          # Disable ctrl-s to freeze terminal
setopt PROMPT_SUBST
PROMPT='%B%{$fg[cyan]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%2~%{$fg[cyan]%} ${vcs_info_msg_0_}]%{$reset_color%}$%b '

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Load aliases if exist
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasesrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasesrc"

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # Include hidden files

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

# Vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Vim ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# Vim ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# Program bindings
bindkey -s '^o' 'lfcd\n'   # Open and navigate dir in lf
bindkey -s '^a' 'bc -l\n'  # Arithmetics on command line
bindkey -s "^l" "clear\n"  # Clear bind for tmux

# Load zsh-syntax-highlighting; should be last.
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
