#! /bin/bash

echo -e "\e[5m\e[106m\e[91m	KRISHNAN_SAI	\e[m\e[m\e[25m"

echo -e "Enter the file name : \c"
read file

if [ -e $file ]
then
	if [ -w $file ] && [ -r $file ]
	then
		echo "you have a file with write & read  permission"
		echo -e "\e[93m `ls -la $file` \e[m"
		cat $file
		echo
	fi
else
	echo "you don't have file"
fi



