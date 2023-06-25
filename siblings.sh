#!/bin/bash

if [ $# -eq 0 ]; then
 # No file provided
 read -p "Enter username: " username
 read -p "Enter sibling: " sibling

 # Create user
 sudo useradd $username
 sudo usermod -a -G $sibling $username

 #Create website.txt file
 sudo -u $username touch /home/$sibling/website.txt
 sudo -u $username chmod 400 /home/$sibling/website.txt

 touch /home/$username/website.txt
 chmod 600 home/$username/website.txt

else
 #file provided
 file=$1

 if [ ! -f $file ]; then
   echo "File not found:" $file
   exit 1
 fi

 while IFS= read -r line; do
   username= $(echo "$line" | awk '{print $1}')
   sibling= $(echo "$line" | awk '{print $2}')

   sudo useradd $username
   sudo usermod -a -G $sibling $username

   sudo -u $username touch /home/$sibling/website.txt
   sudo -u $username chmod 400 /home/$sibling/website.txt

   touch /home/$username/website.txt
   chmod 600 /home/$username/website.txt

   done< $file
fi
