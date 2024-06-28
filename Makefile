MODULE := dotfiles

BLUE='\033[0;34m'
NC='\033[0m' # No color

TAG := $(shell git describe --tags --always)

showenv:
	@echo 'Environment:'
	@echo '-----------------------'
	@echo 'Module:      '${MODULE}
	@echo 'Tag:         '${TAG}


install-ansible:
	@echo 'Installing ansible'
	@sudo apt update
	@sudo apt install software-properties-common -y
	@sudo add-apt-repository --yes --update ppa:ansible/ansible
	@sudo apt install ansible -y 

install:
	@echo 'Installing dotfiles from Tag: '${TAG}
	@echo '-----------------------'
	@echo 'Installing ansible'
	@$(MAKE) install-ansible
	@echo '-----------------------'
	@echo 'Installing ansible dependencies'
	@ansible-galaxy install -r requirements.yml
	@echo '-----------------------'
	@ansible-playbook ansible-playbooks/setup.yml

test:
	@echo 'Testing installation of dotfiles from Tag: '${TAG}
	@echo '-----------------------'
	@echo 'Installing ansible'
	@$(MAKE) install-ansible
	@echo '-----------------------'
	@echo 'Installing ansible dependencies'
	@ansible-galaxy install -r requirements.yml
	@echo '-----------------------'
	@ansible-playbook ansible-playbooks/setup.yml --check

local-test:
	@echo 'Testing installation of dotfiles from Tag: '${TAG}
	@echo '-----------------------'
	@echo 'Installing ansible'
	@$(MAKE) install-ansible
	@echo '-----------------------'
	@echo 'Installing ansible dependencies'
	@ansible-galaxy install -r requirements.yml
	@echo '-----------------------'
	@ansible-playbook ansible-playbooks/setup.yml --check -K

local-install:
	@echo 'Installing dotfiles from Tag: '${TAG}
	@echo '-----------------------'
	@echo 'Installing ansible'
	@$(MAKE) install-ansible
	@echo '-----------------------'
	@echo 'Installing ansible dependencies'
	@ansible-galaxy install -r requirements.yml
	@echo '-----------------------'
	@ansible-playbook ansible-playbooks/setup.yml -K
