#!/bin/bash

#echo "I am cart"

COMPONENT=cart
#This is how we import the functions that are declared in a different files using source
source components/common.sh

NODEJS      #Calling nodejs function

echo -e "\e[32m  ${COMPONENT} Installation is completed  \e[0m \n"


# USER_ID=$(id -u)
# COMPONENT=cart
# LOGFILE="/tmp/${COMPONENT}.log"
# APPUSER="roboshop"

# if [ $USER_ID -ne 0 ] ; then
#     echo -e "\e[31m script is expected to be executed by root or with a sudo priviliged user \e[0m \n\t Example: \n\t sudo bash wrappers.sh cart"
#     exit 1
# fi

# stat() {
# if [ $1 -eq 0 ] ; then
#     echo -e "\e[32m success \e[0m"
# else
#     echo -e "\e[31m failure \e[0m"
#     exit 2
# fi

# }


# echo -e "\e[35m Configuring ${COMPONENT}......! \e[0m \n"

# echo -n "configuring ${COMPONENT} repo : "
# curl --silent --location https://rpm.nodesource.com/setup_16.x |bash -   &>> ${LOGFILE}
# stat $?

# echo -n -e "\e[33m Installing nodejs : \e[0m"
# yum install nodejs -y    &>> ${LOGFILE}
# stat $?

# id ${APPUSER}    &>> ${LOGFILE}
# if [ $? -ne 0 ]; then
# echo -n "Creating Application User Account :"
# useradd roboshop
# stat $?
# fi

# echo -n "Downloading the ${COMPONENT} : "
# curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
# stat $?

# echo -n "Copying the ${COMPONENT} to ${APPUSER} home directory"
# cd /home/${APPUSER}/
# rm -rf ${COMPONENT}   &>> ${LOGFILE}
# unzip -o /tmp/${COMPONENT}.zip   &>> ${LOGFILE}
# stat $?

# echo -n "changing the ownership :"
# mv ${COMPONENT}-main ${COMPONENT}
# chown -R ${APPUSER}:${APPUSER} /home/${APPUSER}/${COMPONENT}/
# stat $?

# echo -n "Generating the ${COMPONENT} artifacts :"
# cd /home/${APPUSER}/${COMPONENT}/
# npm install    &>> ${LOGFILE}
# stat $?

# echo -n "Configuring the ${COMPONENT} system file : "
# sed -ie 's/REDIS_ENDPOINT/redis.roboshop.internal/'  /home/${APPUSER}/${COMPONENT}/systemd.service
# sed -ie 's/CATALOGUE_ENDPOINT/catalogue.roboshop.internal/'  /home/${APPUSER}/${COMPONENT}/systemd.service
# mv /home/${APPUSER}/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
# stat $?

# echo -n "Starting the ${COMPONENT} SERVICE :"
# systemctl daemon-reload
# systemctl enable ${COMPONENT}   &>> ${LOGFILE}
# systemctl restart ${COMPONENT}  &>> ${LOGFILE}
# stat $?

#  echo -e "\e[32m  ${COMPONENT} Installation is completed  \e[0m \n"
