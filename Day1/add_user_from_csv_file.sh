#!/bin/bash
users=$(cat user.sh)
for user in $users
 do
   if id $user &> /dev/null
     then
     echo "user already exist: $user"
   else
     useradd $user
     echo "new user added successfully: $user"
   fi
done
