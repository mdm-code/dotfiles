Go Ansible installation steps (in random order):
1.  Create .config/go/goenv file and the directory
2.  The file has Go envs that are sourced in the bashrc
3.  Make sure Curl is available
4.  Modify the installation script
5.  The OS and ARCH can be pulled from Ansible itself and templated into script
6.  So can be the remaining vars
7.  other commands or shell builtins like mkdir, tar, mv, ln, rm, echo, exit,
    mktemp, set are fine
8.  Change the current symlink
9.  But first check if the Go version that's going to be installed is present
10. Then all the rest of my commands can be installed with Go: tq, duct, tcols
