#!/bin/bash

/usr/bin/ansible-playbook /opt/ansible-playbooks/restart-monitor.yml

cd /home/homeassistant/.homeassistant
source /srv/homeassistant/bin/activate

hass --script check_config

exit

#sudo systemctl start home-assistant@homeassistant.service
sudo systemctl start home-assistant@homeassistant
#sudo docker start home-assistant
