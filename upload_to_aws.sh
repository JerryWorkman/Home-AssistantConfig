#!/bin/bash

aws s3 sync /home/homeassistant/.homeassistant/ s3://home-assistant/  --acl public-read --storage-class REDUCED_REDUNDANCY --exclude "*.log" --exclude "*~" --exclude "*.bak" --exclude "tts/*"
