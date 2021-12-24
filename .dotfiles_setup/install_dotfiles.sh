#!/usr/bin/env bash

# Backup any existing dotfiles in home
[ -f "$HOME/.bashrc" ] \
    && echo "Backing up original .bashrc to .bashrc.BACKUP" \
    && mv $HOME/.bashrc $HOME/.bashrc.BACKUP
[ -f "$HOME/.bash_aliases" ] \
    && echo "Backing up original .bash_aliases to .bash_aliases.BACKUP" \
    && mv $HOME/.bash_aliases $HOME/.bash_aliases.BACKUP
[ -f "$HOME/.emacs" ] \
    && echo "Backing up original .emacs to .emacs.BACKUP" \
    && mv $HOME/.emacs $HOME/.emacs.BACKUP

# Initialize home directory as a bare git repo. See these resources:
#    - https://engineering.kalkayan.io/posts/setting-up-a-development-machine-part-3
#    - https://www.atlassian.com/git/tutorials/dotfiles
# Note the 'dotfiles' alias will be in .bash_aliases, use that to manage dotfiles
git init --bare $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles checkout main
dotfiles config --local status.showUntrackedFiles no
