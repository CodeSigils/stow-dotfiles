#!/usr/bin/env bash

## Location of dotfiles (will hold actual files and dirs)
dot_files="/data/dotfiles"
cd $dot_files || return
## Destination directory (will hold the symlinks):
dest_dir="/home/$(whoami)"

## MAIN STOW FUNCTION
selected_apps() {
	for i in "${util_list[@]}"; do
		stow -v "$1" -t $dest_dir "$i"
	done
}
link_util() { selected_apps "-R"; }
unlink_util() { selected_apps "-D"; }

## ========================================================================== ##
## PACKAGES - Uncomment one or more to install-uninstall before run the script
## ========================================================================== ##

util_list=(
## === A === ##
# albert ## rm -rf ~/.config/albert/albert.conf && rm -rf ~/.local/share/albert
# alias ## rm .bash_alias*

## === B === ##
# bash

## === C === ##
# calibre ## rm -rf ~/.config/calibre
# cheat
# cinnamon ## rm -rf ~/.cinnamon

## === D === ##

## === E === ##
# enpass ## rm -rf ~/.config/sinew.in
# eslint

## === F === ##
# fzf
# fonts ## rm -rf ~/.local/share/fonts

## === G === ##
# git

## === H === ##

## === I === ##

## === J === ##

## === K === ##

## === L === ##

## === M === ##
# mcomix ## rm -rf ~/.config/mcomix
# mplayer ## rm -rf ~/.mplayer
# mpv ## rm -rf ~/.config/mpv

## === N === ##
# nvim ## rm ~/.config/nvim/init.vim

## === O === ##

## === P === ##
# private ## private stuff - include it in .gitignore

## === Q === ##

## === R === ##
# ranger ## rm -rf ~/.config/ranger && rm -rf ~/.local/share/ranger/{bookmarks,tagged}
# rygel ## rm ~/.config/rygel.conf

## === S === ##
# sakura ## rm -rf ~/.config/sakura

## === T === ##
# themes ## rm -rf ~/.themes && rm -rf ~/.icons
# tilda ## rm -rf ~/.config/tilda
# tint2 ## rm -rf ~/.config/tint2

## === U === ##
#user-dirs ## rm ~/.config/user-dirs.*

## === V === ##
# vim ## rm -rf ~/.vim*
# vlc ## rm ~/.config/vlc/vlcrc
# vscode ## rm -rf ~/.config/Code/User/{snippets,settings.json} && rm -rf ~/.vscode

## === W === ##
# wget

## === X === ##
# xarchiver ## rm -rf ~/.config/xarchiver
# xinitrc

## === Y === ##
# youtube-viewer ## rm -rf ~/.config/youtube-viewer

## === Z === ##
# zathura
# zsh
)

link_util ## Uncomment to link
# unlink_util ## Uncomment to unlink
