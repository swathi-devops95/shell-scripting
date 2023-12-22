#!/bin/bash

#echo "I am rabbitmq"

LOGFILE="/tmp/${COMPONENT}.log"
USER_ID=$(id -u)
COMPONENT=rabbitmq


if [ $USER_ID -ne 0 ] ; then
    echo -e "\e[31m script is expected to be executed by root or with a sudo priviliged user \e[0m \n\t Example: \n\t sudo bash wrappers.sh catalogue"
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

#  source components/common.sh


echo -n  -e "\e[35m  configuring ${COMPONENT}.....! \e[0m \n"

echo -n "configuring ${COMPONENT} repositories:"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash  &>> ${LOGFILE} 
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash     &>> ${LOGFILE}
stat $?

echo -n "Installing ${COMPONENT}:"
yum  install rabbitmq-server -y       &>> ${LOGFILE}
stat $?

#  echo -n "starting ${COMPONENT}:"
# systemctl enable rabbitmq-server 
# systemctl start rabbitmq-server      &>> ${LOGFILE}
# systemctl status rabbitmq-server     &>> ${LOGFILE} 
#  stat $?

# sudo rabbitmqctl list_users | grep roboshop     &>> ${LOGFILE}
#     if [ $?  -ne  0 ] ; then
# echo -n "creating ${COMPONENT} user account:"
# rabbitmqctl add_user roboshop roboshop123      &>> ${LOGFILE}  
# stat $?
# fi

# echo -n "Configuring the permissions:"
# rabbitmqctl set_user_tags roboshop administrator
# rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
# stat $?



#  echo -e "\e[32m  ${COMPONENT} Installation completed .....! \e[0m \n"























