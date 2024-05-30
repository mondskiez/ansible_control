# ansible_control
This is my own Ansible deployment for Ubuntu Server servers

Firstly, modify the host.yml to your preferred structure

    ansible_control/hosts.yml

Base server installation come from 0-main.yml file

    playbooks/base-server/0-main.yml

Edit the file to your desired settings and run:

    ansible-playbook playbooks/base-server/0-main.yml -K --limit 'web5b,web7' -e "ansible_user=youruser"

Take note of the trailing commands after the play:

To run the play with the sudo password of the server defined in hosts.yml
    --ask-sudo-pass or -K 

To run the playbook against a specified number of hosts only"
    --limit 'hostname1,hostname2,hostname3' 

To override the default ansible_user defined in hosts.yml
    --user=youruser or -e "ansible_user=youruser" 
    