# ansible_control
This is my own Ansible deployment for Ubuntu Server servers

Firstly, modify the host.yml to your preferred structure

    ansible_control/hosts.yml

Base server installation come from 0-main.yml file

    playbooks/base-server/0-main.yml

Edit the file to your desired settings and run:

    ansible-playbook playbooks/base-server/0-main.yml -K --limit 'web5b,web7' -e "ansible_user=youruser"

Take note of the trailing commands after the play:

1. -K ### to run the play with the sudo password of the server defined in hosts.yml 
2. --limit 'hostname1,hostname2,hostname3' ### to run the playbook against a specified number of hosts only
3. -e "ansible_user=youruser" ### to override the default ansible_user defined in hosts.yml