#!/bin/bash

# zsh
#---------------------------------------------------------------------------
brew install zsh
# Don't forget to add `/usr/local/bin/zsh` to `/etc/shells` before
# runnnig `chsh`
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
	echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells
	chsh -s /usr/local/bin/zsh
fi
brew install sheldon

brew tap homebrew/cask-versions
# Languages
#---------------------------------------------------------------------------
# C / C++
brew install gcc
brew install llvm
brew install boost
brew install eigen
brew install libomp
# Python
brew install rye

# Shell Utilities
#---------------------------------------------------------------------------
brew install cmake
brew install tmux
brew install fzf
brew install sk
brew install ctags
brew install pandoc
brew install nkf
brew install ffmpeg
brew install ninja
brew install rename
brew install tree
brew install sl
brew install jq
brew install ghostscript
brew install imagemagick
brew install gh
brew install eza
brew install bat
brew install fd
brew install procs
brew install git-delta
brew install ripgrep
brew install tokei
brew install diskonaut
brew install hexyl
brew install starship
brew install silicon

# Vim
#---------------------------------------------------------------------------
brew install vim
# brew install macvim
brew install neovim

# Network
#---------------------------------------------------------------------------
brew install nmap
brew install telnet
brew install wget

# Application Development
#---------------------------------------------------------------------------
brew install docker
brew install mise
brew install jdx/tap/usage

# Data Science
#---------------------------------------------------------------------------
brew install swig

# Others
#---------------------------------------------------------------------------
brew install qt
brew install qt5
brew install archey
brew install figlet
brew install screenfetch

# Font
#---------------------------------------------------------------------------
brew install fontforge
brew tap sanemat/font
brew install ricty --with-powerline
