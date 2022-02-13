
if [ -n "$INSIDE_EMACS" ]; then
    vterm_printf(){
        if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
            # Tell tmux to pass the escape sequences through
            printf "\ePtmux;\e\e]%s\007\e\\" "$1"
        elif [ "${TERM%%-*}" = "screen" ]; then
            # GNU screen (screen, screen-256color, screen-256color-bce)
            printf "\eP\e]%s\007\e\\" "$1"
        else
            printf "\e]%s\e\\" "$1"
        fi
    }
    
    
    vterm_prompt_end(){
        vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
    }
    
    PS1=$PS1'\[$(vterm_prompt_end)\]'
fi


drake(){
    conda activate drake
    # Drake manipulation
    export PYTHONPATH="${PYTHONPATH}:$HOME/source_code/manipulation"
}


isaacgym(){
    conda activate isaacgym
    source $HOME/isaac_ws/devel/setup.bash
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.miniconda3/envs/isaacgym/lib
}
