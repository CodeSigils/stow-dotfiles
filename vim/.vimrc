let s:uname = system("uname -s")
" let s:hname = system("uname -n")

set nocompatible

set backspace=indent,eol,start
let mapleader = ','               "replace default leader / with comma

set expandtab                     "tabs are spaces
set autoindent
set smartindent
set tabstop=2                     "number of visual spaces  per TAB
set softtabstop=2                 "number of spaces in tab when editing
set hidden




"-------------Visuals-------------"
"Place in ~/.vim/colors
"wget https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark.vim
"wget https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim

colorscheme atom-dark-256
set t_CO=256                        "force 256 colors in terminal
set number                          "show line numbers
set ruler
set showcmd                         "show command in bottom bar
set wildmenu                        "visual autocomplete for command menu
set lazyredraw                      "redraw only when is needed
set showmatch                       "highlight mathcing brackets
set wrap linebreak nolist           "soft wrap
"set textwidth=80                   "wrap lines to 80 chars
set tw=80                           "wrap lines to 80 chars

"MacVim only

set linespace=14
set guifont=Fira_Code_Medium:h15
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
"colorscheme atom-dark




"-------------Search-------------"
set incsearch                       "search as characters are entered
set hlsearch                        "highlight matches
set foldenable                      "enable folding
set foldlevelstart=10               "open most folds by default
set foldnestmax=10                  "10 nested fold max




"-------------Mappings-------------"
"Windows splitting

set splitbelow
set splitright

nnoremap <A-w> <C-w>
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"Resplace esc with jk
inoremap jk <ESC>

"F3 to show non-printing chars
noremap <F3> :set list!<CR>
inoremap <F3> <Esc>:set list!<CR>a




"-------------Package-Manager-------------"
"Install minpac. git with ssh setup required
"mkdir -p $VIMCONFIG/pack/minpac/opt
"cd $VIMCONFIG/pack/minpac/opt
"git clone https://github.com/k-takata/minpac.git

packadd minpac
call minpac#init()

"Installing plugins using minpac:
"1. Append next 2 lines to your .vimrc:
"
"call minpac#add('tpope/vim-unimpaired')
"call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
"
"By default, minpac installs plugins to the start directory,
"but to install an optional plugin you need to specify {’type’: ’opt’} 
"as the second argument.
"
"2. Reload .vimrc:
" :source %
"
"3. Invoke minipac function:
" :call minpac#update()
"
"4. Delete a plugin with minpac
" Delete the line from .vimrc then run
" :call minpac#clean()
"
"5. Create some commands for speed
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackStatus call minpac#status()




"-------------Plugins-------------"
"Let minpac manage itself:
call minpac#add('k-takata/minpac', {'type': 'opt'})

"unimpaired
"https://github.com/tpope/vim-unimpaired
call minpac#add('tpope/vim-unimpaired')

"fzf
call minpac#add('junegunn/fzf',)
nnoremap <C-p> : <C-u>FZF<CR>

"ranger
"https://github.com/rafaqz/ranger.vim
let g:ranger_terminal = 'xterm -e'
call minpac#add('rafaqz/ranger.vim')

map <leader>rr :RangerEdit<cr>
map <leader>rv :RangerVSplit<cr>
map <leader>rs :RangerSplit<cr>
map <leader>rt :RangerTab<cr>
map <leader>ri :RangerInsert<cr>
map <leader>ra :RangerAppend<cr>
map <leader>rc :set operatorfunc=RangerChangeOperator<cr>g@

"Syntax Checking - Ale
call minpac#add('w0rp/ale',)
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

"front-end
call minpac#add('pangloss/vim-javascript')
call minpac#add('mxw/vim-jsx')
call minpac#add('mattn/emmet-vim')

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\    'extends' : 'jsx',
\  },
\}


"statusline appears all the time:
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" ↩ ↵ ↲ ␣ • … → » ∎ ¶ ▶ ▸ ▷ ▹
set listchars=eol:↲,tab:▶▹,nbsp:␣,extends:…,trail:•




"-------------Abbreviations-------------"
abbr _pl #!/usr/bin/perl<CR>use strict;<CR>use warnings;
abbr _sh #!/bin/sh<CR>

