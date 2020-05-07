# Export modified PATH
typeset -U PATH path
path=("/usr/local/opt/openssl/bin"
      "/usr/local/homebrew"
      "/Users/michal/Documents/python/miniconda3/bin"
      "/Users/michal/.go/goroot/current/bin"
      "/Users/michal/.go/gopath/bin"
      "/Users/michal/.dotfiles/scripts"
      "$path[@]")
export PATH

# Added Java home path
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home"

# Bibliography file
export BIB='~/Documents/_files/_research/monograph/body/thesis/local_bibliography.bib'
