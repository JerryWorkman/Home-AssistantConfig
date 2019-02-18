#! /bin/bash

#set tp 100% volume
#amixer set PCM -- -0
amixer set PCM -- 50%
aplay "/usr/share/scratch/Media/Sounds/Instruments/Suspense.wav"
