# dotfiles
My personal dotfiles. You probably don't want to directly use these files, but you're welcome to poke around.

## Installation

Execute this one-liner and cross your fingers:
```bash
curl https://raw.githubusercontent.com/adamconkey/dotfiles/main/.dotfiles_setup/install_dotfiles.sh > install_dotfiles.sh && chmod +x install_dotfiles.sh && ./install_dotfiles.sh && rm ./install_dotfiles.sh
```
If you get an error like
```
fatal: destination path '/home/adam/.dotfiles' already exists and is not an empty directory.
```
then you already have a `.dotfiles` folder in your home directory. The script conservatively just exits at that point, you should do `rm -rf $HOME/.dotfiles` to remove it and try the command again. If you already have dotfiles they should be backed up to `$HOME/.dotfiles_backup`.


## Resources
  - https://www.atlassian.com/git/tutorials/dotfiles
  - https://engineering.kalkayan.io/posts/setting-up-a-development-machine-part-3/
