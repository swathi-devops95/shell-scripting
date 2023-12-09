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
    if [ $1 -eq  0 ] ; then
        echo -e "\e[32m sussess \e[0m"
    else
        echo -e "\e[31m failure \e[0m"
        exit 2
    fi
}

echo -e "\e[31m Configuring ${COMPONENT}......! \e[0m"
echo -n "configuring ${COMPONENT} repo : "
 yum install https://rpm.nodesource.com/pub_16.x/nodistro/repo/nodesource-release-nodistro-1.noarch.rpm -y      &>> ${LOGFILE}
stat $1

echo -e "Installing nodejs :"
yum install nodejs -y       &>> ${LOGFILE}
stat $?

echo -n "Creating Application User Account :"
useradd roboshop
stat $?





















# yum install nodejs -y  

#  USER_ID=$(id -u)
#  COMPONENT=frontend
#  LOGFILE="/tmp/${COMPONENT}.log"
# if [ $USER_ID -ne 0 ]  ; then
#     echo -e "\e[31m script is expected to be executed by the root user or with a sudo privilige \e[0m \n\t Example: \n\t\t sudo bash wrappers.sh frontend"
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

# # echo "congfiguring frontend"
# echo -e "\e[31m  Configuring ${COMPONENT} .....! \e[0m \n"
# echo -n  "installing nginx : "
# yum install nginx -y  &>>  ${LOGFILE}
# stat $?

# echo -n -e "\e[33m  Starting nginx : \e[0m"
# systemctl enable nginx  &>>  ${LOGFILE}
# systemctl start nginx   &>>  ${LOGFILE}
# stat $?

# echo -n "Downloading ${COMPONENT} component:"
# curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
# stat $?

# echo -n "Clean up of ${COMPONENT} :" 
#  cd /usr/share/nginx/html
#  rm -rf * &>>  ${LOGFILE}
#  stat $?

#  echo -n "Extracting ${COMPONENT} :"
#  unzip /tmp/${COMPONENT}.zip  &>> ${LOGFILE}
#  mv ${COMPONENT}-main/* .
#  mv static/* .
#  rm -rf ${COMPONENT}-main README.md
#  mv localhost.conf /etc/nginx/default.d/roboshop.conf
#  stat $?

#  echo -n "Restarting ${COMPONENT}:"
#  systemctl daemon-reload   &>> ${LOGFILE}
#  systemctl restart nginx   &>> ${LOGFILE}
#  stat $?

#  echo -e "\e[31m  ${COMPONENT} Installation is completed  \e[0m \n"



    