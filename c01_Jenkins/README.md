# Jenkins

## Destrroying a specoic ec2 instance

```sh
terraform state list | grep ec2_ansible

terraform state list | grep ec2_ansibleclient

erraform destroy -target=module.ec2_ansibleclient["1"].aws_instance.this[0]
# terraform destroy -target=aws_instance.ansible_controller


```

## Java 8 Installation --> Prerequisite

```SH
[ec2-user@jenkins ~]$ sudo yum list | grep java

# Jenkins Prerequisite (Java Requirement) requires Java 17 or Java 21 on Amazon Linux 2023
# Java 8 (Corretto 1.8) is NOT supported by modern Jenkins versions.
sudo dnf install java-17-amazon-corretto -y

[ec2-user@jenkins ~]$ java --version
openjdk 17.0.18 2026-01-20 LTS
OpenJDK Runtime Environment Corretto-17.0.18.9.1 (build 17.0.18+9-LTS)
OpenJDK 64-Bit Server VM Corretto-17.0.18.9.1 (build 17.0.18+9-LTS, mixed mode, sharing)



```

![alt text](image.png)
![alt text](image-1.png)

## jenkins Installation

- url: https://www.jenkins.io/doc/book/installing/linux/#red-hat-centos

```sh
[ec2-user@jenkins ~]$ sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm-stable/jenkins.repo

sudo yum upgrade -y

# Add required dependencies for the jenkins package
# sudo yum install fontconfig java-21-openjdk
sudo yum install jenkins -y

[ec2-user@jenkins ~]$ sudo systemctl status jenkins
○ jenkins.service - Jenkins Continuous Integration Server
     Loaded: loaded (/usr/lib/systemd/system/jenkins.service; disabled; preset: disabled)
     Active: inactive (dead)

[ec2-user@jenkins ~]$ sudo systemctl start jenkins

[ec2-user@jenkins ~]$ sudo systemctl enable jenkins
Created symlink /etc/systemd/system/multi-user.target.wants/jenkins.service → /usr/lib/systemd/system/jenkins.service.

# To retrieve the Jenkins initial admin password after installation on Red Hat 9, run this command:
[ec2-user@jenkins ~]$ sudo cat /var/lib/jenkins/secrets/initialAdminPassword
81bdec80b90d4720b1bde42b3584ebca

```

- Stop all ec2

```sh
aws ec2 describe-instances \
    --filters "Name=instance-state-name,Values=running" \
    --query "Reservations[*].Instances[*].InstanceId" \
    --output text

aws ec2 stop-instances \
    --instance-ids $(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].InstanceId" --output text)
```