#!/bin/bash

DOTROOT=$HOME/dev/src/github.com/KanchiShimono/dotfiles

if [ ! -e "$DOTROOT" ]; then
	echo "Installing Kanchi Shimono's dotfiles for the first time"
	git clone https://github.com/KanchiShimono/dotfiles.git "$DOTROOT"
	cd "$DOTROOT"
	make install
else
	echo "Dotfiles already exist in $DOTROOT"
	exit 0
fi
