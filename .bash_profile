#!/bin/bash

# not compatible with zsh

# blend vi, emacs
set -o vi

# list options with `bind -l`

bind -m vi-command ".":insert-last-argument
bind "\C-p":history-search-backward
bind "\C-n":history-search-forward

# emacs style
bind -m vi-insert "\C-l":clear-screen
bind -m vi-insert "\C-a":beginning-of-line
bind -m vi-insert "\C-e":end-of-line
# C-a,b,e,f,k,u,y etc are setup in .vimrc



# TODO check diff bind -m vi-... and set editing-mode vi ...
set editing-mode vi "\C-r": reverse-search-history
set editing-mode vi "\C-s": forward-search-history
set editing-mode vi "\C-o": operate-and-get-next


# check if ssh-add has already been called
if ! [ $( ssh-add -l &>/dev/null ) ]; then
    # use .ssh-agent with cache
    # [[ -r ~/.ssh-agent ]] && source .ssh-agent

    # if ! [ $( ssh-add -l &>/dev/null ) ]; then
        # (umask 066; ssh-agent > ~/.ssh-agent)
        # source .ssh-agent
        eval `ssh-agent -s`
        lifetime=$(expr 60 \* 60 \* 24 \* 2 )
        ssh-add -t "$lifetime" &>/dev/null
    # fi
fi
