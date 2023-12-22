#!/bin/bash

echo "I am shipping"
COMPONENT=shipping
#This is how we import the functions that are declared in a different files using source
source components/common.sh

JAVA     #Calling nodejs function

echo -e "\e[35m  ${COMPONENT} Installation is completed  \e[0m \n"