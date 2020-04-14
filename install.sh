#!/usr/bin/env bash

dir="${HOME}/.dotfiles"

# Bash
ln -sfv "${dir}/.bash_profile" "${HOME}"
ln -sfv "${dir}/.bash_aliases" "${HOME}"
ln -sfv "${dir}/.bashrc" "${HOME}"

# Vim
ln -sfv "${dir}/init.vim" "${HOME}/.vimrc"
## Set init.vim in .config/nvim
ln -sfv "${dir}/init.vim" "${HOME}/.config/nvim/init.vim"

# Window management
ln -sfv "${dir}/.skhdrc" "${HOME}"
ln -sfv "${dir}/.tmux.conf" "${HOME}"
ln -sfv "${dir}/.yabairc" "${HOME}"

# Git completion
ln -sfv "${dir}/.git-completion.sh" "${HOME}"

# Dirs
ln -sfv "${dir}/.mpd" "${HOME}"
ln -sfv "${dir}/.ncmpcpp" "${HOME}"
ln -sfv "${dir}/.iterm2" "${HOME}"
ln -sfv "${dir}/.config/karabiner" "${HOME}/.config"

# Scripts dir
ln -sfv "${dir}/.scripts" "${HOME}"
