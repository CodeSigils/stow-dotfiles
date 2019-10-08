#!/bin/bash

# ~/.bash_logout: executed by bash(1) when login shell exits.

## when leaving the console clear the screen to increase privacy
clear_console_on_exit() {
 if [ "$SHLVL" = 1 ]; then
   command "$(which clear)" 
   # && dev > null ~/.bash_history
 fi
}
trap clear_console_on_exit EXIT

## kill ssh_agent on logout
#if [ -n "$SSH_AUTH_SOCK" ] ; then
#  eval `/usr/bin/ssh-agent -k`
#fi
