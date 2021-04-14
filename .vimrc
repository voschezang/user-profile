" vim user config 
set nocompatible
let mapleader = ","

" set vi-ins-mode-string \1\e[5q \2

" i/o with GUI
" set clipboard+=unnamedplus
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
  " set mouse=a
    set expandtab
else
  set clipboard=unnamedplus "Linux
  set expandtab
endif
if system('uname -n') == "NLLR4000529913"
  " use mouse in normal, visual mode
  " set mouse=nv
endif


" UX
filetype indent plugin on
set autoindent smartindent
" set autoindent
" recursive filename search for tab-completion
set path+=**
" display matching filenames on tab-complete
set wildmenu
set nocompatible
set scrolloff=2
set incsearch
set splitright

set backspace=indent,eol,start " shortcut: `:set bs=2`

" beautify :edit, :Ex   |netrw-browse-maps|
" e.g. use <cr>,v, t to split, p to preview
" let g:netrw_banner=0                               " disable banner
let g:netrw_browse_split=4                        " open in prior window
let g:netrw_altv=1                                        " <cr>v to split right
let g:netrw_liststyle=3                 " tree view
if system('uname -s') == "Darwin\n"
  let g:netrw_list_hide=netrw_gitignore#Hide()
endif

" build index
" command! MakeTags !ctags -R .
" then use ^[, g^[, ^t  to jump to definitions/declarations
set tags+=~/tags


" UX - custom mappings
"
" normal-mode, non-recurvive, map to ":noh" after Enter
" nnoremap <C-n> :noh<cr>
nnoremap <leader>n :noh<cr>
nnoremap <C-w>d :quit<cr>

" Emacs style
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
inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi
inoremap <C-Y> <Esc>Pa
" inoremap <C-X><C-S> <Esc>:w<CR>a


" fix for backspace in OSX + zsh + vi
" inoremap '' dOD 



" UI
syntax enable
" syntax on
set number
set ruler
set cursorline
" set cursorcolumn
" set signcolumn=yes
set hlsearch
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
set listchars=trail:·
" note: 2nd char is '\ '
set listchars=tab:\|\ 
" set listchars=tab:\|·

" https://vim.fandom.com/wiki/Highlight_unwanted_spaces
highlight ExtraTabColor ctermfg=darkgray guifg=darkgray
2match ExtraTabColor /\t/
autocmd ColorScheme * highlight ExtraTabColor

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


" formatting
set tabstop=4
set shiftwidth=4
set softtabstop=4
"
" autocmd Filetype python          setlocal tabstop=4 ai
" autocmd Filetype sh    setlocal tabstop=4 ai
" autocmd Filetype json setlocal tabstop=2 ai
" autocmd Filetype yaml              setlocal tabstop=2 ai
" autocmd Filetype yml setlocal tabstop=2 ai
" autocmd Filetype shell              setlocal nocolor
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

