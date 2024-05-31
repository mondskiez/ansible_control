# ansible_control

![alt text](https://github.com/ansible/logos/blob/main/vscode-ansible-logo/vscode-ansible.png "Logo Title Text 1")

This is my own Ansible deployment for <strong><ins>`Ubuntu Server`</ins></strong> servers

First, setup your infrastructure by editing the file

Path | File

  > ansible_control/<strong><em>`hosts.yml`</em></strong>

Second, setup your inventory by editing the file
  > ansible_control/<strong><em>`ansible.config`</em></strong>

Base server playbook folder
  > playbooks/base-server

Server maintenance playbook:
  > playbooks/server-maintenance

The main play from either folder is:
  > <strong><em>`0-main.yml`</em></strong>

To run a specific task, edit the corresponding <em>0-main.yml</em> file and run:

```
ansible-playbook playbooks/base-server/0-main.yml <strong><em>-K --limit 'web5b,web7' -e "ansible_user=old_user"</em></strong>
```

<em>The play above establishes your desired user on default SSH port 22 using the ansible_user found in your hosts.yml</em>
  
```
ansible-playbook playbooks/server-maintenance/0-mail.yml <strong><em>-K --limit 'host1,host2,host3' -e "ansible_user=new_user"</em></strong>
```

<center><em>The play above is executed by specifying your user that you created earlier with the modified SSH port that ran in the above play</em></center>

Run the 2 plays consecutively with the && operator:

  * ansible-playbook playbook/base-server/0-main.yml playbook/server-maintenance/0-main.yml -K --limit 'host3,host6' -e "ansible_user=somebody" <strong><em>&&</em></strong> ansible-playbook playbooks/server-maintenance/0-main.yml --limit 'host1,host2,host' -e "ansible_user=morty" -e "ansible_ssh_port=22222"

Explaining the play above:

Executing the base-server/0-main.yml
...The play above establishes your desired user on default SSH port 22 using the ansible_user found in your hosts.yml

Executive the server-maintenance/0-main.yml
...The play above is executed by specifying your user that you created earlier with the modified SSH port that ran in the above play

Notes: 

To run play with sudo password of user add:
  * -K

To run play against a specific number of hosts use below  with comma(,) separated  hostnames
  * --limit 'hostname1,hostname2,hostname3'

To override the default user defined in your hosts.yml use:
  * -e "ansible_user=your_chosen_user"

To string multiple plays
  * use the && operator between playbooks

Cheers and Enjoy.
