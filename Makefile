MODULE := dotfiles

BLUE='\033[0;34m'
NC='\033[0m' # No color

TAG := $(shell git describe --tags --always)

showenv:
	@echo 'Environment:'
	@echo '-----------------------'
	@echo 'Module:      '${MODULE}
	@echo 'Tag:         '${TAG}

install:
	@echo 'Installing dotfiles from Tag: '${TAG}
	@echo '-----------------------'
	@echo 'Installing ansible'
	@.local/bin/install-ansible.sh
	@echo '-----------------------'
	@ansible-playbook ansible-playbooks/setup.yml

test:
	@echo 'Testing installation of dotfiles from Tag: '${TAG}
	@echo '-----------------------'
	@echo 'Installing ansible'
	@.local/bin/install-ansible.sh
	@echo '-----------------------'
	@ansible-playbook ansible-playbooks/setup.yml --check
