#!/bin/bash
echo '========================';
echo 'Calendar';        
echo '========================';
echo
echo
echo
echo
echo
echo
echo
echo


echo '========================';
echo 'System Data';        
echo '========================';
top -l 1 | awk '/PhysMem/ {print $8 " : RAM"}'; top -l1 | grep "CPU usage:" | sed 's/.*\(CPU .*\)\ user.*/\1/' | awk '{print $3 " : " $1}'; uptime | awk '{print $3 " " $4 " " $5 " : UPTIME" }' | sed 's/\(.*\)\,/\1/'
echo `ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{printf("%.2f%%", $10/$5 * 100)}'` : Batt


echo '========================';
echo 'Network Data';        
echo '========================';
echo External IP:
curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g'
echo Internal IP:
ifconfig en1 | awk '/broadcast/ {print $2}'
# Change this to en0 for an ethernet connection instead of airport
INTF=en1
# get the current number of bytes in and bytes out
sample1=(`/usr/sbin/netstat -ib | awk "/$INTF/"'{print $7" "$10; exit}'`)
# wait one second
sleep 1
# get the number of bytes in and out one second later
sample2=(`/usr/sbin/netstat -ib | awk "/$INTF/"'{print $7" "$10; exit}'`)
# find the difference between bytes in and out during that one second
# and convert bytes to kilobytes
results=(`echo "2k ${sample2[0]} ${sample1[0]} - 1024 / p" "${sample2[1]} ${sample1[1]} - 1024 / p" | dc`)
# print the results
printf "In: %.2f Kb/sec\nOut: %.2f Kb/sec\n" ${results[0]} ${results[1]}
HOST=75.151.21.69
PING=`ping -q -c 1 $HOST`
if [[ $? -eq 0 ]] ; then
    TIME=`echo $PING |tail -1 | cut -d/ -f 5`
    echo ${TIME}ms from Home
    exit 0
else
    echo -n $HOST could not be reached
    exit 2
fi

echo
echo


echo '========================';
echo 'System Data';        
echo '========================';

