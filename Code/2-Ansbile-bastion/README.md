We will be using ansible to install some dependencies on our bastion host, for example tools needed to generate Certificates and keys.

Ansible Vault
Group vars
Inventory file/host file
ansible.cfg file

This will print all facts about the host:

```
ansible bastion -m setup
```
