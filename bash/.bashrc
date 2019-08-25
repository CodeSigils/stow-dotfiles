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
# pass-import completion file for bash

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/seven/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/seven/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/seven/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/seven/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

