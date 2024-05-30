# ansible_control
This is my own Ansible deployment for Ubuntu Server servers

Firstly, modify the host.yml to your preferred structure

    ansible_control/hosts.yml

Base server installation come from 0-main.yml file

    playbooks/base-server/0-main.yml

Server maintenance play come from 0-main.yml file

    playbooks/server-maintenance/0-main.yml

Edit the 0-main.yml files and input your own settings then run:

    ansible-playbook playbooks/base-server/0-main.yml -K --limit 'web5b,web7' -e "ansible_user=old_user"

    ansible-playbook playbooks/server-maintenance/0-mail.yml -K --limit 'host1,host2,host3' -e "ansible_user=new_user"

Note the trailing arguments after the 0-main.yml files in the command above

To run play with sudo password of the server defined in hosts.yml use add:

    -K

To run play against a specific number of hosts use --limit with comma(,) as host separators

    --limit 'hostname1,hostname2,hostname3'

To override the default user defined in your hosts.yml use either:
  
    -e "ansible_user=your_chosen_user"" 
    
