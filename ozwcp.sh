#! /bin/bash

echo stopping home-assistant.service
sudo systemctl stop home-assistant@homeassistant

echo connect to http://192.168.10.2:8887
echo zwave controller on port /dev/ttyACM0
echo ^C to stop then ./start.sh to restart HA

cd /root/open-zwave-control-panel
./ozwcp -p 8887
cp /root/open-zwave-control-panel/zwcfg*.xml /home/homeassistant/ha
chown homeassistant:homeassistant /home/homeassistant/ha/zwcfg*.xml
