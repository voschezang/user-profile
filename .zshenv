#!/bin/zsh
echo "zshenv"

# not compatible with zsh

# blend vi, emacs
set -o vi

# list options with `bindkey -a`

# fix backspace key behaviour after visual mode
bindkey -v '^?' backward-delete-char
# use vim-style 
bindkey -v "^P" history-search-backward
bindkey -v "^N" history-search-forward

# not supported
# bindkey -a "." insert-last-argument

# emacs style
bindkey -v "" beginning-of-line
bindkey -v "" end-of-line

# C-a,b,e,f,k,u,y etc are setup in .vimrc

