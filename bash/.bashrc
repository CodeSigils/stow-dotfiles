#!/bin/bash .bashrc

## LOADING HIERARCHY:
## ~/.profile | ~/.bashrc | ~/.shell/.aliasrc ...
## All major configs and path setup are included in .aliarc:
## -----------------
## ~/.shell/.aliasrc
##  | ~/.shell/.colorsrc
##  | ~/.shell/.pathrc
##  | ~/.shell/.dnfrc
##  | ~/.shell/.configrc

## ===================================================
## === BASH Initial Setup - Completion 
## ===================================================

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

#if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
#   . /opt/local/etc/profile.d/bash_completion.sh
#fi

## ===================================================
## === ALIAS - CUSTOM SETUP in "~/.shell" dir
## ===================================================

## User specific aliases and functions
[ -f ~/.shell/.aliasrc ] && . ~/.shell/.aliasrc

# Add an "alert" alias for long running commands.  Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

## ===================================================
## === Colors - History - Pager
## ===================================================

## Uncomment the following line if you don't like systemctl's auto-paging feature:
## export SYSTEMD_PAGER=

# Basic vars
#export TERM="st-256color"
export TERM=xterm-256color
export HISTCONTROL=ignoredups:erasedups # no duplicate entries

export PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "

## ===================================================
## === Added Apps - Custom Helpers
## ===================================================

if [ "$(command -v pass import)" ]; then
    ## pass-import completion file for bash
    ## https://github.com/roddhjav/pass-import
    ## pip install --user pass-import
    PASSWORD_STORE_EXTENSION_COMMANDS+=(import)

__password_store_extension_complete_import() {
    local importers=(1password 1password4 1password4pif aegis andotp
        apple-keychain bitwarden buttercup chrome chromesqlite csv dashlane
        encryptr enpass enpass6 fpm gnome-authenticator gnome-keyring gorilla
        kedpm keepass keepass-csv keepass-xml keepassx keepassx2 keepassx2-csv
        keepassxc keepassxc-csv keeper lastpass myki networkmanager pass
        passpie passwordexporter pwsafe revelation roboform upm)
    local args=(-h --help -p --path -a --all -c --clean -C --convert -s --sep
          --cols --config -l --list -f --force -q --quiet -v --verbose -V
          --version)
    local lastarg="${COMP_WORDS[$COMP_CWORD-1]}"
    if [[ $lastarg == "-p" || $lastarg == "--path" ]]; then
        _pass_complete_folders
        compopt -o nospace
    elif [[ $COMP_CWORD -gt 2 ]]; then
        COMPREPLY+=($(compgen -W "${args[*]}" -- ${cur}))
    else
        COMPREPLY+=($(compgen -W "${importers[*]} ${args[*]}" -- ${cur}))
    fi
}
fi

## fzf fuzzy finder
## https://github.com/junegunn/fzf
[ -f "$HOME/.bash/.fzf.bash" ] && . "$HOME/.bash/.fzf.bash"

