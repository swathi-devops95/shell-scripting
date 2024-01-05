#!/bin/bash

# To create a sever what information do we needed????
# 1)AMI ID
# 2)Type of instance
# 3)Security group ID
# 4)How many instances do we need??
# 5)DNS record :hosted zone ID

COMPONENT=$1
if [ -z $1 ] ; then                                                                                                    #if the first argumnt is false that means first argument is empty i want to make an action
    echo -e "\e[31m COMPONENT NAME IS NEEDED \e[0m \n\t\t"
    echo -e "\e[35m ex usage: \e[0m  \n\t\t $ bash launch-ec2.sh shipping"
    exit 1
fi
                                                                                                                        #AMI_ID="ami-0f75a13ad2e340a58"
AMI_ID="$(aws ec2 describe-images --filters "Name=name,Values= DevOps-LabImage-CentOS7" | jq ".Images[].ImageId" |sed -e 's/"//g')"
INSTANCE_TYPE="t2.micro"
#SG_ID="sg-02a14ad899c6d4f4e"            #B55_ALLOW_ALL SECURITY GROUP ID
SG_ID="$(aws ec2 describe-security-groups --filters Name=group-name,Values=B55_Allow_All | jq ".SecurityGroups[].GroupId" |sed -e 's/"//g')"
HOSTEDZONEID="Z02387131OVDT30NOMVXF"    

# create_ec2() {
echo -e "**** Creating \e[35m ${COMPONENT} \e[0m server is in progress ****"

PRIVATEIP=$(aws ec2 run-instances --image-id ${AMI_ID} --instance-type ${INSTANCE_TYPE}  --security-group-ids ${SG_ID}  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq '.Instances[].PrivateIpAddress' |sed -e 's/"//g')

###This above command will create you an instanc along with fetching private ip address of instance and ithout quotes

echo -e "Private ip Address of $COMPONENT IS $PRIVATEIP \n\n"               #HERE WE ARE CAPTURING PRIVATE IP HOW TO CREATE DNS RECORD????

echo -e "creating DNS record of ${COMPONENT} is:"

sed -e "s/COMPONENT/${COMPONENT}/" -e "s/IPADDRESS/${PRIVATEIP}/" route53.json > /tmp/r53.json

 aws route53 change-resource-record-sets --hosted-zone-id $HOSTEDZONEID --change-batch file:///tmp/r53.json
echo -e "\e[36m **** Creating DNS record for the $COMPONENT has completed ****\e[0m \n\n"

# }

# if [ "$1" == "all" ]; then

#     for component in frontend mongodb catalogue redis user mysql  cart rabbitmq shipping payment; do
#     COMPONENT=$component
#     create_ec2
# done

# else
#      create_ec2

# fi

















 #aws ec2 run-instances --image-id "ami-0f75a13ad2e340a58" --instance-type t2.micro  --security-group-ids sg-02a14ad899c6d4f4e   --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=lab}]" | jq .




#aws cli command to launch an instance::::
#aws ec2 run-instances --image-id ami-xxxxxxxx --count 1 --instance-type t2.micro --key-name MyKeyPair --security-group-ids sg-903004f8 --subnet-id subnet-6e7f829e
########################################## 
#--tag-specifications 'ResourceType=instance,Tags=[{Key=webserver,Value=production}]' 'ResourceType=volume,Tags=[{Key=cost-center,Value=cc123}]'

#Each and every  resource that you create in enterprise will have tags:
# BU-which business unit i belongs to
# ENV-which environment it belongs to whether it is a production machine or "testing" or "development" or "production"
# APP: What is the appliction we are running on machine.
# Cost centre






# aws ec2 describe-images \
#     --owners amazon \
#     --filters "Name=name,Values= DevOps-LabImage-CentOS7" "Name=root-device-type,Values=ebs"
#     aws ec2 describe-images --filters "Name=name,Values= DevOps-LabImage-CentOS7" 



#aws ec2 describe-security-groups --filters Name=group-name,Values=B55_Allow_All | jq ".SecurityGroups[].GroupId" |sed -e 's/"//g'