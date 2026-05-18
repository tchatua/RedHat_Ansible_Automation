# Troubleshooting Ansible

## Log files for Ansible

```sh
ls -altr /etc/ansible/ansible.cfg
-rw-r--r--. 1 root root 806 May  7 00:39 /etc/ansible/ansible.cfg

sudo chmod 777 /etc/ansible/ansible.cfg

[ec2-user@ansiblecontroller ~]$ ls -altr /etc/ansible/ansible.cfg
-rwxrwxrwx. 1 root root 806 May  7 00:39 /etc/ansible/ansible.cfg

```

![alt text](image.png)

![alt text](image-1.png)

## The debug module

## Managing Errors

![alt text](image-2.png)

## Debugging

![alt text](image-3.png)

## check_mode

```sh
ansible-playbook a03_httpd_installation.yml -i a00_Inventory.ini --check
```

![alt text](image-4.png)
--------------------