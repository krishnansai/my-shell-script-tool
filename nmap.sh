#!/bin/bash
  figlet "lv7" | lolcat
echo -e "Enter the ip address : \c"
read ip

if [ -z $ip ]
then
	echo "plece enter the ip address" 
	exit
fi


echo "1]fast $ tcp scan "
echo "2]Script/version/ scan"
echo "3]Udp scan "
echo "4]Os detection"
echo "5]Gather page titles from HTTP services"
echo "6]Get HTTP headers of web services"
echo "7]Find web apps from known paths"
echo "8]Informaton about ip "
echo "9]All port scan"
echo "10]Smp enumretion"

echo -e "Enter the options : \c"
read option

if [ $option == 1 ]
then
	nmap -sT $ip -vv
elif [ $option == 2 ]
then
	nmap -sC -sV $ip -vv
elif [ $option == 3 ]
then
	nmap -sU $ip -vv
elif [ $option == 4 ]
then
	nmap -O $ip -vv
elif [ $option == 5 ]
then
	nmap –script=http-title $ip
elif [ $option == 6 ]
then
	nmap –script=http-headers $ip
elif [ $option == 7 ]
then
	nmap –script=http-enum $ip

elif [ $option == 8 ]
then
	nmap –script=asn-query,whois,ip-geolocation-maxmind $ip
elif [ $option == 9 ]
then
	nmap -p- $ip

elif [ $option == 10 ]
then
	nmap --script smb-enum-shares.nse -p445 $ip
else
	echo "select 1 to 10 numbers to scan "
fi
