#!/bin/bash

sudo dnf install java-17-amazon-corretto -y

java --version


sudo yum install -y wget

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm-stable/jenkins.repo

sudo yum upgrade -y

# Add required dependencies for the jenkins package
# sudo yum install fontconfig java-21-openjdk
sudo yum install jenkins -y

sudo systemctl status jenkins

sudo systemctl start jenkins

sudo systemctl enable jenkins
Created symlink /etc/systemd/system/multi-user.target.wants/jenkins.service → /usr/lib/systemd/system/jenkins.service.


sudo cat /var/lib/jenkins/secrets/initialAdminPassword

 







