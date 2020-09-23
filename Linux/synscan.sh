#!/bin/bash

#get synscan information
read -p "Please enter the subnet (x.x.x): " ip
read -p "Host start: " S
read -p "Host end: " E
read -p "What would you like the filename to be? " filename

#create report
echo "\n\nCreating report...\nStarting scan at "$ip"."$S"...\n\n"

date >> $filename.txt
echo "\n" >> $filename.txt

#start Synscan
while [ $S -le  $E ]
do
    #run synscan
    nmap -sS $ip"."$S >> $filename.txt

    #separate entries
    echo "\n******************************************************\n" >> $filename.txt

    echo $ip"."$S" Scan complete."

    #increment IP
    S=$(($S+1))

    echo "Starting scan at "$ip"."$S"...\n\n"

done

#cat report
cat $filename.txt

