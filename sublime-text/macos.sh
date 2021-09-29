#!/bin/bash

DOTFILES_ROOT="`pwd`"

source="$DOTFILES_ROOT/sublime-text/User"
dest="$HOME/Library/Application Support/Sublime Text/Packages/User"

rm -rf "$dest"
ln -s "$source" "$dest"
