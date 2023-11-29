#!/bin/bash

# echo "demo on if usage"

# ACTION=$1
# if [ "$ACTION" == "start" ] ;then
#     echo "start payment"
#     exit 0
# fi


#case-2

echo "demo on if usage"

ACTION=$1
if [ "$ACTION" == "start" ] ; then
    echo "start payment"
    exit 0
else
    echo "valid option is start only "
    exit 1

fi