#!/bin/bash

if ! [ -x "$(type -P iperf)" ]; then
  echo "ERROR: script requires iperf"
  echo "For Debian and friends get it with 'apt-get install iperf'"
  echo "If you have it, perhaps you don't have permissions to run it, try 'sudo $(basename $0)'"
  exit 1
fi

if [ "$#" -ne "2" ]; then
  echo "ERROR: script needs four arguments, where:"
  echo
  echo "1. Number of times to repeat test (e.g. 10)"
  echo "2. Host running 'iperf -s' (e.g. somehost)"
  echo
  echo "Example:"
  echo "  $(basename $0) 10 somehost"
  echo 
  echo "The above will run 'iperf -c' 10 times on the client and report totals and average."
  exit 1
else
  runs=$1
  host=$2
fi

log=iperf.$host.log

if [ -f $log ]; then
  echo removing $log
  rm $log
fi

echo "=================================================================="
echo " Results"
echo "=================================================================="
echo " target host .... $host"
echo "------------------------------------------------------------------"

for run in $(seq 1 $runs); do
  iperf -c $host -f m >> $log
  echo -e " run $run: \t $(awk '/Bandwidth/ {getline}; END{print $7, $8}' $log)"
done

avg=$(awk -v runs=$runs '/Bandwidth/ {getline; sum+=$7; avg=sum/runs} END {print avg}' $log)


echo "------------------------------------------------------------------"
echo " average ....... $avg Mbits/sec"
echo
echo "see $log for details"
