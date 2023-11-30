#!/bin/bash

#echo "I am frontend"
# validate the user who is running the script is a root user or not

USER_ID=$(ud -u)
if [ if $USER_ID -ne 0 ]  then ;
    echo -e "\e[31m script is expected to be executed by the root user or with a sudo privilige \e[0m \n\t Example : sudo bash wrappers.sh frontend"
    exit 1
fi

echo "congfiguring frontend"
yum install nginx -y

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