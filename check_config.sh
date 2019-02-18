#!/bin/bash

cd /home/homeassistant/.homeassistant
source /srv/homeassistant/bin/activate

hass --script check_config

exit

