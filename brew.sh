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
brew install nodenv
# java
# Some packages dependent on java so java cask package is installed here
brew install java
brew cask install adoptopenjdk
brew install maven
brew install tomcat
# julia
# julia package is moved to cask
# swift
brew install sourcekitten
# rust
brew install rustup-init
# terraform
brew install tfenv

# Shell Utilities
#---------------------------------------------------------------------------
brew install cmake
brew install tmux
brew install git-flow
brew install the_silver_searcher
brew install the_platinum_searcher
brew install fzf
brew install sk
brew install ctags
brew install pandoc
brew install reattach-to-user-namespace
brew install nkf
brew install ffmpeg
brew install ninja
brew install rename
brew install tree
brew install sl
brew install jq
brew install ghostscript
brew install imagemagick
brew install diff-so-fancy
brew install gh
brew install exa
brew install bat
brew install fd
brew install procs
brew install git-delta
brew install ripgrep
brew install tokei
brew install diskonaut
brew install hexyl
brew install starship

# Vim
#---------------------------------------------------------------------------
brew install vim
# brew install macvim
brew install neovim

# Xcode
#---------------------------------------------------------------------------
brew install cocoapods

# Network
#---------------------------------------------------------------------------
brew install nmap
brew install telnet
brew install wget

# Application Development
#---------------------------------------------------------------------------
brew install docker
brew install docker-completion
brew install docker-compose-completion
brew install k9s
brew install kustomize
brew install kompose

# Data Science
#---------------------------------------------------------------------------
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
brew install fontforge
brew tap sanemat/font
brew install ricty --with-powerline
