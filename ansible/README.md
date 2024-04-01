# Ansible


## Install Ansible

Check the Python interpreter path to verify if the target Ansible interpreter
on the host has the Python Ansible package installed.

```sh
python3 -m pip install --user ansible
```


## Test connection

The connection to the localhost in the Ansible inventory is set to be local in
order to skip the SSH tunneling.

```sh
ansible localhost -m ping
```


## Run the setup playbook

Here is how to run it:

```sh
ansible-playbook setup.yaml --ask-vault-pass
```

The playbook will run all the specified roles in the `setup.yaml` file. It's
possible to use `--tags` and `--limit` to narrow down the scope of planned
changes to apply.


## Planned changes

As for the planned changes, the following roles are to be implemented:

1. Changes in the Neovim role
    - Install plugins for html, css, htmx
    - Provide LSP support for Go Templ and htmx
2. Changes in the Go role
    - Install Go templ
