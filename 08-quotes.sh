#!/bin/bash

echo "$$"    # $$ is going to print the PID of the current proces 
echo "$#"    # $# is going to print the number of arguments
echo "$?"    # $? is going to print the exit code of the last command.
echo "$*"   # $* is going to print the used arguments       
echo "$@"    # $* is going to print the used arguments

#Above will give you the values of special variables

echo '$$'   # $$ is going to print the PID of the current proces 
echo '$#'   # $# is going to print the number of arguments
echo '$?'   # $? is going to print the exit code of the last command.
echo '$*'   # $* is going to print the used arguments   
echo '$@'   # $* is going to print the used arguments

#Single quotes will supress the value of a special variables
#Whenever you have a special variables avoid single quotes prefer going with double  quotes

