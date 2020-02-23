#!/bin/bash

#echo Restarting home-assistant@homeassistant
#/usr/bin/ansible-playbook /opt/ansible-playbooks/restart-monitor.yml

cd /home/homeassistant/.homeassistant
source /srv/homeassistant/bin/activate

hass --script check_config
echo Restarting Home Assistant
sudo systemctl restart home-assistant@homeassistant

exit

