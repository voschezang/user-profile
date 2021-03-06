#!/bin/bash

# compatible with bash, zsh

# originally created by Jeffrey

# Get the git branch if the current directory is a git checkout
function parse_git_branch() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
  [ "$(git status -s 2> /dev/null)" != '' ] && DIRTY='+'
  echo "${BRANCH}${DIRTY}"
}

# set default editor (open with `v` in cmd mode)
export VISUAL=vim
export EDITOR="$VISUAL"
# setup vim shell
set -o vi

# TODO check diff bind -m vi-... and set editing-mode vi ...
set editing-mode vi "\C-r": reverse-search-history
set editing-mode vi "\C-s": forward-search-history
set editing-mode vi "\C-o": operate-and-get-next

# make sure bash respects CTRL-D (EOF) to logout
export IGNOREEOF=0

# make sure less is set to something sensible
export LESS=FRX

# Git name
export GIT_AUTHOR_NAME="Mark Voschezang"
export GIT_AUTHOR_EMAIL="mark.voschezang@nl.abnamro.com"
export GIT_COMMITTER_NAME="Mark Voschezang"
export GIT_COMMITTER_EMAIL="mark.voschezang@nl.abnamro.com"

# Set prompt user@host
# export PS1="\[\033[01;32m\]\u@\h\\[\033[38;5;11m\]\$(parse_git_branch)\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "
# export PS1="\[\033[01;32m\]\u@wsl\\[\033[38;5;11m\]\$(parse_git_branch)\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "

# Set GPG prompt
export GPG_TTY=$(tty)

# start ssh-agent daemon (alt: use keychain)
eval `ssh-agent -s`
[[ $(pgrep ssh-add) -eq 0 ]] && ssh-add

# aliases
alias python=python3
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias ls='ls -Fh --color'
  alias ll='ls -lh --color'
  # alias 'cd ...'='cd ../..'
fi
alias 'cdiff'='git diff --color'
# alias view='vi -R'
# alias 'gib'='git branch'
# alias 'gis'='git status'

