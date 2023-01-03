#!/usr/bin/env bash

# Remove temporary files created on edits
alias rmtmp="rm *~"

# Manage dotfiles with git (replace git keyword with dotfiles in commands)
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Pretty-print ls
alias ls='exa'
alias la='exa -a'
alias ll='exa -lagh --git'

# Pretty-print du
alias du="dutree"

# Open emacs in terminal instead of GUI when run from CLI
alias emacs="emacs -nw"

# Pretty-print cat
alias cat="bat"
