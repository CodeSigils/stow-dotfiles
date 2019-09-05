let s:uname = system("uname -s")
" let s:hname = system("uname -n")

set nocompatible

set backspace=indent,eol,start

set expandtab                     "tabs are spaces
set autoindent
set smartindent
set smarttab                      "go to the next indent of the next tabstop 
set tabstop=2                     "number of visual spaces per TAB
set shiftwidth=2                  "number of visual spaces per SHIFT
set hidden

if has('linebreak')
  set breakindent                     " indent wrapped lines to match start
  if exists('&breakindentopt')
    set breakindentopt=shift:2        " emphasize broken lines by indenting them
  endif
endif

if exists('$SUDO_USER')
  set noswapfile                      " don't create root-owned files
else
  set directory=~/local/.vim/tmp/swap//
  set directory+=~/.vim/tmp/swap//    " keep swap files out of the way
  set directory+=.
endif


"-------------Visuals-------------"
"Place in ~/.vim/colors
"wget https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark.vim
"wget https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim

colorscheme atom-dark-256
set t_CO=256                        "force 256 colors in terminal
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

" set list                            " show whitespace
" set listchars=nbsp:⦸                " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
" set listchars+=tab:▷┅               " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
                                      " + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)
set nojoinspaces                      " don't autoinsert two spaces after '.', '?', '!' for join command
set noshowmatch                       " don't jump between matching brackets
set number                            " show line numbers in gutter

"statusline appears all the time:
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" ↩ ↵ ↲ ␣ • … → » ∎ ¶ ▶ ▸ ▷ ▹
set listchars=eol:↲,tab:▶▹,nbsp:␣,extends:…,trail:•





"-------------Search-------------"
set hlsearch                        "highlight matches
set foldenable                      "enable folding
set foldlevelstart=10               "open most folds by default
set foldnestmax=10                  "10 nested fold max
set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif




"-------------Abbreviations-------------"
"Replace common mistakes
inoreabbrev teh the
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q




"-------------Mappings-------------"
let mapleader = ','               "replace default leader / with comma

"Windows splitting
"set splitbelow
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

"Map <tab> for trigger completion, completion confirm
  inoremap <silent><expr> <TAB>
    \ pumvisible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
  
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

"Snippet expand and jump like VSCode. 
"Note the `coc-snippets` extension is required for this to work.
  let g:coc_snippet_next = '<tab>'




"-------------YML-------------"
autocmd FileType yaml setlocal ai ts=2 sw=2 et




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

"vim-surround
call minpac#add('tpope/vim-surround')

"fzf
call minpac#add('junegunn/fzf',)
nnoremap <C-p> : <C-u>FZF<CR>

"ranger
"https://github.com/rafaqz/ranger.vim
ret g:ranger_terminal = 'xterm -e'
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
" let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'

"front-end
call minpac#add('pangloss/vim-javascript')
call minpac#add('mxw/vim-jsx')

"--------------------COC-----------------------------------
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"-------------Abbreviations-------------"
abbr _pl #!/usr/bin/perl<CR>use strict;<CR>use warnings;
abbr _sh #!/bin/sh<CR>
