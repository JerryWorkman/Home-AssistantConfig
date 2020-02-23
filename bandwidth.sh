#!/bin/bash
#Usage: $0 192.168.10.1 In 5

ROUTER=$1
INTERFACE=$2
TIME=$3

A=$(snmpget -v2c -c public $ROUTER if$1Octets.$INTERFACE | awk '{print $4}')
sleep $TIME
B=$(snmpget -v2c -c public $ROUTER if$1Octets.$INTERFACE | awk '{print $4}')

echo $( echo "scale=2; (($B - $A) / $TIME) * 8 / 1024 / 1024" | bc )
