#!/usr/bin/env bash

## Location of dotfiles (will hold actual files and dirs)
dot_files="/data/dotfiles"
## Destination directory (will hold the symlinks):
dest_dir="/home/$(whoami)"

cd $dot_files || return
## MAIN STOW FUNCTION
link_selected() {
	for i in "${file_list[@]}"; do
		stow -v "$1" -t $dest_dir "$i"
	done
}
link_files() { link_selected "-R"; }
unlink_files() { link_selected "-D"; }

## ========================================================================== ##
## PACKAGES - Uncomment one or more to link-unlink before run the script
## ========================================================================== ##

file_list=(
## === A === ##
# albert     ## ~/.config/albert/albert.conf && ~/.local/share/albert
# alias      ## ~/.bash_alias*

## === B === ##
# bash

## === C === ##
# calibre    ## ~/.config/calibre
# cheat      ## ~/.cheat
# cinnamon   ## ~/.cinnamon

## === D === ##

## === E === ##
# enpass     ## ~/.config/sinew.in
# eslint     ## ~/.eslintrc

## === F === ##
# fzf
# fonts      ## ~/.local/share/fonts

## === G === ##
# geany      ## ~/.config/geany
# git        ## ~/.gitconfig

## === H === ##

## === I === ##

## === J === ##

## === K === ##

## === L === ##
# lilyterm   ## ~/.config/lilyterm

## === M === ##
# mcomix     ## ~/.config/mcomix
# mplayer    ## ~/.mplayer
# mpv        ## ~/.config/mpv

## === N === ##
# nvim       ## ~/.config/nvim/init.vim

## === O === ##

## === P === ##
# private    ## private stuff - include it in .gitignore

## === Q === ##

## === R === ##
# ranger     ## ~/.config/ranger && ~/.local/share/ranger/{bookmarks,tagged}
# rygel      ## ~/.config/rygel.conf

## === S === ##
# sakura     ##  ~/.config/sakura

## === T === ##
# themes     ## ~/.themes && ~/.icons
# tilda      ## ~/.config/tilda
# tint2      ## ~/.config/tint2

## === U === ##
# user-dirs  ## ~/.config/user-dirs.*

## === V === ##
# vim        ## ~/.vim*
# vlc        ## ~/.config/vlc/vlcrc
# vscode     ## ~/.config/Code/User/{snippets,settings.json} && rm -rf ~/.vscode

## === W === ##
# wget       ## ~/.wgetrc

## === X === ##
# xarchiver  ## ~/.config/xarchiver
# xinitrc    ## ~/.xinitrc

## === Y === ##
# youtube-viewer ## ~/.config/youtube-viewer

## === Z === ##
# zathura    ## ~/.config/zathura
# zsh        ## ~/.zsh*
)

link_files ## Uncomment to link
# unlink_files ## Uncomment to unlink
