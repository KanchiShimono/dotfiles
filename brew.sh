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
brew install llvm --with-clang
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
# julia
brew tap staticfloat/julia
brew install julia

# Shell Utilities
#---------------------------------------------------------------------------
brew install cmake
brew install tmux
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
brew install sl
brew install ghostscript
brew install imagemagick --with-ghostscript

# Vim
#---------------------------------------------------------------------------
brew install vim --with-lua --with-luajit
brew install macvim --with-lua --with-luajit
brew tap neovim/neovim
brew install neovim
ln -sfv ~/.vimrc ~/.config/nvim/init.vim
ln -sfv ~/.gvimrc ~/.config/nvim/ginit.vim
# Install vim-plug for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install vim-plug for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Xcode
#---------------------------------------------------------------------------
brew install cocoapods

# Others
#---------------------------------------------------------------------------
brew install qt
brew install qt5
brew install archey

# Font
#---------------------------------------------------------------------------
brew tap sanemat/font
brew install ricty --vim-powerline
