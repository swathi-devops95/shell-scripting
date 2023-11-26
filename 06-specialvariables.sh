#!/bin/bash

# Special variables give special properties to your variables
# Here are few of the special variables : $0 TO $9 ,  $? ,  $# , $* , $@

#ROCKET_NAME=CHANDRAYAN

a=10
b=20
c=30
echo value of a is :$a
echo value of b is :$b
echo value of c is :$c
echo $0      # $0 prints th script nme of you ar executing


echo "executed script name is : $0"     # we are harcoding it
echo "Name of the recently launched rocket in india  is : $1"          
echo "Name of the popular car in states is : $2"
echo "current topic is :$3"

#bash scriptname.sh  arg1 arg2 arg3     (you can supply upto 9 arguments)

#  bash scriptName.sh  arg1  arg2  arg3
# bash arg1  arg2  arg3 arg4  arg5  arg6 arg7  arg8  arg9  arg10 
#        1     2     3    4    5     6    7      8    9      10

# bash scriptName.sh 100   200   300    ( like this you can supply a maximum of 9 variables from the command line)
#                     $1    $2    $3  


echo $$    # $$ is going to print the PID of the current proces 
echo $#    # $# is going to print the number of arguments
echo $?    # $? is going to print the exit code of the last command.
echo $*    # $* is going to print the used variables        #(we used chandrayan,tesla,scripting you can see them after executing )
echo $@    # $* is going to print the used variables


