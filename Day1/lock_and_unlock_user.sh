#!/bin/bash
read -p "lock or unlock the user: " operation 
read -p "Enter user name : " user


if [ -z $operation ]
then
   echo "Enter lock or unlock"
   exit 0
fi


if [ -z $user ]
then
   echo "user value is empty"
else

   if id $user &> /dev/null  &&  [ "$operation" == "lock" ]
   then
    	passwd -l $user &> /dev/null
      	echo "locking success"
   fi


   if id $user &> /dev/null  && [ "$operation" == "unlock" ]
   then
        passwd -u $user &> /dev/null
        echo "user unlocked"
   fi

fi

