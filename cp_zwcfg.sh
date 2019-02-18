#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit
fi   
cp /root/open-zwave-control-panel/zwcfg*.xml /home/homeassistant/ha
chown homeassistant:homeassistant /home/homeassistant/ha/zwcfg*.xml
