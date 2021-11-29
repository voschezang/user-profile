#!/bin/bash

# compatible with bash, zsh

# originally created by Jeffrey

# Get the git branch if the current directory is a git checkout
function parse_git_branch() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
  [ "$(git status -s 2> /dev/null)" != '' ] && DIRTY='+'
  echo "${BRANCH}${DIRTY}"
}

# set default editor
export VISUAL=vim
export EDITOR="$VISUAL"
# setup vim shell
set -o vi

# make sure bash respects CTRL-D (EOF) to logout
export IGNOREEOF=0

# make sure less is set to something sensible
export LESS=FRX

# Set GPG prompt
export GPG_TTY=$(tty)

export ANSIBLE_NOCOWS=1

# aliases
alias python=python3
alias py=python
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias ls='ls -Fh --color'
  alias ll='ls -lh --color'
  alias la='ls -lAh --color'
  # alias 'cd ...'='cd ../..'
fi
alias cdiff='git diff --color'
alias gib='git branch'
alias gic='git checkout'
alias gid='git diff'
alias gim='git checkout master'
alias gimn='git checkout main'
alias gip='git pull'
alias gips='git push'
alias gis='git status'

alias 'pyut'='python3 -m unittest'
