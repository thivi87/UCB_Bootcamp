#!/bin/bash

#Get search informaiton
read -p "Enter domain: " d
read -p "Output filename: " f

file=~/Desktop/$f.txt


echo "\nGenerating nslookup report...\n"

#insert report date
date >> $file
echo "\n" >> $file

#run nslookup
echo "\nnslookup..."
nslookup $d >> $file

###############################
echo "\n**************************** - MX\n" >> $file

echo "\nnMX..."
nslookup -type=mx $d >> $file

###############################
echo "\n**************************** - NS\n" >> $file

echo "\nNS..."
nslookup -type=ns $d >> $file

###############################
echo "\n**************************** - SOA\n" >> $file

echo "\nSOA..."
nslookup -type=soa $d >> $file

###############################
echo "\n**************************** - ANY\n" >> $file

echo "\nANY..."
nslookup -type=any $d >> $file

###############################
echo "\n**************************** - ns1.ns\n" >> $file

echo "\nns1.ns..."
nslookup $d ns1.ns$d >> $file

###############################
echo "\n**************************** - Port 56\n" >> $file

echo "\nport 56..."
nslookup -port=56 $d >> $file

###############################
echo "\n**************************** - Timeout\n" >> $file

echo "\ntimeout..."
nslookup -timeout=20 $d >> $file

###############################
echo  "\n*************************** - debug\n" >> $file

echo "\ndebug..."
nslookup -debug $d >> $file

###############################
echo  "\n*************************** - txt\n" >> $file

echo "\ntxt..."
nslookup -type=txt $d >> $file

###############################
echo  "\n*************************** - a (IP)\n" >> $file

echo "\nip..."
nslookup -type=a $d >> $file

###############################
echo  "\n*************************** - cname\n" >> $file

echo "\ncname..."
nslookup -type=cname $d >> $file

###############################
echo  "\n*************************** - Group Identifier (gid)\n" >> $file

echo "\ngid..."
nslookup -type=gid $d >> $file

###############################
echo  "\n*************************** - hinfo\n" >> $file

echo "\nhinfo..."
nslookup -type=hinfo $d >> $file

###############################
echo  "\n*************************** - minfo\n" >> $file

echo "\nminfo..."
nslookup -type=minfo $d >> $file

###############################
echo  "\n*************************** - mr\n" >> $file

echo "\nmr..."
nslookup -type=mr $d >> $file

###############################
echo  "\n*************************** - ptr\n" >> $file

echo "\nptr..."
nslookup -type=ptr $d >> $file

###############################
echo  "\n*************************** - class-any\n" >> $file

echo "\nclass=any..."
nslookup -class=any $d >> $file


echo "Report complete!"
