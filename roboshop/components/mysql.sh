#!/bin/bash

#echo "I am mysql"


#USER_ID=$(id -u)
COMPONENT=mysql
#LOGFILE="/tmp/${COMPONENT}.log"
 source components/common.sh
 #echo -e "\e[32m  ${COMPONENT} Installation is completed  \e[0m \n"

 

 
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

echo -e "\e[35m  Configuring ${COMPONENT} .....! \e[0m \n"
echo -n "Configuring ${COMPONENT} repo : "
 curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/stans-robot-project/mysql/main/mysql.repo
stat $?


 echo -n  "Installing ${COMPONENT}:"
 yum install mysql-community-server -y        &>> ${LOGFILE}
 stat $?


 echo -n "starting ${COMONENT} :"
   systemctl enable mysqld           &>> ${LOGFILE}
   systemctl start mysqld             &>> ${LOGFILE}
   stat $?

   echo -n "Extracting the default mysql root password :"
   DEFAULT_ROOT_PASSWORD=$( grep 'temporary password' /var/log/mysqld.log | awk -F " " '{print $NF}')
   stat $?

#This should happens only once and that to for the first time, when it runs for the second time job fails
#we need to ensure that this runs only once

   echo "show databases;" | mysql -uroot -pRoboShop@1         &>> ${LOGFILE}  
   if [ $? -ne 0 ]; then
   echo -n "performing default password reset of root account :"
   echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'RoboShop@1'" | mysql  --connect-expired-password  -uroot -p$DEFAULT_ROOT_PASSWORD        &>> ${LOGFILE}  
   stat $?
   fi
   #Roboshop@1 we need to use as password"

  echo "show plugins;" | mysql -uroot -pRoboShop@1  | grep  validate_password     &>> ${LOGFILE} 
  if [ $? -eq 0 ]; then
   echo -n "uninstalling password-validate plugin :"
   echo "uninstall plugin validate_password" |  mysql -uroot -pRoboShop@1         &>> ${LOGFILE} 
   stat $?
   fi
  
   echo -n " Downloading the ${COMPONENT} schema:"
   curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
   stat $?

   echo -n " Extracting the ${COMPONENT} schema:"
   cd /tmp
   unzip -o /tmp/${COMPONENT}.zip     &>> ${LOGFILE} 
   stat $?

   echo -n "injecting the schema:"
   cd ${COMPONENT}-main
   mysql -u root -pRoboShop@1 <shipping.sql     &>> ${LOGFILE} 
   stat $?

 echo -e "\e[32m  ${COMPONENT} Installation is completed  \e[0m \n"


# cd /tmp
# unzip mysql.zip
# cd mysql-main
# mysql -u root -pRoboShop@1 <shipping.sql









