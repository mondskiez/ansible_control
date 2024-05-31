# :computer: Deploy Ubuntu Servers with Ansible

This is my own Ansible deployment for <strong><ins>`Ubuntu Servers`</ins></strong>

Deploy one today from https://ubuntu.com/download/server

# :white_check_mark: Prerequisites 

Ansible installed on your Linux/MacOs machine

Existing Ubuntu Server with OpenSSH enabled and a user with sudo privileges
git
   A. Create an ssh-key pair on Windows or Linux/MacOS

```rust
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

```rust
$ -ssh-copy-id ~/.ssh/yournewkey remoteuser@remote-server-ip
```

# :heavy_check_mark: Setting up the Inventory and ansible.cfg 

First, setup your inventory by editing the file

  * ansible_control/<strong>*`hosts.yml`*</strong>

Second, configure your ansible config file
  
  * ansible_control/<strong>*`ansible.config`*</strong>

# :running: Running the Play 

From your terminal type:

```rust
ansible-playbook run.yml -K --limit 'remote-server1,remote-server2' -e 'ansible_user=remoteuser'
```

# :hash: Notes 

To run play with sudo password of remote-user add:

```rust
-K
```

To run play against a specific number of hosts use below  with comma(,) separated  hostnames

```rust
--limit 'host4,domain3,remote7'
```

To override the default user defined in the hosts.yml with a remote-user from a remote-server:

```rust
-e "ansible_user=remote-user"
```

# :beers: Enjoy.

Feel free to modify all the plays to meet your needs.