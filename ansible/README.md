# Ansible


## Can be installed with apt:
- bash (already done)
- docker (done)
- entr
- fd (fd-find)
- firefox (has to add repository to apt)
- fzf
- gh
- git (already installed)
- go (manual install)
- goreleaser (has to add repository to apt)
- helm (has to add repository to apt)
- htop
- jq
- k9s (not possible right off the bat)
- karabiner (not needed on debian)


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


## Test Ansible roles in the setup playbook

The `test-on-linux` shell script can be used to test parts of the setup
playbook inside of a Linux container. Here, I used Ubuntu because that's what I
usually use at work either as the main OS or in WSL on Windows.
