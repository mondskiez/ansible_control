# Deploy Ubuntu Servers with Ansible

![alt text](https://github.com/ansible/logos/blob/main/vscode-ansible-logo/vscode-ansible.png "Logo Title Text 1")

This is my own Ansible deployment for <strong><ins>`Ubuntu Servers`</ins></strong>

# Prerequisites

Existing Ubuntu Server with an existing user with sudo privilegdes

a. Create an ssh-key pair on Windows or Linux/MacOS

```bash
$ ssh-keygen -t ed25519 -C "add your comment for this key"
```

b. Specify the location of the key to be generated so you can put a name for quick reference

```bash
C:\Users\YourUser/.ssh/yourkey
```

c. The ssh-keygen will then generate your key pair to the location you specified using the filename your inputted in the location.
c. Copy your ssh-key to the remote server

1. Windows:

```bash
cat C:\Users\youruser/.ssh/yourgenerated.pub | ssh -p 22 remoteuser@remote-server-ip "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" 
```
2. Linux/MacOs:

```bash
$ -ssh-copy-id ~/.ssh/yoursshkey user@server-ip
```

# Setup your Inventory

First, setup your inventory by editing the file

  * ansible_control/<strong>*`hosts.yml`*</strong>

Second, configure your ansible config file
  
  * ansible_control/<strong>*`ansible.config`*</strong>

# Running the Play

From your terminal type:

```bash
ansible-playbook run.yml -K --limit 'remote-server1,remote-server2' -e 'ansible_user=remoteuser'
```

<strong><ins>`Notes`*</ins></strong> 

To run play with sudo password of remote-user add:

```bash
-K
```

To run play against a specific number of hosts use below  with comma(,) separated  hostnames

```bash
--limit 'host4,domain3,remote7'
```

To override the default user defined in the hosts.yml with the remote-user from the remote-server:

```bash
-e "ansible_user=remote-user"
```

:beers: and Enjoy.