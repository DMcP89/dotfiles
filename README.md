# dotfiles
Repository of configuration files for setting up my development environment. Using a combination of bash scripts and ansible playbooks the process of getting an environment setup is almost completely automated.

## Compatible OSs
* Ubuntu 20.04 LTS
* WSL Ubuntu 20.04 LTS

## Setup
1. Clone this repository
```
git clone https://github.com/DMcP89/dotfiles.git
```
2. Install Ansible
```
cd dotfiles
.local/bin/install-ansible.sh
```
3. Run ansible playbooks
```
cd ansible-playbooks
ansible-playbook setup.yml --ask-become-pass
```
## Features
### Powerline
### VIM
### Ruby
### NodeJs
### Python



