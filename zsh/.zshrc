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
#compdef pass-import
#description Import data from most of the existing password manager

_pass-import () {
	if (( CURRENT > 2)); then
		(( CURRENT-- ))
		shift words
		_pass_import_arguments
		_files
	else
		local -a subcommands
		subcommands=(
			'1password:Importer for 1password 6 in CSV format.'
			'1password4:Importer for 1password 4 in CSV format.'
			'1password4pif:Importer for 1password 4 in PIF format.'
			'aegis:Importer for Aegis otp plain or encrypted JSON format.'
			'andotp:Importer for AndOTP plain or encrypted JSON format.'
			'apple-keychain:Importer for Apple Keychain.'
			'bitwarden:Importer for Bitwarden in CSV format.'
			'buttercup:Importer for Buttercup in CSV format.'
			'chrome:Importer for Chrome in CSV format.'
			'chromesqlite:Importer for Chrome SQLite in CSV format.'
			'csv:Importer in generic CSV format.'
			'dashlane:Importer for Dashlane in CSV format.'
			'encryptr:Importer for Encryptr in CSV format.'
			'enpass:Importer for Enpass in CSV format.'
			'enpass6:Importer for Enpass 6 in CSV format.'
			'fpm:Importer for Figaro Password Manager in XML format.'
			'gnome-authenticator:Importer for Gnome Authenticator in JSON format.'
			'gnome-keyring:Importer for Gnome Keyring.'
			'gorilla:Importer for Gorilla in CSV format.'
			'kedpm:Importer for Figaro Password Manager in XML format.'
			'keepass:Importer for Keepass encrypted KDBX format.'
			'keepass-csv:Importer for Keepass in CSV format.'
			'keepass-xml:Importer for Keepass in XML format.'
			'keepassx:Importer for KeepassX in XML format.'
			'keepassx2:Importer for KeepassX2 encrypted KDBX format.'
			'keepassx2-csv:Importer for KeepassX2 in CSV format.'
			'keepassxc:Importer for KeepassXC encrypted KDBX format.'
			'keepassxc-csv:Importer for KeepassXC in CSV format.'
			'keeper:Importer for Keeper in CSV format.'
			'lastpass:Importer for Lastpass in CSV format.'
			'myki:Importer for Myki in CSV format.'
			'networkmanager:Importer for Network Manager.'
			'pass:Importer for password-store.'
			'passpie:Importer for Passpie in YAML format.'
			'passwordexporter:Importer for Firefox password exporter extension in CSV format.'
			'pwsafe:Importer for Pwsafe in XML format.'
			'revelation:Importer for Revelation in XML format.'
			'roboform:Importer for Roboform in CSV format.'
			'upm:Importer for Universal Password Manager (UPM) in CSV format.'
		)
		_arguments : \
			{-h,--help}'[display help information]' \
			{-V,--version}'[display version information]' \
			{-l,--list}'[list the supported password managers]' \
			{-q,--quiet}'[be quiet]'
		_describe -t commands 'pass import' subcommands
	fi
}

_pass_import_arguments () {
	_arguments : \
		{-h,--help}'[display help information]' \
		{-V,--version}'[display version information]' \
		{-l,--list}'[list the supported password managers]' \
		{-p,--path}'[import the passwords to a specific subfolder]:dir:_pass_complete_entries_with_dirs' \
		{-a,--all}'[also import all the extra data present]' \
		{-c,--clean}'[make the paths more command line friendly]' \
		{-C,--convert}'[convert the invalid caracters present in the paths]' \
		{-s,--sep}'[provide a caracter of replacement for the path]:-' \
		--cols'[csv expected columns to map columns to credential attributes. Only used for the generic csv importer.]' \
		--config'[set a config file]:_files' \
		{-f,--force}'[overwrite existing path]' \
		{-q,--quiet}'[be quiet]' \
		{-v,--verbose}'[be verbose]'
}

_pass_complete_entries_with_dirs () {
	_pass_complete_entries_helper -type d
}

_pass-import "$@"
