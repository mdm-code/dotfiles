# Ansible


## Things to install

1. Zet - a personal knowledge management system
2. A list of other standalone programs
3. For Neovim install the following
    - Plugins for html, css, htmx
    - Go templ has to be installed with the Go task
    - LSP support for Go templ in Neovim
    - Htmx LSP support in Neovim


## Install Ansible

Check the Python interpreter path to verify if the target Ansible interpreter
on the host has the Python Ansible package installed. It might not work on
MacOS out of the box, and I would first recommend installing Pyenv first.

```sh
python3 -m pip install --user ansible
```


## Test connection

The connection to the localhost in the Ansible inventory is set to be local in
order to skip the SSH tunneling.

```sh
ansible hosts -i inventory.yaml -m ping
```


## Bootstrap the development environment

Here is how to run it:

```sh
ansible-playbook setup.yaml -i inventory.yaml --ask-vault-pass
```

It's possible to use `--tags` and `--limit` to narrow down the scope of planned
changes to apply.


## Environmental variables used in Ansible setup

- `$HOME`
- `$USER`
