#! /bin/bash

# sudo dnf update -y

sudo dnf install -y ansible-core
ansible --version

sudo hostnamectl set-hostname ansiblecontroller



