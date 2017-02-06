#!/bin/bash

# packages for python
# ------------------------------------------------------------------------------
pip3 install numpy pandas matplotlib tqdm Sphinx jupyter
pip2 install numpy pandas matplotlib tqdm Sphinx jupyter
# python2 -m pip install ipykernel
# python2 -m ipykernel install --user
pip3 install neovim
pip2 install neovim

# julia
# ------------------------------------------------------------------------------
julia -e 'for x in ARGS; Pkg.add("$x"); end;' \
	PyPlot ProgressMeter DataFrames IJulia ParallelAccelerator HDF5 Lint \
	BenchmarkTools DocOpt Gadfly Plotly ProfileView Images ForwardDiff;
julia -e 'for x in ARGS; Pkg.clone("$x"); end;' \
	https://github.com/KanchiShimono/CubicEquation.jl \
	https://github.com/KeitaNakamura/LinearEquations.jl \
	https://github.com/KeitaNakamura/TensorSymbolicNotation.jl \
	https://github.com/KeitaNakamura/ElementTestSimulator.jl \
	https://github.com/KeitaNakamura/ElementSimulator.jl \
	https://github.com/KeitaNakamura/PyPlotUtils.jl;

# pure prompt
# ------------------------------------------------------------------------------
npm install --global pure-prompt
