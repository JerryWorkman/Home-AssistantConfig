#!/bin/bash

mosquitto_sub -h 127.0.0.1 -v -t 'monitor/#' -u 'homeassistant' -P '012749'

 