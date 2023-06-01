# dotfiles
Repository of configuration files for setting up my development environment. Using a combination of bash scripts and ansible playbooks the process of getting an environment setup is almost completely automated.

![powerline](./assests/powerline.png)

![vim](./assests/vim.png)

## Compatible OSs
* Ubuntu 20.04 LTS
* WSL Ubuntu 20.04 LTS
* Ubuntu 22.04 LTS
* WSL Ubuntu 22.04 LTS

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
3. Install dependencies
```
ansible-galaxy install -r requirements.yml
```
4. Run ansible playbooks
```
cd ansible-playbooks
ansible-playbook setup.yml --ask-become-pass
```
## Features
### Powerline
I use powerline for my terminal prompt. I have a simple setup that will display the current directory and the current git branch, as well as any active python virtual environment.

### VIM
A relatively simple vim configuration that uses the powerline plugin to display a status bar, nerdtree for file tree navigation, and a few other features.

*Plugins*
* [Vundle](https://github.com/VundleVim/Vundle.vim)
* [nerdtree](https://github.com/preservim/nerdtree)
* [vim-buftabline](https://github.com/ap/vim-buftabline)
* [pylint](https://github.com/vim-scripts/pylint.vim)
* [vim_codex](https://https://github.com/tom-doerr/vim_codex)

*Color Schemes*
* [badwolf](https://github.com/sjl/badwolf)

### Ruby
* [mdless](https://github.com/ttscoff/mdless) is a gem that allows you to display markdown in your terminal.

### NodeJS
* [Nvm](https://github.com/nvm-sh/nvm) is a node version manager that allows you to install and manage multiple versions of node.

### Python
* [Poetry](https://github.com/python-poetry/poetry) helps you declare, manage and install dependencies of Python projects, ensuring you have the right stack everywhere.

* [Pyenv](https://github.com/pyenv/pyenv) lets you easily switch between multiple versions of Python. It's simple, unobtrusive, and follows the UNIX tradition of single-purpose tools that do one thing well.

* [Pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv) is a plugin for Pyenv that allows you to create and manage virtual environments.

### Go
* Installs latest version of Go
