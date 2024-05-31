# ansible_control
This is my own Ansible deployment for Ubuntu Server servers

First, modify the host.yml to your preferred structure.

  1. $ ansible_control/hosts.yml

Second, setup your inventory path by editing the file.

  1. $ ansible_control/ansible.config

Base server playbook is at:

  # playbooks/base-server/0-main.yml

Server maintenance playbook is at:

  # playbooks/server-maintenance/0-main.yml

To run a specific task, edit the corresponding 0-main.yml play file and run:

    ansible-playbook playbooks/base-server/0-main.yml -K --limit 'web5b,web7' -e "ansible_user=old_user"

    ansible-playbook playbooks/server-maintenance/0-mail.yml -K --limit 'host1,host2,host3' -e "ansible_user=new_user"

Run the 2 plays consecutively using the && operator:

    ansible-playbook playbook/base-server/0-main.yml playbook/server-maintenance/0-main.yml -K --limit 'host3,host6' -e "ansible_user=somebody" && ansible-playbook playbooks/server-maintenance/0-main.yml --limit 'host1,host2,host' -e "ansible_user=morty" -e "ansible_ssh_port=22222"

Explaning the commands used with the 2 consecutive plays above:

  1. execute base-server/0-main.yml

The play above establishes your desired user on default SSH port 22 using the ansible_user found in your hosts.yml

  2. execute server-maintenance/0-main.yml

The play above is executed by specifying your user that you created earlier with the modified SSH port that ran in the above play

Notes: 

To run play with sudo password of user add:

    -K

To run play against a specific number of hosts use below  with comma(,) separated  hostnames

    --limit 'hostname1,hostname2,hostname3'

To override the default user defined in your hosts.yml use:
  
    -e "ansible_user=your_chosen_user"

Cheers and Enjoy.
