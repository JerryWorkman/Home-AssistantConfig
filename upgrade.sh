#!/bin/bash

cd /home/homeassistant/.homeassistant
source /srv/homeassistant/bin/activate

pip install --upgrade homeassistant

#sudo docker pull homeassistant/home-assistant:latest
#sudo docker container ls 
#sudo docker restart 8595d093558e

hass --script check_config

sudo systemctl restart home-assistant@homeassistant

exit

