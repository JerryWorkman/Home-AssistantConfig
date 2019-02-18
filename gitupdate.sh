#!/bin/bash
echo "do a git add . first"
#echo jerry.workman@gmail.com
# echo UrUTg2FLZlJqWIdnR2A3
# cd /home/homeassistant/.homeassistant
#source /srv/homeassistant/homeassistant_venv/bin/activate
source /srv/homeassistant/bin/activate
hass --script check_config

git add .
git status
echo -n "Enter the Description for the Change: " [Minor Update]
read CHANGE_MSG
git commit -m "${CHANGE_MSG}"
git push origin master

exit
