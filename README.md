# ansible_control
This is my own Ansible deployment for Ubuntu Server servers

Firstly, modify the host.yml to your preferred structure

    ansible_control/hosts.yml

Base server installation come from 0-main.yml file

    playbooks/base-server/0-main.yml

Edit the file to your desired settings and run:

    ansible-playbook playbooks/base-server/0-main.yml -K --limit 'web5b,web7' -e "ansible_user=youruser"

Take note of the trailing commands after 0-main.yml

To run play with sudo password of the server defined in hosts.yml use either:

    --ask-sudo-pass

    -K

To run play against a specific number of hosts use:

    --limit 'hostname1,hostname2,hostname3'" 

To override the default user defined in your hosts.yml use either:

    --user=youruser
    
    -e "ansible_user=youruser"" 
    