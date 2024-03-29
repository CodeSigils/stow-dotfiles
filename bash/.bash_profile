#!/bin/bash .bash_profile

# Get the aliases and functions
[ -f ~/.bashrc ] && . ~/.bashrc

# User specific environment and startup programs

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip3
# pip bash completion end
