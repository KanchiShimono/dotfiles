#!/bin/bash

# set GOPATH for go get command
export PATH="$PATH:$DOTROOT/bin"
# export GOPATH=$HOME/dev

# packages for python
# ------------------------------------------------------------------------------
# pip3 install \
#  black \
#  yapf \
#  mypy \
#  rope \
#  isort \
#  ipython \
#  jupyter \
#  pynvim \
#  Sphinx \
#  flake8 \
#  requests \
#  beautifulsoup4 \
#  lxml \
#  tqdm \
#  selenium \
#  pyarrow \
#  matplotlib \
#  numpy \
#  pandas \
#  pyspark \
#  xgboost \
#  lightgbm \
#  scikit-learn \
#  gensim \
#  mecab-python3

# Haskell
# ------------------------------------------------------------------------------
# stack setup

# go
# ------------------------------------------------------------------------------
# go get -u -v golang.org/x/tools/cmd/golsp
# go get -u -v github.com/motemen/gore
# go get -u -v github.com/ramya-rao-a/go-outline
# go get -u -v github.com/acroca/go-symbols
# go get -u -v github.com/rogpeppe/godef
# go get -u -v golang.org/x/tools/cmd/godoc
# go get -u -v github.com/zmb3/gogetdoc
# go get -u -v github.com/golang/lint/golint
# go get -u -v github.com/fatih/gomodifytags
# go get -u -v golang.org/x/tools/cmd/gorename
# go get -u -v sourcegraph.com/sqs/goreturns
# go get -u -v golang.org/x/tools/cmd/goimports
# go get -u -v github.com/cweill/gotests/...
# go get -u -v golang.org/x/tools/cmd/guru
# go get -u -v github.com/josharian/impl
# go get -u -v github.com/haya14busa/goplay/cmd/goplay
# go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs
# go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct
# go get -u -v github.com/alecthomas/gometalinter
# go get -u -v github.com/derekparker/delve/cmd/dlv

# julia
# ------------------------------------------------------------------------------
# julia -e 'for x in ARGS; Pkg.add("$x"); end;' \
#     PyPlot ProgressMeter DataFrames IJulia ParallelAccelerator HDF5 Lint \
#     BenchmarkTools DocOpt Gadfly Plotly ProfileView Images ForwardDiff \
#     PkgDev;
# julia -e 'for x in ARGS; Pkg.clone("$x"); end;' \
#     https://github.com/KanchiShimono/CubicEquation.jl \
#     https://github.com/KeitaNakamura/LinearEquations.jl \
#     https://github.com/KeitaNakamura/ElementTestSimulator.jl \
#     https://github.com/KeitaNakamura/PyPlotUtils.jl;
