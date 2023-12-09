#!/bin/bash

echo "I am catalogue"

USER_ID=$(ud -u)
COMPONENT=catalogue
LOGFILE="\tmp\${COMPONENT}.log"
if [$USER_ID -ne 0] ; then
    echo -e "\e[31m script is expected to be executed by root or with a sudo priviliged user \e[0m\n\t Example: \n\t sudo bash wrappers.sh catalogue "
    exit 1
fi
    