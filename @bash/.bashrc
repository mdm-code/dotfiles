#    ______  ___   _____ _   _ ______  _____
#    | ___ \/ _ \ /  ___| | | || ___ \/  __ \
#    | |_/ / /_\ \\ `--.| |_| || |_/ /| /  \/
#    | ___ \  _  | `--. \  _  ||    / | |
#    | |_/ / | | |/\__/ / | | || |\ \ | \__/\
#    \____/\_| |_/\____/\_| |_/\_| \_| \____/



# ENVIRONMENTAL VARIABLES ================================ #
export LC_ALL=en_US.UTF-8
export EDITOR="nvim"
export PAGER="less"
export DOTFILES="$HOME/.dotfiles"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export USER="${USER:-$(whoami)}"
export HOST="$(hostname)"
export GITUSER="mdm-code"
export TERM=xterm-256color
export JOURNAL="$HOME/Documents/journal"
export PYTHONDONTWRITEBYTECODE=2


# PATH =================================================== #
path=(
	"/usr/local/homebrew"
	"$HOME/.dotfiles/exec"
)

export PATH="$( IFS=":" ; echo "${path[*]}" ):$PATH"

source "${XDG_CONFIG_HOME:-$HOME/.config}/shell.d/.goenv"
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell.d/.rustenv"

export CDPATH=".:$HOME:$HOME/Documents"


# BASH OPTIONS =========================================== #
set -o vi
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob
shopt -s histappend


# PROMPT ================================================= #
function __ps1 {
	local \
		RESET="\[\e[0m\]" \
		RED='\[\e[31m\]' \
		GREEN='\[\e[32m\]' \
		YELLOW='\[\e[33m\]' \
		BLUE='\[\e[34m\]' \
		MAGENTA='\[\e[35m\]' \
		CYAN='\[\e[36m\]' \
		USER="$USER" \
		AT='@' \
		HOST="$HOST" \
		DIR="${PWD##*/}" \
		X="\[\e[0m\]"
		BRANCH=$(git branch --show-current 2>/dev/null) \
		P='$'

	[ -n "$DIR" ] || DIR="/"
	[ -n "$BRANCH" ] && BRANCH="($BRANCH)"

	PS1="$YELLOW$USER$GREEN$AT$BLUE$HOST $MAGENTA$DIR $GREEN$BRANCH$RESET$P$RESET "
}

PROMPT_COMMAND="__ps1"


# HISTORY ================================================ #
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth


# ALIASES ================================================ #
alias \
	ls='ls -h --color' \
	vim='nvim' \
	tmux='tmux -f $HOME/.dotfiles/tmux/tmux.conf' \
	e="$EDITOR" \
	'?'="duck" \
	rm='rm -i' \

alias \
	g='git' \
	ga='git add' \
	gb='git branch' \
	gc='git commit' \
	gch='git checkout' \
	gcl='git clone' \
	gd='git diff' \
	gds='git diff --staged' \
	gf='git fetch' \
	glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''       %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all" \
	gm='git merge' \
	gnb='git checkout -b' \
	gpl='git pull' \
	gplom='git pull origin master' \
	gpu='git push' \
	gre='git restore' \
	gres='git restore --staged .' \
	grm='git remote' \
	gstat='git status'


# LYNX =================================================== #
duck () {
	lynx -cfg="$XDG_CONFIG_HOME/lynx/lynx.cfg" \
	-lss="$XDG_CONFIG_HOME/lynx/lynx.lss" \
	"duckduckgo.com/lite?kd=-1&kp=-1&q=$*"
}


# LF ===================================================== #
lfcd () {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp" >/dev/null
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}


# NVM ==================================================== #
nvm() {
export NVM_DIR="$HOME/.nvm"
	[ -s "/usr/local/opt/nvm/nvm.sh" ] \
	&& \. "/usr/local/opt/nvm/nvm.sh"  # Load nvm
	[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] \
	&& \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # Load bash completions
	nvm "$@"
}


# JOURNAL ================================================ #
entry () {
	mkdir -p "$JOURNAL/$(date +%Y/%b/)"
	touch "$_$(date +%d)"
	e "$_"
}
