#!/bin/bash

#echo "I am catalogue"

USER_ID=$(id -u)
COMPONENT=catalogue
LOGFILE="/tmp/${COMPONENT}.log"
APPUSER="roboshop"

if [ $USER_ID -ne 0 ] ; then
    echo -e "\e[31m script is expected to be executed by root or with a sudo priviliged user \e[0m \n\t Example: \n\t sudo bash wrappers.sh catalogue "
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



echo -e "\e[35m Configuring ${COMPONENT}......! \e[0m \n"

echo -n "configuring ${COMPONENT} repo : "
curl --silent --location https://rpm.nodesource.com/setup_16.x |bash -    &>> ${LOGFILE}
stat $?

echo -n -e "\e[33m Installing nodejs : \e[0m"
yum install nodejs -y       &>> ${LOGFILE}
stat $?

id ${APPUSER}    &>> ${LOGFILE}
if [ $? -ne 0 ]; then
echo -n "Creating Application User Account :"
useradd roboshop
stat $?
























    