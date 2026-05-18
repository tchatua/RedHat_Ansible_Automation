#! /bin/bash

sudo hostnamectl set-hostname ansibleawx

# Update the system
sudo apt update -y


# ################# # sudo dnf update -y
# #################
# ################# # ######################################
# ################# # install Ansible core package
# ################# # ######################################
# ################# 
# ################# sudo dnf install -y ansible-core
# ################# ansible --version
# ################# 
# ################# # Install Pip for Python 3
# ################# sudo dnf install python3-pip -y
