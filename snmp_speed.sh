#SPEED=$(snmpget -v2c -c $SNMPCOMMUNITY $IP iso.3.6.1.2.1.2.2.1.5.$INTNUMBER | awk '{print $4}')
#snmpget -v2c -c public 192.168.10.1 iso.3.6.1.2.1.2.2.1.5.$INTNUMBER | awk '{print $4}'
#SPEED=10
#TIME=10
#===========
check () {
community_string='public'
hostname='192.168.10.1'
#INTNUMBER=5
INTNUMBER=1
OUT=$(snmpget -v2c -c $community_string $hostname 1.3.6.1.2.1.2.2.1.10.$INTNUMBER | awk '{print $4}')
#print $OUT
IN=$(snmpget -v2c -c $community_string $hostname  1.3.6.1.2.1.2.2.1.16.$INTNUMBER | awk '{print $4}')
#print $IN

TIME=5
SPEED=10000000
#PIPE=10000
PIPE=10000000

        if [ -z "$OUT" ] || [ -z "$IN" ]; then
                msg="Unable to retrieve SNMP info."
                state=CRITICAL
                echo $state $msg
                exit 2

        else
                #wait $TIME before running the same check, this way we can confirm how much the data has changed in two periods.
                sleep $TIME
#                OUT2=$(snmpget -v2c -c $community_string $hostname iso.3.6.1.2.1.2.2.1.$INTNUMBER | awk '{print $4}')
#                IN2=$(snmpget -v2c -c $community_string $hostname iso.3.6.1.2.1.2.2.1.$INTNUMBER | awk '{print $4}')
                OUT2=$(snmpget -v2c -c $community_string $hostname 1.3.6.1.2.1.2.2.1.10.$INTNUMBER | awk '{print $4}')
                IN2=$(snmpget -v2c -c $community_string $hostname 1.3.6.1.2.1.2.2.1.16.$INTNUMBER | awk '{print $4}')
                DELTAOUT=$(( $OUT2 - $OUT))
                DELTAIN=$(( $IN2 - $IN))
                #Value is in octets so will need to be divided by 8 to get bytes, this is then divided by 1024 to give kilobytes.
                INPUTBW=$(((($DELTAIN)/$TIME)*8/1024))
                OUTPUTBW=$(((($DELTAOUT)/$TIME)*8/1024))
                #For percentage usage we do 100/(total possible bandwidth – current bandwidth).
                percentage_use=$(echo "scale=9; $PIPE/$INPUTBW" | bc)
                PRCNTIN=$(echo "scale=0; 100/$percentage_use" | bc)
                percentage_use=$(echo "scale=9; $PIPE/$OUTPUTBW" | bc)
                PRCNTOUT=$(echo "scale=0; 100/$percentage_use" | bc)
                #Bash hates decimals, so take the number and remove the decimal point and then compare this to speed (another none decimal).
                PRCNTIN_IF=$(echo $PRCNTIN | tr -d ".")
                PRCNTOUT_IF=$(echo $PRCNTOUT | tr -d ".")
                if [ "$PRCNTIN_IF" -gt $SPEED ] || [ "$PRCNTOUT_IF" -gt $SPEED ]; then
                        msg="Inbound: $INPUTBW"kbps" ($PRCNTIN% Used), Outbound: $OUTPUTBW"kbps" ($PRCNTOUT% Used)."
                        state=CRITICAL
                        echo $state $msg
                        exit 2
                else
                        msg="Inbound: $INPUTBW"kbps" ($PRCNTIN% Used), Outbound: $OUTPUTBW"kbps" ($PRCNTOUT% Used)."
                        state=OK
                        echo $state $msg
                        exit 0
                fi
        fi
}

while getopts ":b:s:h:" option
do
case $option in
b)speed=$OPTARG
;;
s)community_string=$OPTARG
;;
h)hostname=$OPTARG
;;
*) echo "Syntax is $usage -h <hostname> -s <snmpstring> -b <bandwidth>"
exit 1;;
esac
done

#if [ -z "$hostname" ]; then
#        echo "-h) IP address required."
#        exit 1
#elif [ -z "$community_string" ]; then
#        echo "-s) snmp string needs to be specified."
#        exit 1
#elif [ -z "$speed" ]; then
#        echo "-b) bandwidth percentage used before flagging alerts (e.g 50)"
#        exit 1
#else
#        check
#fi

check
