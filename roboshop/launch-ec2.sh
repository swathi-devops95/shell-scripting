#!/bin/bash

# To create a sever what information do we needed????
# 1)AMI ID
# 2)Type of instance
# 3)Security group ID
# 4)How many instances do we need??
# 5)DNS record :hosted zone ID

COMPONENT=$1
if [ -z $1 ] ; then     #if the first argumnt is false that means first argument is empty i want to make an action
    echo -e "\e[31m COMPONENT NAME IS NEEDED \e[0m \n\t\t"
    echo -e "\e[35m ex usage \e[0m  \n\t\t $ bash launch-ec2.sh shipping"
    exit 1
fi
AMI_ID="ami-0f75a13ad2e340a58"
INSTANCE_TYPE="t2.micro"
SG_ID="sg-02a14ad899c6d4f4e"            #B55 ALLOW ALL SECURITY GROUP ID

aws ec2 run-instances --image-id ${AMI_ID} --instance-type ${INSTANCE_TYPE}  --security-group-ids ${SG_ID}  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]"








#aws cli command to launch an instance::::
#aws ec2 run-instances --image-id ami-xxxxxxxx --count 1 --instance-type t2.micro --key-name MyKeyPair --security-group-ids sg-903004f8 --subnet-id subnet-6e7f829e
########################################## 
#--tag-specifications 'ResourceType=instance,Tags=[{Key=webserver,Value=production}]' 'ResourceType=volume,Tags=[{Key=cost-center,Value=cc123}]'

#Each and every  resource that you create in enterprise will have tags:
# BU-which business unit i belongs to
# ENV-which environment it belongs to whether it is a production machine or "testing" or "development" or "production"
# APP: What is the appliction we are running on machine.
# Cost centre