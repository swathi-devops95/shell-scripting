#!/bin/bash

# echo "demo on if usage"

# ACTION=$1
# if [ "$ACTION" == "start" ] ;then
#     echo "start payment"
#     exit 0
# fi


#case-2

echo "demo on if usage"

ACTION=$1                                       #"taking the arg from command"
if [ "$ACTION" == "start" ] ; then
    echo "start payment"
    exit 0
else
    echo "valid option is start only "
    exit 1

fi


#case-3
echo "demo on if usage"

ACTION=$1
if [ "$ACTION" == "start" ] ; then
    echo "start payment"
    exit 0

else if [ "$ACTION" == "stop" ] ; then
        echo "stop payment"
        exit 1

 else if [ "$ACTION"== "restart" ] ; then
        echo "restart payment"
        exit 2


else 
        echo -e "\e[32m valid options are start or stop or restart \e[0m"
        echo -e "\e[33m example usage \e[0m :\n \t bash scriptname stop \e[0m "
        exit 3
    fi