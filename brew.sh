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

brew tap homebrew/cask-versions
# Languages
#---------------------------------------------------------------------------
# C / C++
brew install gcc
brew install llvm
brew install boost
brew install eigen
brew install libomp
# python 2
brew install python@2
# python 3
brew install python
brew install pyenv
# Haskell
brew install ghc
brew install haskell-stack
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
# Some packages dependent on java so java cask package is installed here
brew cask install java
brew cask install java8
brew install maven
brew install tomcat
# julia
# brew tap staticfloat/julia
# brew install julia
# swift
brew install sourcekitten
# rust
brew install rustup-init

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
brew install gh
brew install exa
brew install bat
brew install fd
brew install procs
brew install ripgrep
brew install tokei

# Vim
#---------------------------------------------------------------------------
brew install vim --with-lua
brew install macvim --with-lua
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

# Application Development
#---------------------------------------------------------------------------
brew install k9s
brew install kustomize

# Data Science
#---------------------------------------------------------------------------
brew install apache-spark
brew install swig
brew install mecab
brew install mecab-ipadic

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
