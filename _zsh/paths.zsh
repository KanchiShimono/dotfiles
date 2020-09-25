typeset -U path PATH fpath

export PATH="$PATH:$HOME/dev/src/github.com/KanchiShimono/dotfiles/bin"
export PATH="$PATH:$HOME/.vim/syntax_checker"
export PATH="$PATH:$HOME/.local/bin"
export GOPATH="$HOME/dev"
export GOOS="darwin"
export GOARCH="amd64"
export PATH="$PATH:$GOPATH/bin"
export JAVA_HOME=$(/usr/libexec/java_home -v "1.8")
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYSPARK_PYTHON="$HOME/.pyenv/shims/python"
export PYSPARK_DRIVER_PYTHON="$HOME/.pyenv/shims/python"
export PATH="$HOME/.cargo/bin:$PATH"
export QT_HOMEBREW=true
export HOMEBREW_NO_INSTALL_CLEANUP=true
# Avoid crashing macOS Mojave when use python multiprocessing
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# source /opt/intel/compilers_and_libraries_2017/mac/mkl/bin/mklvars.sh intel64 ilp64
# source /opt/intel/compilers_and_libraries_2017/mac/bin/compilervars.sh intel64
