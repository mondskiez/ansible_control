# Deploy Ubuntu Servers with Ansible

![alt text](https://github.com/ansible/logos/blob/main/vscode-ansible-logo/vscode-ansible.png "Logo Title Text 1")

This is my own Ansible deployment of <strong><ins>`Ubuntu Server`</ins></strong>

# Setup your Inventory

First, setup your inventory by editing the file

  * ansible_control/<strong>*`hosts.yml`*</strong>

Second, configure your ansible config file
  
  * ansible_control/<strong>*`ansible.config`*</strong>

# Play Locations

Playbooks:
  * playbooks/<strong>*`base-server`*</strong>
  * playbooks/<strong>*`server-maintenance`*</strong>

The main play is from the file
  * <strong>*`0-main.yml`*</strong>

# Running the Play

To run any task, edit the corresponding <strong>`0-main.yml`</strong> file and run:

```bash
ansible-playbook playbooks/base-server/0-main.yml -K --limit 'web5b,web7' -e 'ansible_user=old_user'
```
<em>The play above creates your account with all the vars stated inside the 0-main-hosts.yml</em>
  
```bash
ansible-playbook playbooks/server-maintenance/0-mail.yml -K --limit 'host1,host2,host3' -e 'ansible_user=new_user'
```
<em>The next play is executed by specifying your user that you created earlier with the modified SSH port that ran in the above play</em>

Run the 2 plays consecutively with the && operator:

```bash
ansible-playbook playbook/base-server/0-main.yml playbook/server-maintenance/0-main.yml -K --limit 'host3,host6' -e "ansible_user=somebody" <strong><em>&&</em></strong> ansible-playbook playbooks/server-maintenance/0-main.yml --limit 'host1,host2,host' -e "ansible_user=morty" -e "ansible_ssh_port=22222"
```

* Executing `base-server/0-main.yml` creates your server user.  
      Assume that a freshly deployed Ubuntu Server has its SSH port at 22.
      At the end of this play, the default SSH port of 22 will be changed to your desired port
      as defined in the 0-main.yml.  Not unless the value is left at 22. 

* Executing `server-maintenance/0-main.yml` will update your server package.
      After the first play, the second play will run because of the && operator in the original
      command.  Therefore, you MUST specify the NEW ssh port number in the command, else it will
      fail.

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