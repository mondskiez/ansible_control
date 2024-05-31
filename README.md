# Deploy Ubuntu Servers with Ansible

![alt text](https://github.com/ansible/logos/blob/main/vscode-ansible-logo/vscode-ansible.png "Logo Title Text 1")

This is my own Ansible deployment for <strong><ins>`Ubuntu Servers`</ins></strong>

Deploy one today from https://ubuntu.com/download/server

# Prerequisites :white_check_mark:

Existing Ubuntu Server with user with sudo privilegdes and OpenSSH server enabled

   A. Create an ssh-key pair on Windows or Linux/MacOS

```bash
$ ssh-keygen -t ed25519 -C "add your comment for this key"
```

   B. SSH-keygen will ask for a location to save the file, remember to replace the resulting id_*** to something memorable like

```rust
C:\Users\YourUser/.ssh/yournewkey
```

   C. The ssh-keygen will then generate your key pair to the location you specified using the filename your inputted in the location.

   D. Copy your ssh-key to the remote server

1. Windows:

```rust
cat C:\Users\youruser/.ssh/yournewkey.pub | ssh -p 22 remoteuser@remote-server-ip "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" 
```
2. Linux/MacOs:

```bash
$ -ssh-copy-id ~/.ssh/yoursshkey user@server-ip
```

# Setting up the Inventory and ansible.cfg :heavy_check_mark:

First, setup your inventory by editing the file

  * ansible_control/<strong>*`hosts.yml`*</strong>

Second, configure your ansible config file
  
  * ansible_control/<strong>*`ansible.config`*</strong>

# Running the Play :running:

From your terminal type:

```bash
ansible-playbook run.yml -K --limit 'remote-server1,remote-server2' -e 'ansible_user=remoteuser'
```

# Notes :hash:

To run play with sudo password of remote-user add:

```bash
-K
```

To run play against a specific number of hosts use below  with comma(,) separated  hostnames

```bash
--limit 'host4,domain3,remote7'
```

To override the default user defined in the hosts.yml with a remote-user from a remote-server:

```bash
-e "ansible_user=remote-user"
```

:beers: and Enjoy.