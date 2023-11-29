#!/bin/bash

# echo "demo on if usage"

# ACTION=$1
# if [ "$ACTION" == "start" ] ;then
#     echo "start payment"
#     exit 0
# fi


#case-2

 #echo "demo on if usage"

# ACTION=$1                                       #"taking the arg from command"
# if [ "$ACTION" == "start" ] ; then
#     echo "start payment"
#     exit 0
# else
#     echo "valid option is start only "
#     exit 1

# fi


#case-3
echo "demo on if usage"

ACTION=$1
if [ "$ACTION" == "start" ] ; then
    echo -e "\e[31m start payment \e[0m"
    exit 0

elif  [ "$ACTION" == "stop" ] ; then
        echo -e "\e[32m stop payment \e[0m"
        exit 1

 elif  [ "$ACTION" == "restart" ] ; then
        echo -e "\e[33m restart payment \e[0m"
        exit 2


else 
        echo -e "\e[32m valid options are start or stop or restart \e[0m"
        echo -e "\e[33m example usage \e[0m :\n \t bash scriptname stop "
        exit 3
    fi