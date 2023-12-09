#!/bin/bash

#echo "I am mongodb"
# validate the user who is running the script is a root user or not

 USER_ID=$(id -u)
 COMPONENT=mongodb
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
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo
 stat $?

 echo -n  "Installing ${COMPONENT}:"
 yum install -y mongodb-org  &>> ${LOGFILE}
 stat $?

 echo -n "Enabling the ${COMPONENT} visibility :"
 sed  -ie 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
 stat $?

 echo -n "Starting the ${COMPONENT}:"
 systemctl enable mongod  &>> ${LOGFILE}
 systemctl start mongod   &>> ${LOGFILE}

stat $?

echo -n "Downloading the ${COMPONENT} schema : "
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
stat $?

 echo -n "Extracting the ${COMPONENT} schema :"
 cd /tmp
 unzip ${COMPONENT}.zip     &>> ${LOGFILE}
 stat $?

 echo -n "Injecting ${COMPONENT} schema :"
 cd ${COMPONENT}-main
 mongo < catalogue.js            &>> ${LOGFILE}
 mongo < users.js                &>> ${LOGFILE}
 stat $?

 echo -e "\e[31m  ${COMPONENT} Installation completed .....! \e[0m \n"



















































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