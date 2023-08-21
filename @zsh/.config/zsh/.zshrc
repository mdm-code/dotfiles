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
TERM=xterm-256color
autoload -U colors && colors  # Load colors
setopt autocd                 # Automatically cd into typed directory
stty stop undef               # Disable ctrl-s to freeze terminal

# Prompt setup
setopt PROMPT_SUBST
PROMPT='%B%{$fg[cyan]%}%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}bsd %{$fg[magenta]%}%2~%{$fg[cyan]%} ${vcs_info_msg_0_}%{$reset_color%}$%b '

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!'
    fi
}
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats "%{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[green]%} %b%{$fg[blue]%})"

# History in cache directory
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.cache/zsh/history

# Load aliases if exist
[ -f "${XDG_CONFIG_HOME:-$HOME/.config/}/zsh/aliases" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases"

# Load journal configuration and functions
[ -f "${XDG_CONFIG_HOME:-$HOME/.config/}/jrnl/.jrnlrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config/}/jrnl/.jrnlrc"

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''           # color menu items
zstyle ':completion:*' special-dirs true        # show dot files and folders
zstyle ':completion:*' group-name ''            # don't group menu items
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # Include hidden files

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Enable searching through history
bindkey -M vicmd "/" vi-history-search-backward
bindkey -M vicmd "?" history-search-forward
bindkey -M vicmd "n" vi-repeat-search
bindkey -M vicmd "N" vi-rev-repeat-search


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

# Lynx
duck () {
# lynx "duckduckgo.com/lite?q=$*"
	lynx -cfg="$XDG_CONFIG_HOME/lynx/lynx.cfg" \
		-lss="$XDG_CONFIG_HOME/lynx/lynx.lss" \
		"duckduckgo.com/lite?kd=-1&kp=-1&q=$*"
}

# Added movement control options
setopt AUTO_CD # automatically cd when directory path entered
setopt AUTO_PUSHD # pushd after cd

# Load automatic suggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# Load zsh-syntax-highlighting; should be last.
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Syntax highlighting changes
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=green,bold'

# NVM managing node versions for Angular
# Lazy load this piece of shit.
nvm() {
	export NVM_DIR="$HOME/.nvm"
	[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
	[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
	nvm "$@"
}
