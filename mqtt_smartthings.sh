#!/bin/bash

mosquitto_sub -h 127.0.0.1 -v -t 'smartthings/#' -u 'homeassistant' -P '012749'
