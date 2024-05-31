# :computer: Deploy Ubuntu Servers with Ansible

This is my own Ansible deployment for <strong><ins>`Ubuntu Servers`</ins></strong>

Install Ansible https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

Get Ubuntu Server https://ubuntu.com/download/server

# :white_check_mark: Prerequisites 

Ansible installed on your Linux/MacOs machine

Existing Ubuntu Server with OpenSSH enabled and a user with sudo privileges


:arrow_forward: A. Create an ssh-key pair on Windows or Linux/MacOS

```rust
$ ssh-keygen -t ed25519 -C "add your comment for this key"
```

:arrow_forward: B. SSH-keygen will ask for a location to save the file, remember to replace the resulting id_*** to something memorable like

```rust
C:\Users\YourUser/.ssh/yournewkey
```

:arrow_forward: C. The ssh-keygen will then generate your key pair to the location you specified using the filename your inputted in the location.

:arrow_forward: D. Copy your ssh-key to the remote server

1. :small_orange_diamond: PowerShell on Windows:

```rust
cat C:\Users\youruser/.ssh/yournewkey.pub | ssh -p 22 remoteuser@remote-server-ip "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" 
```
2. :small_orange_diamond: Terminal on Linux/MacOs:

```rust
$ -ssh-copy-id ~/.ssh/yournewkey remoteuser@remote-server-ip
```

# :heavy_check_mark: Setting up the Inventory and ansible.cfg 

First, setup your inventory by editing the file

  * :arrow_forward: ansible_control/<strong>*`hosts.yml`*</strong>

Second, configure your ansible config file
  
  * :arrow_forward: ansible_control/<strong>*`ansible.config`*</strong>



# :running: Running the Play 

:arrow_forward: From PowerShell or Windows Terminal type:

```rust
ansible-playbook run.yml -K
```

# :hash: Notes 

:hash: To run play with sudo password of remote-user add:

```rust
-K
```

:hash: To run play against a specific number of hosts use below  with comma(,) separated  hostnames

```rust
--limit 'host4,domain3,remote7'
```

:hash: To override the default user defined in the hosts.yml with a remote-user from a remote-server:

```rust
-e "ansible_user=remote-user"
```

:hash: Example play with all arguments added:

```rust
ansible-playbook --limit 'host4,domain3,remote7' -e 'ansible_user=remote-user -K'
```

# :beers: Enjoy.

Feel free to modify all the plays to meet your needs.