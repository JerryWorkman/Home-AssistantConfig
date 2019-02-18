#!/bin/bash

echo "Setting up Environment"
cd /home/homeassistant/.homeassistant
source /srv/homeassistant/bin/activate

echo "Processing update"
pip3 install --upgrade git+git://github.com/balloob/home-assistant.git@dev

echo "Code Check"
hass --script check_config
exit
