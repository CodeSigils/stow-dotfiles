#!/bin/bash

# ~/.bash_logout: executed by bash(1) when login shell exits.

## when leaving the console clear the screen to increase privacy
## DEBIAN
# if [ "$SHLVL" = 1 ]; then
#    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
# fi
## FEDORA
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear ] && /usr/bin/clear -q
fi

## kill ssh_agent on logout
#if [ -n "$SSH_AUTH_SOCK" ] ; then
#  eval `/usr/bin/ssh-agent -k`
#fi
