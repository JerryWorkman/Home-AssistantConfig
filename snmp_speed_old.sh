SNMPCOMMUNITY=public
IP=192.168.10.1
INTNUMBER=5
OUT=$(snmpget -v2c -c $SNMPCOMMUNITY $IP iso.3.6.1.2.1.2.2.1.10.$INTNUMBER | awk '{print $4}')
IN=$(snmpget -v2c -c $SNMPCOMMUNITY $IP iso.3.6.1.2.1.2.2.1.16.$INTNUMBER | awk '{print $4}')
#SPEED=$(snmpget -v2c -c $SNMPCOMMUNITY $IP iso.3.6.1.2.1.2.2.1.5.$INTNUMBER | awk '{print $4}')
#snmpget -v2c -c public 192.168.10.1 iso.3.6.1.2.1.2.2.1.5.$INTNUMBER | awk '{print $4}'
SPEED=10
TIME=10
        if [ -z "$OUT" ] || [ -z "$IN" ]; then
                msg="Unable to retrieve SNMP info."
                state=CRITICAL
                echo $state $msg
                exit 2
        else
                sleep $TIME
                OUT2=$(snmpget -v2c -c $SNMPCOMMUNITY $IP ifOutOctets.$INTNUMBER | awk '{print $4}')
                IN2=$(snmpget -v2c -c $SNMPCOMMUNITY $IP ifInOctets.$INTNUMBER | awk '{print $4}')
                DELTAOUT=$(echo "$OUT2-$OUT" | bc)
                DELTAIN=$(echo "$IN2-$IN" | bc)
                INPUTBW=$(echo "$DELTAIN*8*100/$TIME*$SPEED" | bc)
                OUTPUTBW=$(echo "$DELTAOUT*8*100/$TIME*$SPEED" | bc)
                echo Inbound: $INPUTBW"bps"
                echo Outbound: $OUTPUTBW"bps"

        fi
