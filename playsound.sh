#! /bin/bash

#set tp 100% volume
#amixer set PCM -- 100%
#aplay "/home/homeassistant/.homeassistant/doorbell-2.mp3"
mpg123 -g 100 "/home/homeassistant/.homeassistant/doorbell-2.mp3"
#mplayer -ao pulse "/home/homeassistant/.homeassistant/doorbell-2.mp3"
