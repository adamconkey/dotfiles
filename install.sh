# Backup any existing dotfiles in home
[ -f "$HOME/.bashrc" ] && echo "Backing up original .bashrc to .bashrc.BACKUP" && mv $HOME/.bashrc $HOME/.bashrc.BACKUP
[ -f "$HOME/.bash_aliases" ] && echo "Backing up original .bash_aliases to .bash_aliases.BACKUP" && mv $HOME/.bash_aliases $HOME/.bash_aliases.BACKUP
[ -f "$HOME/.emacs" ] && echo "Backing up original .emacs to .emacs.BACKUP" && mv $HOME/.emacs $HOME/.emacs.BACKUP

# Symlink dotfiles to home folder (TODO do realpath resolve to current dir)
ln -sv "$HOME/.dotfiles/.bashrc" $HOME
ln -sv "$HOME/.dotfiles/.bash_aliases" $HOME
ln -sv "$HOME/.dotfiles/.emacs" $HOME
