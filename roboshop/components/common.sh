#!/bin/bash

#All the common functions will be declared here.Rest of the components will be sourcing the functions from its file

LOGFILE="/tmp/${COMPONENT}.log"
APPUSER="roboshop"
USER_ID=$(id -u)

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


#USER ACCOUNT:
#This user account is common for all the 6 components in project so declare once and we use it "n" number of times

#Creating a user account:::

CREATE_USER() {                                 ##CREATE_USER IS A FUNCTION NAME 
id ${APPUSER}    &>> ${LOGFILE}
if [ $? -ne 0 ]; then
echo -n "Creating Application User Account :"
useradd roboshop
stat $?
fi
}
DOWNLOAD(){
    echo -n "Downloading the ${COMPONENT} : "
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
stat $?
}


#Download and Extract:
EXTRACT() {

 DOWNLOAD    #DOWNLOAD THE COMPONENT
echo -n "Downloading the ${COMPONENT} : "
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
stat $?


cd /home/${APPUSER}/
rm -rf ${COMPONENT}   &>> ${LOGFILE}
unzip -o /tmp/${COMPONENT}.zip   &>> ${LOGFILE}
stat $?

echo -n "changing the ownership :"
mv ${COMPONENT}-main ${COMPONENT}
chown -R ${APPUSER}:${APPUSER} /home/${APPUSER}/${COMPONENT}/       #chown changes the ownership of file
stat $?

}


#configuring the service

CONFIG_SVE(){

 echo -n "Configuring the ${COMPONENT} system file : "
sed -i -e's/REDIS_ENDPOINT/redis.roboshop.internal/' -e 's/CATALOGUE_ENDPOINT/catalogue.roboshop.internal/' -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/'  -e 's/REDIS_ENDPOINT/redis.roboshop.internal/' -e 's/MONGO_ENDPOINT/mongodb.roboshop.internal/'   /home/${APPUSER}/${COMPONENT}/systemd.service
#sed -ie 's/REDIS_ENDPOINT/redis.roboshop.internal/'  /home/${APPUSER}/${COMPONENT}/systemd.service
#sed -ie 's/MONGO_ENDPOINT/mongodb.roboshop.internal/'  /home/${APPUSER}/${COMPONENT}/systemd.service
mv /home/${APPUSER}/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
stat $?

echo -n "Starting the ${COMPONENT} SERVICE :"
systemctl daemon-reload
systemctl enable ${COMPONENT}   &>> ${LOGFILE}
systemctl restart ${COMPONENT}  &>> ${LOGFILE}
stat $?
}



#Declaring nodejs function :::               
#RIGHT NOW WE HAVE 3 APPLICATIONS WHICH USES NODEJS APPLICATIONS ,ALL THESE NOSEJS COMPONENTS ARE HAVING SAME STEPS
#WRITING THE SAME STEPS 3 TIMES IS A WASTE OF TIME SO DECLARE A FUNCTION WE WRITE IT ONCE  AND WE CALL IT N NUMBER OF TIMES.
#That is the strategey

NODEJS() {

echo -e "\e[35m Configuring ${COMPONENT}......! \e[0m \n"

echo -n "configuring ${COMPONENT} repo : "
curl --silent --location https://rpm.nodesource.com/setup_16.x |bash -   &>> ${LOGFILE}
stat $?

echo -n -e "\e[33m Installing nodejs : \e[0m"
yum install nodejs -y    &>> ${LOGFILE}
stat $?

CREATE_USER                 #Calls CREATE_USER fuynction that creates user account   .      

                            #WE CALLED A FUNCTION INSIDE A FUNCTION ,HERE AFTER CONFIGURING REPO AND INSTALLING PACKAGE
                            #WE NEED TO CREATE A USER ACCOUNT CALLED ROBOSHOP SO THAT WHY WE CALLED CREATE_USER FUNCTION GERE


EXTRACT        #calls DOWNLOAD_AND_EXTRACT function that download and extract components

echo -n "Generating the ${COMPONENT} artifacts :"
cd /home/${APPUSER}/${COMPONENT}/
npm install    &>> ${LOGFILE}               #Will generate artifact
stat $?


}



