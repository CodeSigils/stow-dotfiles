#!/bin/zsh

## --------------------------------------------------------------------------- #
## HISTORY
## --------------------------------------------------------------------------- #
# HISTCONTROL=ignoreboth

## --------------------------------------------------------------------------- #
## PATHS
## --------------------------------------------------------------------------- #
## If you come from bash you might have to change your $PATH.

# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin/:/usr/bin:/usr/local/bin:~/.local/bin:$PATH

## --------------------------------------------------------------------------- #
## MISC
## --------------------------------------------------------------------------- #
# export MANPATH="/usr/local/man:$MANPATH"

## Time zone - Lang
# export TZ=Europe/Madrid
# export TZ=Europe/Malta
export TZ=Europe/Athens
export TC_LANG=custom.UTF-8
export LANG=en_US.UTF-8

## Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='vi'
fi

## Compilation flags
# export ARCHFLAGS="-arch x86_64"

## ---------------------------------------------------------------------------- #
## ZSH FUNCTIONS
## ---------------------------------------------------------------------------- #
## DESC: Web search from terminal. Change $BROWSER to $BROWSERCLI for lynx
## LINK: https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/web-search/web-search.plugin.zsh
if [ -f ~/.zsh/functions/web-search ]; then
    source ~/.zsh/functions/web-search
fi
## DESC: Zsh directory module from prezto. It works like fast temporary bookmarks. 
##       Visit a dir press d then change dir. Press d again.
## LINK: https://github.com/sorin-ionescu/prezto/blob/master/modules/directory/init.zsh
if [ -f ~/.zsh/functions/dir-module ]; then
    source ~/.zsh/functions/dir-module
fi

## --------------------------------------------------------------------------- #
## ALIASRC
## --------------------------------------------------------------------------- #
## Separate file for extra aliases, paths, functions, autocompletions etc
if [ -f ~/.alias/.aliasrc ]; then
    source ~/.alias/.aliasrc
else
    print "404: ~/.alias/.aliasrc not found. Check your .zshrc"
fi

## --------------------------------------------------------------------------- #
## FZF
## --------------------------------------------------------------------------- #
## TITLE: fzf fuzzy finder
## LINK: https://github.com/junegunn/fzf
[ -f ~/.zsh/.fzf.zsh ] && source ~/.zsh/.fzf.zsh

## --------------------------------------------------------------------------- #
## Python pip zsh completion
## --------------------------------------------------------------------------- #
function _pip_completion {
    local words cword
    read -Ac words
    read -cn cword
    reply=( $( COMP_WORDS="$words[*]" \
            COMP_CWORD=$(( cword-1 )) \
    PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
