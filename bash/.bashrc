#!/bin/bash .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -f ~/.shell/.aliasrc ]; then
    "." ~/.shell/.aliasrc
else
    print "404: ~/.shell/.aliasrc not found. Check your .bashrc"
fi

# Add an "alert" alias for long running commands.  Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


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

## https://github.com/tomnomnom/gf 
## go get -u github.com/tomnomnom/gf
if [[ $(command -v gf) ]]; then
  source "${GOPATH}/src/github.com/tomnomnom/gf/gf-completion.bash"
fi

# docker-compose completions
# https://docs.docker.com/compose/completion/#bash
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
   . /opt/local/etc/profile.d/bash_completion.sh
fi

# fzf fuzzy finder
# https://github.com/junegunn/fzf
[ -f "$HOME/.bash/.fzf.bash" ] && "." "$HOME/.bash/.fzf.bash"

if [[ $(command -v kitty) ]]; then
  source <(kitty + complete setup bash)
fi


