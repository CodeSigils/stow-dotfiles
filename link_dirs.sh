#!/usr/bin/env bash

## Links selected directories to a destination of your choice using GNU stow.
## Note that removing your selected directories better done manually.

## Destination path (will hold the symlinks):
# dest_dir="/home/$(whoami)/test"
dest_dir="/home/$(whoami)"

## Source path (will hold the actual directories):
source_dir="/data"

cd $source_dir || return

## MAIN STOW FUNCTION
## Ignores 'dotfiles' folder, 'lost+found', '.git', '.Trash-1000' ...
select_dirs() {
stow -v "$1" -t "$dest_dir" \
--ignore='(?:\..*|[^+]*\+[^+]*)' \
--ignore='dotfiles' \
--ignore=".git" \
--ignore=".gitignore" \
--ignore=".stow-local-ignore" \
.
}

link_dirs() { select_dirs "-R"; }
unlink_dirs() { select_dirs "-D"; }

link_dirs ## Uncomment to link - relink directories
# unlink_dirs ## Uncomment to unlink directories
