#!/bin/sh
/Library/Application\ Support/VMware\ Fusion/boot.sh –stop &> /dev/null
/opt/local/bin/nmap $@
/Library/Application\ Support/VMware\ Fusion/boot.sh –start &> /dev/null
~