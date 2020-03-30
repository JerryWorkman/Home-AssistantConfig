#!/bin/bash

#cd /home/homeassistant/.homeassistant
#source /srv/homeassistant/bin/activate

#pip install --upgrade homeassistant

sudo docker pull homeassistant/home-assistant:latest
sudo docker container ls 
sudo docker restart e24aabc67b1f

#hass --script check_config
docker run -it --rm -v /home/homeassistant/.homeassistant:/config -v /etc/localtime:/etc/localtime:ro homeassistant/home-assistant:stable hass -c /config --script check_config

#sudo systemctl restart home-assistant@homeassistant

#exit

