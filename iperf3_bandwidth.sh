#!/bin/bash


# Get last 2 summary lines
# iperf3 -P 5 -c 66.118.64.98 | grep SUM | tail -2
iperf3 -c 66.118.64.98
