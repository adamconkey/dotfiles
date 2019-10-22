alias rmtmp="rm *~"

# Git convenience commands to apply git commands to all repos in a catkin workspace
alias gs="cd $CATKIN_HOME && clear && find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;"
alias gsv="cd $CATKIN_HOME && clear && find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status && echo)' \;"
alias gp="cd $CATKIN_HOME && clear && find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git pull && echo)' \;"

# Viewer GUI for H5 files
alias hdfview="$HOME/source_code/hdfview/HDFView-3.1.0-Linux/HDFView/3.1.0/hdfview.sh"

# Start and stop microphone
alias start_mic="pactl load-module module-loopback latency_msec=1"
alias stop_mic="pactl unload-module module-loopback"
