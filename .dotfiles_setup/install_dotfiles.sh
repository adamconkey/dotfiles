#!/usr/bin/env bash

# Based on script from here: https://www.atlassian.com/git/tutorials/dotfiles

set -u  # exit on unset vars

function dotfiles {
   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}


DOTFILES_BACKUP_DIR="$HOME/.dotfiles-backup"

# Clone bare git repo to hidden folder in home
git clone --bare git@github.com:adamconkey/dotfiles.git $HOME/.dotfiles
if [ $? -ne 0 ]; then
    # TODO currently just exits if the dir already exists, but could possibly
    # do something else like backup and delete
    exit 1
fi

# Try to checkout the files, backup any that exist already
cd $HOME
mkdir -p "$DOTFILES_BACKUP_DIR"
dotfiles checkout 2>/dev/null
if [ $? = 0 ]; then
    echo -e "\nChecked out dotfiles";
else
    echo -e "\nBacking up pre-existing dotfiles";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $DOTFILES_BACKUP_DIR/{} 2>/dev/n\
ull
fi
dotfiles checkout -f  # Force so it doesn't worry about moving script and README.md
dotfiles config status.showUntrackedFiles no  # Ignore everything else in home dir
echo -e "\nTracked dotfiles should be in home directory now\n"
