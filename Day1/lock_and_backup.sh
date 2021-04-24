#!/bin/bash

timestamp=$(date +%F)
while :
do

read -p "enter ur username to lock and back: " user


if [ -z $user ]
then 
    echo "username is not provided"
else
    if id $user &> /dev/null
    then
        passwd -l $user
        homeDir=$(grep ^${user}: /etc/passwd | cut -f6 -d ":" )
        if [ -d $homeDir ]
        then
             tar -cf ${user}-${timestamp}.tar $homeDir
             echo "home dir exists..."
        fi
        exit 0

    else
        echo "provided user $user not exists..."
    fi
fi

done

exit 1
