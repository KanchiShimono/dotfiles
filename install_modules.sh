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
pip3 install numpy pandas matplotlib ipython tqdm Sphinx jupyter flake8 beautifulsoup4 requests lxml selenium
pip2 install numpy pandas matplotlib ipython tqdm Sphinx jupyter selenium
# python2 -m pip install ipykernel
# python2 -m ipykernel install --user
pip3 install pynvim
pip2 install pynvim

# Haskell
# ------------------------------------------------------------------------------
stack setup

# go
# ------------------------------------------------------------------------------
go get -u -v github.com/mdempsky/gocode
go get -u -v github.com/motemen/gore
go get -u -v github.com/ramya-rao-a/go-outline
go get -u -v github.com/acroca/go-symbols
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/godoc
go get -u -v github.com/zmb3/gogetdoc
go get -u -v github.com/golang/lint/golint
go get -u -v github.com/fatih/gomodifytags
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v sourcegraph.com/sqs/goreturns
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v github.com/cweill/gotests/...
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v github.com/josharian/impl
go get -u -v github.com/haya14busa/goplay/cmd/goplay
go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs
go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct
go get -u -v github.com/alecthomas/gometalinter
go get -u -v github.com/derekparker/delve/cmd/dlv

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
