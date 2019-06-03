#!/bin/zsh

## --------------------------------------------------------------------------- #
## FZF
## --------------------------------------------------------------------------- #
## Define custom fzf paths here
FZF_EXEC_PATH="/home/$(whoami)/.fzf/bin"
FZF_KEYS_PATH="/home/$(whoami)/.fzf/shell/key-bindings.zsh"
FZF_COMPLETION_PATH="/home/$(whoami)/.fzf/shell/completion.zsh"
# ## With zplug
# FZF_EXEC_PATH="/home/$(whoami)/.zplug/repos/junegunn/fzf/bin"
# FZF_KEYS_PATH="/home/$(whoami)/.zplug/repos/junegunn/fzf/shell/key-bindings.zsh"
# FZF_COMPLETION_PATH="/home/$(whoami)/.zplug/repos/junegunn/fzf/shell/completion.zsh"

## Setup fzf in PATH
## -----------------
if [[ ! "$PATH" == *"$FZF_EXEC_PATH"* ]]; then
  export PATH="$PATH:$FZF_EXEC_PATH"
fi
## fzf auto-completion
## ------------------
[[ $- == *i* ]] && source "$FZF_COMPLETION_PATH" 2> /dev/null
## Key bindings
## ------------------
source "$FZF_KEYS_PATH"
