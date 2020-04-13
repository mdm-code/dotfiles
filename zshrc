#    ~~~ Zsh config file ~~~
# Based on ~ Luke Smith ~ config

# Enable colors and change prompt
autoload -U colors && colors	# Load colors
PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%2~%{$fg[red]%}]%{$reset_color%}%b "
setopt autocd		# Automatically cd into typed directory
stty stop undef		# Disable ctrl-s to freeze terminal

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Load aliases and shortcuts if exist
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasesrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasesrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/codingrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/codingrc"

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

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
bindkey -s '^o' 'lfcd\n' # open and navigate dir in lf

bindkey -s '^a' 'bc -l\n' # Arithmetics

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n' # open dir in fzf

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load zsh-syntax-highlighting; should be last.
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
