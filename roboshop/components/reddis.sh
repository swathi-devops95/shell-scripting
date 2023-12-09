#!/bin/bash

#echo "I am reddis"

# validate the user who is running the script is a root user or not

 USER_ID=$(id -u)
 COMPONENT=reddis
 LOGFILE="/tmp/${COMPONENT}.log"

 
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
curl -L https://raw.githubusercontent.com/stans-robot-project/redis/main/${COMPONENT}.repo -o /etc/yum.${COMPONENT}.d/redis.repo    &>> ${LOGFILE}

 stat $?

 echo -n  "Installing ${COMPONENT}:"
 yum install redis-6.2.13 -y        &>> ${LOGFILE}
 stat $?

 echo -n "Enabling the ${COMPONENT} visibility :"
 sed  -ie 's/127.0.0.1/0.0.0.0/g' /etc/${COMPONENT}/${COMPONENT}.conf
 stat $?

 echo -n "Starting the ${COMPONENT}:"
 systemctl daemon-reload         &>> ${LOGFILE} 
 systemctl enable ${COMPONENT}   &>> ${LOGFILE}
 systemctl restart ${COMPONENT}    &>> ${LOGFILE}

stat $?

 echo -e "\e[32m  ${COMPONENT} Installation completed .....! \e[0m \n"





# curl -L https://raw.githubusercontent.com/stans-robot-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo
# yum install redis-6.2.13 -y