#!/bin/bash

# set GOPATH for go get command
export PATH="$PATH:$DOTROOT/bin"
export GOPATH=$HOME/dev

go get github.com/KanchiShimono/srcmgr
go get github.com/motemen/gore
git-get KanchiShimono/CubicEquation.jl
git-get KeitaNakamura/JFEM.jl
git-get KeitaNakamura/MaterialModels.jl
git-get KeitaNakamura/LinearEquations.jl
git-get KeitaNakamura/ElementTestSimulator.jl
git-get KeitaNakamura/PyPlotUtils.jl
git-get apple/swift
git-get neovim/neovim
git-get JuliaLang/julia
git-get google/benchmark
git-get google/material-design-icons
git-get google/web-starter-kit
