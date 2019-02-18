#!/bin/bash

sudo docker run -d --name="home-assistant" -v /home/homeassistant/.homeassistant:/config -v /etc/localtime:/etc/localtime:ro --net=host homeassistant/home-assistant
