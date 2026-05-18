#!/bin/bash
sudo du -

wget https://dlcdn.apache.org/maven/maven-3/3.9.12/binaries/apache-maven-3.9.12-bin.zip



sudo dnf install -y unzip

unzip apache-maven-3.9.12-bin.zip

mv apache-maven-3.9.12 apache-maven


# Configure Environment Variables
vi ~/.bashrc

# Add this
export MAVEN_HOME=/opt/maven
export PATH=$MAVEN_HOME/bin:$PATH


# Apply Changes
source ~/.bashrc

mvn -version

