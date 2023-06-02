#!/usr/bin/env bash
if [ ! $(which ansible) ]; then
    sudo apt update 
    sudo apt install software-properties-common -y
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install ansible -y 
fi
