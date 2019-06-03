#!/bin/bash .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
# set PATH so it includes user's private bin directories 
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
PATH="$PATH:/var/lib/snapd/snap/bin"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -f ~/.alias/.aliasrc ]; then
	"." ~/.alias/.aliasrc
fi

# Add an "alert" alias for long running commands.  Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# docker-compose completions
# https://docs.docker.com/compose/completion/#bash
# if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
#    . /opt/local/etc/profile.d/bash_completion.sh
# fi

# fzf fuzzy finder
# https://github.com/junegunn/fzf
[ -f ~/.bash/.fzf.bash ] && source ~/.bash/.fzf.bash
