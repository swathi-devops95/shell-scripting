#!bin/bash

# Each and every colour on a terminal you see will have a colour code and we need to use that code based on your need.

# color       foreground      background
# red               31              41
# green             32              42
# yellow            33              43
# blue              34              44
# magenta           35              45
# cyan              36              46

# syntax to print the color:
# echo -e "\e[colorcodem  your message to be printed in colour \e[0m"
# Example:
# echo -e "\e[33m iam printing yellow colour \e[0m"

echo -e "\e[33m iam printing yellow color \e[0m"
echo -e "\e[32m iam printing green color \e[0m"
echo -e "\e[31m iam printing red color \e[0m"
echo -e "\e[34m iam printing blue color \e[0m"
echo -e "\e[35m iam printing magenta color \e[0m"
echo -e "\e[36m iam printing cyan color \e[0m"

# To print something with background+foreground here is the syntax

#  echo -e "\e[backgroundcode;forgroundcode  your msg \e[0m"
# Example :
# echo -e "\e[43;34 print both colors \e[0m"
