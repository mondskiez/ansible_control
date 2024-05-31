# Deploy Ubuntu Servers with Ansible

![alt text](https://github.com/ansible/logos/blob/main/vscode-ansible-logo/vscode-ansible.png "Logo Title Text 1")

This is my own Ansible deployment of <strong><ins>`Ubuntu Server`</ins></strong>

# Prerequisites

Existing Ubuntu Server with a user with sudo privilegdes

1. Create an ssh-key pair on Windows or Linux/MacOS

```bash
$ ssh-keygen -t ed25519 -C "your comment"
```

Be sure to specify a name for your key for easy identification

2. Copy over your ssh-key from

  Windows:

```bash
cat C:\Users\youruser/.ssh/yourgenerated.pub | ssh -p 22 remoteuser@remote-server-ip "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" 
```
  Linux/MacOs:

```bash
$ -ssh-copy-id ~/.ssh/yoursshkey user@server-ip
```

# Setup your Inventory

First, setup your inventory by editing the file

  * ansible_control/<strong>*`hosts.yml`*</strong>

Second, configure your ansible config file
  
  * ansible_control/<strong>*`ansible.config`*</strong>

# Running the Play

To run any task, edit the corresponding <strong>`0-main.yml`</strong> file and run:

```bash
ansible-playbook run.yml -K --limit 'web5b,web7' -e 'ansible_user=old_user'
```
<em>The play above creates your account with all the vars stated from within the run.yml file</em>
  
Notes: 

To run play with sudo password of user add:

```bash
-K
```

To run play against a specific number of hosts use below  with comma(,) separated  hostnames

```bash
--limit 'hostname1,hostname2,hostname3'
```

To override the default user defined in your hosts.yml use:

```bash
-e "ansible_user=your_chosen_user"
```

To string multiple plays use the bash logical operator of 

```bash
&&
```

:beers: and Enjoy.