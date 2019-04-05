typeset -U path PATH fpath

export PATH="$PATH:$HOME/dev/src/github.com/KanchiShimono/dotfiles/bin"
export PATH="$PATH:$HOME/.vim/syntax_checker"
export PATH="$PATH:$HOME/.local/bin"
export GOPATH="$HOME/dev"
export GOOS="darwin"
export GOARCH="amd64"
export PATH="$PATH:$GOPATH/bin"
export JAVA_HOME=$(/usr/libexec/java_home -v "1.8")
export PYSPARK_PYTHON="/usr/local/bin/python3"
export PYSPARK_DRIVER_PYTHON="/usr/local/bin/python3"
export QT_HOMEBREW=true

# source /opt/intel/compilers_and_libraries_2017/mac/mkl/bin/mklvars.sh intel64 ilp64
# source /opt/intel/compilers_and_libraries_2017/mac/bin/compilervars.sh intel64
