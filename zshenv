# Export modified PATH
typeset -U PATH path

# Pyenv and Poetry setup
export PYENV_ROOT="$HOME/.pyenv"
export POETRY_ROOT="$HOME/.poetry/bin"

path=("$PYENV_ROOT"
      "$POETRY_ROOT"
      "/usr/local/opt/openssl/bin"
      "/usr/local/homebrew"
      "/Users/michal/.go/goroot/current/bin"
      "/Users/michal/.go/gopath/bin"
      "/Users/michal/.dotfiles/scripts"
      "$path[@]")
export PATH

# Added Java home path
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home"

# Bibliography file
export BIB='/Users/michal/Documents/_files/_research/monograph/body/thesis/local_bibliography.bib'

# Scikit-learn C compilation env variables
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
export CPPFLAGS="$CPPFLAGS -Xpreprocessor -fopenmp"
export CFLAGS="$CFLAGS -I/usr/local/opt/libomp/include"
export CXXFLAGS="$CXXFLAGS -I/usr/local/opt/libomp/include"
export LDFLAGS="$LDFLAGS -Wl,-rpath,/usr/local/opt/libomp/lib -L/usr/local/opt/libomp/lib -lomp"
