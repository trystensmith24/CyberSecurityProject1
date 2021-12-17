#!/bin/bash

outputfile=$HOME/research/sys_info.txt
if [ ! -d $HOME/research ]
then
 mkdir $HOME/research
fi

if [ -f $outputfile ]
then
 rm $outputfile
fi

echo "A Quick System Audit Script" >> $outputfile
date >> $outputfile
echo "" >> $outputfile
echo "Machine Type Info:" >> $outputfile
echo $MACHTYPE >> $outputfile
echo -e "Uname info: $(uname -a) \n" >> $outputfile
echo -e "IP Info: $(ip addr | grep inet | tail -2 |head -1) \n" >> $outputfile
echo "Hostname: $(hostname -s) " >> $outputfile

echo "Bonus Stats" >> $outputfile
echo "--------------------" >> $outputfile
echo "DNS Servers: " >> $outputfile
cat /etc/resolv/conf >> $outputfile
echo "Memory Info: " >> $outputfile
free >> $outputfile
echo -e "\nCPU Info: " >> $outputfile
lscpu | grep CPU >> $outputfile
echo -e "\nDisk Usage:" >> $outputfile
df -H | head -2 >> $outputfile
echo -e "\nWho is logged in:\n$(who)\n" >> $outputfile

sudo find -type f -perm 777 >> $outputfile

ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head >> $outputfile
