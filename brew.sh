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
brew install zsh-autosuggestions
brew install zsh-completions
brew install zsh-syntax-highlighting

# Languages
#---------------------------------------------------------------------------
# C / C++
brew install gcc
brew install llvm
brew install boost
brew install eigen
# python 2
brew install python
# python 3
brew install python3
# ruby
brew install ruby
# perl
brew install perl
# Go
brew install go
# D
brew install dmd
# lua
brew install lua
brew install luajit
# node
brew install node
# java
brew install maven
brew install tomcat
# julia
# brew tap staticfloat/julia
# brew install julia
# swift
brew install sourcekitten

# Shell Utilities
#---------------------------------------------------------------------------
brew install cmake
brew install tmux
brew install git-flow
brew install the_silver_searcher
brew install the_platinum_searcher
brew install fzf
brew install ctags
brew install pandoc
brew install reattach-to-user-namespace
brew install nkf
brew install ffmpeg
brew install ninja
brew install rename
brew install tree
brew install sl
brew install ghostscript
brew install imagemagick --with-ghostscript
brew install diff-so-fancy

# Vim
#---------------------------------------------------------------------------
brew install vim --with-python3 --with-lua
brew install macvim --with-python3 --with-lua
brew install neovim
ln -sfv ~/.vimrc ~/.config/nvim/init.vim
ln -sfv ~/.gvimrc ~/.config/nvim/ginit.vim

# Xcode
#---------------------------------------------------------------------------
brew install cocoapods

# Network
#---------------------------------------------------------------------------
brew install nmap
brew install telnet

# Others
#---------------------------------------------------------------------------
brew install qt
brew install qt5
brew install archey
brew install figlet
brew install screenfetch

# Font
#---------------------------------------------------------------------------
brew tap sanemat/font
brew install ricty --with-powerline
