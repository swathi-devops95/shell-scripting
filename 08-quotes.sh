#!/bin/bash

echo "$$"    # $$ is going to print the PID of the current proces 
echo "$#"    # $# is going to print the number of arguments
echo "$?"    # $? is going to print the exit code of the last command.
echo "$*"   # $* is going to print the used arguments       
echo "$@"    # $* is going to print the used arguments

#when you gp and execure the script it will show you like this-----
#1725----process id of script
#0------arguments count
#0------exit code

#Above will give you the values of special variables

echo '$$'   # $$ is going to print the PID of the current proces 
echo '$#'   # $# is going to print the number of arguments
echo '$?'   # $? is going to print the exit code of the last command.
echo '$*'   # $* is going to print the used arguments   
echo '$@'   # $* is going to print the used arguments



#when you gp and execute this the result will be:
# $$
# $#
# $?
# $*
# $@


#Single quotes will supress power of  the value of a special variables----''
#Whenever you have a special variables avoid single quotes prefer going with double  quotes---" "

