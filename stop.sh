#!/bin/bash
echo Stopping home-assistant@homeassistant
sudo service monitor stop
sudo systemctl stop home-assistant@homeassistant
