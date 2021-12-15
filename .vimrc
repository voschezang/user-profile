" vim user config 

set nocompatible
"let mapleader = ","
let mapleader = "\\"
set timeoutlen=300

" set vi-ins-mode-string \1\e[5q \2

" i/o with GUI
" set clipboard+=unnamedplus
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
  " set mouse=a
else
  set clipboard=unnamedplus "Linux
endif


" ------------------------------------------------------------------------------
" UI
" ------------------------------------------------------------------------------

syntax enable
" syntax on
set expandtab
set number
set ruler
set cursorline
" set cursorcolumn
" set signcolumn=yes
set hlsearch
set title
colorscheme desert
if system('uname -s') == "Darwin\n"
  highlight CursorLine cterm=NONE ctermbg=black guibg=black
else
  " default: underline only
endif
" :highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" replace spaces/tabs with '·'
" set list listchars=tab:>-,trail:·,extends:>,precedes:<,space:·
set list
set listchars=trail:·,tab:\|\ 

" https://vim.fandom.com/wiki/Highlight_unwanted_spaces
highlight ExtraTabColor ctermfg=darkgray guifg=darkgray
2match ExtraTabColor /\t/
autocmd ColorScheme * highlight ExtraTabColor

" override spell check highlighting
hi clear SpellBad
hi SpellBad cterm=underline

if 0 && system('uname -s') == "Darwin\n"
       " highlight ExtraWhitespace ctermbg=black guibg=black ctermfg=gray guifg=gray
       highlight ExtraWhitespace ctermbg=darkgray guibg=darkgray ctermfg=gray guifg=gray
       " re: /\s\+$/                      trailing spaces
       " re: /^\t*\zs \+/             prefix spaces
       match ExtraWhitespace /^\t*\zs \+\| \s\+$/
       " match ExtraWhitespace /^\t\| \s\+$/
       autocmd ColorScheme * highlight ExtraWhitespace
       " ctermbg=black guibg=black ctermfg=green guifg=green
endif

" cursor width
" set guicursor=i:ver25-iCursor





" ------------------------------------------------------------------------------
" UX
" ------------------------------------------------------------------------------

set nocompatible

" UX - Margins, Padding
set scrolloff=2
set splitright

" UX - Indentation
filetype indent plugin on
set autoindent smartindent
" set autoindent
" recursive filename search for tab-completion

" UX - Searching
set path+=**
set incsearch
set ignorecase
set smartcase
" set hidden " allow changing unsaved buffers

" display matching filenames on tab-complete
set wildmenu
set wildmode=longest:full,full

" build index
" command! MakeTags !ctags -R .
" then use ^[, g^[, ^t  to jump to definitions/declarations
set tags+=~/tags


" UX - Tree View

" beautify :edit, :Ex   |netrw-browse-maps|
" e.g. use <cr>,v, t to split, p to preview
" let g:netrw_banner=0                               " disable banner
let g:netrw_browse_split=4                        " open in prior window
let g:netrw_altv=1                                        " <cr>v to split right
let g:netrw_liststyle=3                 " tree view
if system('uname -s') == "Darwin\n"
  let g:netrw_list_hide=netrw_gitignore#Hide()
endif



" UX - custom mappings

" fix for backspace in OSX + zsh + vi
" inoremap '' dOD 
set backspace=indent,eol,start " shortcut: `:set bs=2`

" normal-mode, non-recurvive, map to ":noh" after Enter
" nnoremap <C-n> :noh<cr>
nnoremap <silent> <leader>n :noh <bar> redraw<CR>
noremap <silent> <C-L> :noh <bar> redraw<CR>

" close tab
nnoremap <C-w>d :quit<cr>

" execute current line with Bash
noremap <leader>b !!/bin/bash<CR>
" execute current line with Bash, and add newline
noremap <leader>B  o<esc>k <bar> !!/bin/bash<CR>



" Unicode
" :digraph
" •     C-K oo
"noremap <leader>o  i<C-K> oo <CR>
" ◆     C-K Db
"noremap <leader>D i<C-K> Db <CR>


" UX - Emacs style
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-E> <End>
inoremap <C-F> <Right>
" â is <Alt-B>
" inoremap  <Home>
" inoremap [1] <Left>


" noremap â <C-Left>
" æ is <Alt-F>
" inoremap æ <C-Right>

" C-K conflicts with digraph
"inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi
inoremap <C-Y> <Esc>Pa
" inoremap <C-X><C-S> <Esc>:w<CR>a


" ------------------------------------------------------------------------------
" UX - formatting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround

" autocmd Filetype python          setlocal tabstop=4 ai
" autocmd Filetype sh    setlocal tabstop=4 ai
" autocmd Filetype json setlocal tabstop=2 ai
" autocmd Filetype yaml              setlocal tabstop=2 ai
" autocmd Filetype yml setlocal tabstop=2 ai
" autocmd Filetype shell              setlocal nocolor
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType ansible set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType json set spell
autocmd FileType yaml set spell
autocmd FileType markdown set spell

