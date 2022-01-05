# Installation

The installation process relies on `stow` and `git` to, first, download files
and then put them in the right places.

Clone the repository and then use `stow` to put configuration files to symlink
them to predefined paths.

```sh
stow @*/
```

Alternatively, it is also possible to only selected configuration files with
`stow @neovim` in order to just insert `neovim` files.

I decided to put `@` in front of those directories that I want to maintain using
`stow` so you can either change it or make sure that you put the `@` symbol
in front of the dir name.


## List of programs

There is a list of programs that I use on daily basis. I am on a Mac right
now, so I am using `brew` to manage programs.

Here is a way to install all the programs:

```sh
xargs -L 1 brew install < programs
```

And here is one way to uninstall all programs in one go:

```sh
brew list | xargs brew uninstall --force
```


## Loading launch agents on MacOS

To make sure that server daemons run at the system startup for a specific user,
there is launchctl that lets you execute a given program at startup. There
are two launch agents in the `startup` directory that has to be copied to
`$HOME/Library/LaunchAgents` and loaded with this command:

```sh
launchctl load -w ~/Library/LaunchAgents/com.gsnipd.plist
```

The `-w` flag makes sure it is loaded on each startup.

Here is how to unload an agent:

```sh
launchctl unload -w ~/Library/LaunchAgents/com.gsnipd.plist
```

You can use `launchctl list` to peek at loaded agents.


## The Go programming language installation

In the `go/` directory there is `go.sh` script that takes care of the Go
programming language setup. The script takes two parameters:

1) The version of the programming language
2) The installation directory

There is also a file with the Go environmental variables, `shell.d/.goenv`.

