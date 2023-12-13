#!/bin/bash

#echo "I am mysql"


USER_ID=$(id -u)
COMPONENT=mysql
LOGFILE="/tmp/${COMPONENT}.log"
 #source components/common.sh
# echo -e "\e[32m  ${COMPONENT} Installation is completed  \e[0m \n"

 

 
if [ $USER_ID -ne 0 ]  ; then
    echo -e "\e[31m script is expected to be executed by the root user or with a sudo privilige \e[0m \n\t Example: \n\t\t sudo bash wrappers.sh mongodb"
    exit 1
fi

stat() {
if [ $1 -eq 0 ] ; then
    echo -e "\e[32m success \e[0m"
else
    echo -e "\e[31m failure \e[0m"
    exit 2
fi

}

echo -e "\e[31m  Configuring ${COMPONENT} .....! \e[0m \n"
echo -n "Configuring ${COMPONENT} repo : "
 curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/stans-robot-project/mysql/main/mysql.repo
stat $?


 echo -n  "Installing ${COMPONENT}:"
 yum install mysql-community-server -y        &>> ${LOGFILE}
 stat $?





