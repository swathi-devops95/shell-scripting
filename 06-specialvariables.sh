#!/bin/bash
# Special variables give special properties to your variables
# Here are few of the special variables : $0 TO $9 ,  $? ,  $# , $* , $@

 #ROCKET_NAME=CHANDRAYAN
echo $0      # $0 prints th script nme of you ar executing
echo $1
echo $2
echo "executed script name is : $0"     # we are harcoding it
echo "Name of the recently launched rocket in india  is : $1"        # WE ARE HARDCODING THIS ALSO
echo "Name of the popular car in states is : $2"
echo "current topic is :$3"

 #bash scriptname.sh  arg1 arg2 arg3     (you can supply upto 9 arguments)

