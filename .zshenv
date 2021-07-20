#!/bin/zsh

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
bindkey "^R" history-incremental-search-backward
bindkey -v "" beginning-of-line
bindkey -v "" end-of-line
# bindkey -v "≥":yank-last-argument
bindkey -v '≥' insert-last-word

# C-a,b,e,f,k,u,y etc are setup in .vimrc
 

# [[ $(pgrep ssh-add) -eq 0 ]] && ssh-add 2>/dev/null
