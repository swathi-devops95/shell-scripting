#!/bin/bash

#echo "I am rabbitmq"


 COMPONENT=rabbitmq
 source components/common.sh


 echo -e "\e[32m  ${COMPONENT} Installation completed .....! \e[0m \n"

 echo -n "configiring ${COMPONENT} repositories:"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash  &>> ${LOGFILE} 
 curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh |  bash     &>> ${LOGFILE}


echo -n "Installing ${COMPONENT}:"
yum install rabbitmq-server -y       &>> ${LOGFILE}
stat $?


echo -n "starting ${COMPONENT}:"
systemctl enable rabbitmq-server 
systemctl start rabbitmq-server      &>> ${LOGFILE}
systemctl status rabbitmq-server     &>> ${LOGFILE} 
stat $?

echo -n "createing ${COMPONENT} user account:"
rabbitmqctl add_user roboshop roboshop123      &>> ${LOGFILE}  
stat $?

echo -n "Configuring the permissions:"
rabbitmqctl set_user_tags roboshop administrator
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
stat $?



















