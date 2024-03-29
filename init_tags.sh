#!/bin/bash
# Usage: init_tags [ROOT_DIR] [ctags-args]
OPTIONS='--extra=+f --python-kinds=-i'
EXCLUDE='--exclude=@.ctagsignore'

root_dir='.'
if [[ "$OSTYPE" == "darwin"* ]]; then
    root_dir=~/'src'
fi
if [ ! -z "$1" ]; then
    root_dir=$1
    shift
fi
echo "'ctags -R $OPTIONS $EXCLUDE -o ~/tags $root_dir $@'"
ctags -R $OPTIONS $EXCLUDE -o ~/tags $root_dir $@
