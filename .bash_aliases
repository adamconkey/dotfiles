alias rmtmp="rm *~"

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# See this PPA for using exa on Ubuntu earlier than 20.10:
#     https://github.com/ogham/exa/issues/783#issuecomment-877973708
alias ls='exa'
alias la='exa -a'
alias ll='exa -lah --git'

alias du="dutree"

alias emacs="emacs -nw"

alias jnb="jupyter notebook --no-browser"


# I had a panic using the apt install of bat, installing the release
# as suggested here worked:
#     https://github.com/sharkdp/bat/issues/2317#issuecomment-1248343739
# Note if you do that, you can just use bat on linux instead of batcat

# if [ "$(uname -s)" == "Linux" ]; then
#   alias cat="batcat"
# else
#   alias cat="bat"
# fi
alias cat="bat"

conda-ld () {
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.miniconda3/envs/ll4ma/lib
}