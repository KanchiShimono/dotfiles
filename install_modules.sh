#!/bin/bash

# set GOPATH for go get command
export PATH="$PATH:$DOTROOT/bin"
export GOPATH=$HOME/dev

# pure prompt
# ------------------------------------------------------------------------------
npm install --global pure-prompt

# npm packages
# ------------------------------------------------------------------------------
npm install --global tern
npm install --global eslint
npm install --global neovim
npm install --global create-react-app

# packages for python
# ------------------------------------------------------------------------------
pip3 install numpy pandas matplotlib ipython tqdm Sphinx jupyter flake8 beautifulsoup4 requests lxml
pip2 install numpy pandas matplotlib ipython tqdm Sphinx jupyter
# python2 -m pip install ipykernel
# python2 -m ipykernel install --user
pip3 install neovim
pip2 install neovim

# Haskell
# ------------------------------------------------------------------------------
stack setup

# go
# ------------------------------------------------------------------------------
go get -u github.com/nsf/gocode
go get -u github.com/motemen/gore

# julia
# ------------------------------------------------------------------------------
julia -e 'for x in ARGS; Pkg.add("$x"); end;' \
	PyPlot ProgressMeter DataFrames IJulia ParallelAccelerator HDF5 Lint \
	BenchmarkTools DocOpt Gadfly Plotly ProfileView Images ForwardDiff \
	PkgDev;
julia -e 'for x in ARGS; Pkg.clone("$x"); end;' \
	https://github.com/KanchiShimono/CubicEquation.jl \
	https://github.com/KeitaNakamura/LinearEquations.jl \
	https://github.com/KeitaNakamura/ElementTestSimulator.jl \
	https://github.com/KeitaNakamura/PyPlotUtils.jl;
