ansible ansibleclient01 -m setup -i a00_Inventory.ini
ansible ansibleclient01 -m setup -i a00_Inventory.ini | less
ansible ansibleclient01 -m setup -a ""filter=*ipv4*"" -i a00_Inventory.ini
ansible ansibleclient01 -m setup -a ""filter=hostname"" -i a00_Inventory.ini"
ansible dev -m setup -i a00_Inventory.ini | grep memfree
ansible dev -m setup -i a00_Inventory.ini | less
ansible dev -m shell -a "free -m" -i a00_Inventory.ini
