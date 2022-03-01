#!/bin/bash

 figlet  "lv7 " | lolcat


echo " 1] Nmap version scan"
echo " 2] Dir brute"
echo " 3] Staus code "
echo " 4] FTP brute force"
echo " 5] SSH brute force"
echo " 6] Joomscan"
echo " 7] Nikto vulnscan "
echo " 8] Skipfish "
read -p "Enter the options : " options

if [ -z $options ]
then
	echo "plese chooce 1 to 5 number "
fi

echo "<===============================================================>"

read -p "Enter the ip address : " ip

if [ -z $ip ]
then
	echo "enter the ip address"
fi

echo "<===============================================================>"
if [ $options == 1 ] 
then

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
					nmap –script=http-title $ip -vv
				elif [ $option == 6 ]
				then
					nmap –script=http-headers $ip -vv
				elif [ $option == 7 ]
				then
					nmap –script=http-enum $ip -vv

				elif [ $option == 8 ]
				then
					nmap –script=asn-query,whois,ip-geolocation-maxmind $ip -vv
				elif [ $option == 9 ]
				then
					nmap -p- $ip -vv

				elif [ $option == 10 ]
				then
					nmap --script smb-enum-shares.nse -p445 $ip -vv
				else
					echo "select 1 to 10 numbers to scan "
				fi

elif [ $options == 2 ]
then

				echo "1] directory brute force with common list "
				echo "2] dir brute force with directory-list-2.3-medium.txt "

				echo -e "Enter the options : \c"
				read go

				if [ $go == 1 ]
				then
					gobuster dir -u http://$ip/ -w /usr/share/wordlists/dirb/common.txt -t 20
				elif [ $go == 2 ]
				then
					gobuster dir -u http://$ip/	-w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 15
				fi


elif [ $options == 3 ]
then

	echo "web page status code "
	curl -I http://$ip/


elif [ $options == 4 ]
then
	echo "ftp brute force  default username [ admin ]"
	 hydra -t 1 -l admin -P /usr/share/wordlists/rockyou.txt -vV $ip ftp

elif [ $options == 5 ]
then
	echo "ssh brute force default username [ root ]"
	hydra -s 22 -v -V -l root -P /usr/share/wordlists/rockyou.txt -t 8 $ip ssh
elif [ $options == 6 ]
then
	joomscan -u http://$ip/
elif [ $options == 7 ]
then
	nikto -h http://$ip/
elif [ $options == 8 ]
then
	skipfish -o vulnerbles  http://$ip/
else
	echo "invalid options try again "
fi
