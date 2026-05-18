# Assignment - Ad Hoc Commands

## Assignment instructions

1. Install Ansible on your local machine or a server.

2. Set up a few remote hosts (virtual machines or containers) that you can connect to using SSH.

## Questions for this assignment

1. Write the steps to connect to the remote hosts.
2. How can the connectivity for all hosts mentioned in the inventory be tested using an adhoc command?
3. Write some basic command on remote hosts.
4. Execute ad hoc commands with modules like shell & file.
5. Execute ad hoc commands with become
6. Execute multiple commands in a single ad hoc command.
7. Conclusion

## Answers for this assignment

1. Write the steps to connect to the remote hosts.

```sh
#1 -----------------------------------------------------------------------
# Generate SSH key: 
[ansadmin@ansiblecontroller ~]$ ssh-keygen -t ed25519
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/ansadmin/.ssh/id_ed25519):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/ansadmin/.ssh/id_ed25519
Your public key has been saved in /home/ansadmin/.ssh/id_ed25519.pub
The key fingerprint is:
SHA256:10IBEVEDWp7nFBAZl5CXfK/RxOtxJp03b0FJaPh1Yvw ansadmin@ansiblecontroller
The key's randomart image is:
+--[ED25519 256]--+
|        %/*o.oo..|
|       +oo==.o*+.|
|      . o.+.o=o=o|
|         = ...*+E|
|        S + .+ ==|
|         . .. . o|
|               . |
|                 |
|                 |
+----[SHA256]-----+
```

```sh
# -----------------------------------------------------------------------
#2 Copy key to hosts: 
# ssh-copy-id user@host
[ansadmin@ansiblecontroller ~]$ ssh-copy-id ansibleclient01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/ansadmin/.ssh/id_ed25519.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
ansadmin@ansibleclient01's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'ansibleclient01'"
and check to make sure that only the key(s) you wanted were added.
```
```sh
# -----------------------------------------------------------------------
[ansadmin@ansiblecontroller ~]$ ssh-copy-id ansibleclient02
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/ansadmin/.ssh/id_ed25519.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
ansadmin@ansibleclient02's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'ansibleclient02'"
and check to make sure that only the key(s) you wanted were added.

# -----------------------------------------------------------------------
# Add Client Machines into Ansible Inventory Files 
[ec2-user@ansiblecontroller ~]$ sudo vi /etc/ansible/hosts
...
[dev]
ansibleclient01 ansible_host=10.0.11.248 ansible_user=ubuntu ansible_ssh_private_key_file=/home/ec2-user/terraform_key_pem.pem ansible_python_interpreter=/usr/bin/python3
ansibleclient02 ansible_host=10.0.12.199 ansible_user=ubuntu ansible_ssh_private_key_file=/home/ec2-user/terraform_key_pem.pem ansible_python_interpreter=/usr/bin/python3


```

```sh
# -----------------------------------------------------------------------
# Test login: 

ssh user@host

```
2. How can the connectivity for all hosts mentioned in the inventory be tested using an adhoc command?
3. Write some basic command on remote hosts.
4. Execute ad hoc commands with modules like shell & file.
5. Execute ad hoc commands with become
6. Execute multiple commands in a single ad hoc command.
7. Conclusion


## 

1. Write the steps to connect to the remote hosts.
    - Connect to the remote hosts:
        - Ensure that you have SSH access to the remote hosts.
        - Update the inventory file with the IP addresses or hostnames of the remote hosts.

2. How can the connectivity for all hosts mentioned in the inventory be tested using an adhoc command?
    - Execute the following ad hoc command to test the connectivity to the remote hosts:
        - **ansible all -i inventory.ini -m ping**
    - Verify that the command returns a "SUCCESS" message for each host, indicating successful connectivity.

3. Write some basic command on remote hosts.
    - Use the command module to execute a basic command on all hosts. For example, retrieve the hostname:
        - **ansible all -i inventory.ini -m command -a "hostname"**

    - Note down the hostname output from each host.

4. Execute ad hoc commands with modules like shell & file.
    - Use the appropriate module to execute specific tasks on remote hosts:
        - Use the shell module to execute a shell command. For example, retrieve the disk space usage:
            - **ansible all -i inventory.ini -m shell -a "df -h"**
        - Use the file module to manage files and directories. For example, create a directory:
            - **ansible all -i inventory.ini -m file -a "path=/tmp/mydir state=directory"**
    - Explore other modules, such as copy, template, or lineinfile, to perform different tasks on the remote hosts.

5. Execute ad hoc commands with become
    - Use the -b option to execute ad hoc commands with elevated privileges (become the root user).
        - For example, retrieve the contents of a privileged file:
            - **ansible all -i inventory.ini -m shell -a "cat /etc/sudoers" -b**

    - Execute multiple commands in a single ad hoc command.
        - Enclose multiple commands in quotes and separate them with semicolons. For example, create a file and list its contents:
            - **ansible all -i inventory.ini -m shell -a "touch /tmp/myfile.txt; ls -l /tmp"**

6. Conclusion
    - Summarize your findings and observations from executing the ad hoc commands.
    - Reflect on the benefits and limitations of using ad hoc commands compared to writing playbooks.
