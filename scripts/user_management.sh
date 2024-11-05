#!/usr/bin/env bash 

read -n 1 -t 10 -p " 
user management system :
 1. add user
 2. remove user
 3. add user to a group
 4. remove user from a group
 5. lock/unlock user (prevent login)
 what do you like to do:   " choice
 echo 

# adding users
if [[ $choice == 1 ]];then
  read -p " username: " name 
  read -n 1 -p "creating a home dirctory for user [y/n]: " home
  echo 
  [[ $home == y ]] && sudo useradd -m $name || sudo useradd $name 
  echo "created a new user named "$name""
# removing users
elif [[ $choice == 2 ]];then
  read -p " username: " name 
  read -n 1 -p "remove home directory [y/n]: " homdir
  [[ $homedir == y ]] && sudo userdel -r $name || sudo userdel -r $name
# adding user to a group 
elif [[ $choice == 3 ]];then
  read -p " username: " name 
  read -p "group name: " group
  read -n 1 -p "make this the primary group [y/n]: " primary
  [[ $primary == y ]] && sudo usermod -G $group $name || sudo usermod -g $group $name  
  echo 
  echo "added user '$name' to the group '$group'. "
# removing user from a group 
elif [[ $choice == 4 ]];then
  read -p " username: " name 
  read -p "group name: " group
  sudo gpasswd --delete $name $group 
  echo 
  echo "$name removed from group $group "
# lock/unlock user
elif [[ $choice == 5 ]];then
  read -p "username: " name 
  read -n 1 -p "lock or unlock: [l/u]: " lock 
  echo 
  [[ lock == l ]] && sudo usermod -L $name || sudo usermod -U $name 
  [[ $? == 0 ]] && echo "Done!"
else 
  echo "something went wrong"
fi




 
