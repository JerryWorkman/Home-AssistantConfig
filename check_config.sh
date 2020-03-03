#!/bin/bash

#cd /home/homeassistant/.homeassistant
#source /srv/homeassistant/bin/activate

#hass --script check_config

#exit

#docker run -it --rm -v /opt/docker/home-assistant/config:/config -v /etc/localtime:/etc/localtime:ro homeassistant/raspberrypi3-homeassistant hass -c /config --script check_config

#doesn't work
#docker run -it --rm -v /home/homeassistant/.homeassistant:/config hass -c /config --script check_config
#test this
#docker run -it --rm -v /opt/docker/home-assistant/config:/config -v /etc/localtime:/etc/localtime:ro homeassistant/raspberrypi3-homeassistant hass -c /config --script check_config

#check_config
docker run -it --rm -v /home/homeassistant/.homeassistant:/config -v /etc/localtime:/etc/localtime:ro homeassistant/home-assistant:stable hass -c /config --script check_config
