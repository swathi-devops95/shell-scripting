#!/bin/bash

set -e

#echo "I am frontend"
# validate the user who is running the script is a root user or not

 USER_ID=$(id -u)
 COMPONENT=frontend
 LOGFILE="/tmp/${COMPONENT}.log"
if [ $USER_ID -ne 0 ]  ; then
    echo -e "\e[31m script is expected to be executed by the root user or with a sudo privilige \e[0m \n\t Example: \n\t\t sudo bash wrappers.sh frontend"
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

# echo "congfiguring frontend"
echo -e "\e[35m  Configuring ${COMPONENT} .....! \e[0m \n"
echo -n "installing nginx : "
yum install nginx -y  &>>  ${LOGFILE}
stat $?

echo -n -e "\e[33m  Starting nginx : \e[0m"
systemctl enable nginx  &>>  ${LOGFILE}
systemctl start nginx   &>>  ${LOGFILE}
stat $?

echo -n "Downloading ${COMPONENT} component:"
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
stat $?

echo -n "Clean up of ${COMPONENT} :" 
 cd /usr/share/nginx/html
 rm -rf * &>>  ${LOGFILE}
 stat $?

 echo -n "Extracting ${COMPONENT} :"
 unzip /tmp/${COMPONENT}.zip  &>> ${LOGFILE}
 mv ${COMPONENT}-main/* .
 mv static/* .
 rm -rf ${COMPONENT}-main README.md
 mv localhost.conf /etc/nginx/default.d/roboshop.conf
 stat $?

 echo -n "updating backend components in reverse proxy file :"
 for components in catalogue user cart shipping ; do
 sed -i -e "/${COMPONENT}/s/localhost/${COMPONENT}.roboshop/"  /etc/nginx/default.d/roboshop.conf
 done

 echo -n "Restarting ${COMPONENT}:"
 systemctl daemon-reload   &>> ${LOGFILE}
 systemctl restart nginx   &>> ${LOGFILE}
 stat $?

 echo -e "\e[35m  ${COMPONENT} Installation is completed  \e[0m \n"















# yum install nginx -y
# systemctl enable nginx
# systemctl start nginx

# curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

# cd /usr/share/nginx/html
# rm -rf *
# unzip /tmp/frontend.zip
# mv frontend-main/* .
# mv static/* .
# rm -rf frontend-main README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf




# INITIAL PROCESS:
#  USER_ID=$(id -u)
# if [ $USER_ID -ne 0 ]  ; then
#     echo -e "\e[31m script is expected to be executed by the root user or with a sudo privilige \e[0m \n\t Example: \n\t\t sudo bash wrappers.sh frontend"
#     exit 1
# fi

# stat() {
# if [ $? -eq 0 ] ; then
#     echo -e "\e[32m success \e[0m"
# else
#     echo -e "\e[31m failure \e[0m"
# fi
# }

# #echo -e "\e[31m Script is expected to executed by the root user or with a sudo privilege \e[0m \n \t Example: \n\t\t sudo bash wrapper.sh frontend"


# # echo "congfiguring frontend"
# echo -e "\e[31m Configuring frontend .....! \e[0m \n"
# echo -n -e "\e[33m  installing frontend : \e[0m"
# yum install nginx -y  &>>  /tmp/frontend.log  

# if [ $? -eq 0 ] ; then
#     echo -e "\e[32m success \e[0m"
# else
#     echo -e "\e[31m failure \e[0m"
# fi

# echo -n "Starting nginx : "
# systemctl enable nginx
# systemctl start nginx

# if [ $? -eq 0 ]; then
#     echo  -e "\e[32m success \e[0m"
# else
#     echo -e "\e[31m failure \e[0m"
# fi

# echo -n "Downloading frontend component:"
# curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

# if [ $? -eq 0 ]; then
#     echo -e "\e[32m success \e[0m"
# else
#     echo -e "\e[31m failure \e[0m"
# fi
