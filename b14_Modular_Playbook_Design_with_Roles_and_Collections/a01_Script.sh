#!/bin/bash
mkdir a01_Ubuntu_Project
cd a01_Ubuntu_Project
ansible-galaxy init d01_roles/d01_user_create
ansible-galaxy init d01_roles/d02_time_zone_set
ansible-galaxy init d01_roles/d03_firewall_config
ansible-galaxy init d01_roles/d04_ssh_config






