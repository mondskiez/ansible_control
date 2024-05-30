# ansible_control
My Own Ansible Deployment

Firstly, modify your host.yml

1. ~/ansible_control/hosts.yaml

Base-server settings to install follows: To use open:

1. playbook/base-server/
2. edit 0-main.yml # to enable your desired output

run:

[code]ansible-playbook playbook/base-server/0-main.yml -K --limit 'web5b,web7' -e "ansible_user=youruser"[/code]

Take note of the following ansible command line keys which you can add to the command above:

1. -K ### to run the play with the sudo password of the server defined in hosts.yml 
2. --limit 'hostname1,hostname2,hostname3' ### to run the playbook against a specified number of hosts only
3. -e "ansible_user=youruser" ### to override the default ansible_user defined in hosts.yml