# shell scripting

This repository contains all the  basics needed to learn bash/shell scripting and the major goal is to automate the entire configuration management procedure involved as a part of set-up.



## How to push the code to git hub ??

on your vscode ,open the folder(by using file option on your vscode or code foldername on your terminal)        



$ git add .   // This will let know git to start  tracking all files

$ git commit -m "updated the readme file"

$ git push    // This will push the code to repository on github


## How to open a folder on vscode with command?

$ code foldername

## This is a repository created to publish all the bah basics and project automatiom

*   This repo is created to share all the linux basics
*   Along with linux bash syntax
*   Then we will automate the infrastucture provisioning


## Following are the shell scripting topics which we discuss as a part of our project


1- shebang notation and comments

2- printing

3- Variables

         - Local variables
         -Environment variables
         -command substitution

4-Inputs
         - Special variables
         -promts

5- Functions

6- Redirectors ,quotes and exit status

7- Conditions

8- Loops

9- Basics of SED command

10- Commands




### Expressions are categorized into three
1. Numbers
2. Strings
3. Files

Operators on numbers:
-eq , -ne , -gt, -ge, -lt, -le              

[ 1 -eq 1 ] 
[ 1 -ne 1 ]

Operators on Strings:


    = , == , !=

    [ abc = abc ]

    -z , -n 

    [ -z "$var" ] -> This is true if var is not having any data
    [ -n "$var" ] _> This is true if var is having any data

    -z and -n are inverse proportional options


Operators on files:
    Lot of operators are available and you can check them using man pages of bash 

    [ -f file ] -> True of file exists and file is a regular file 

    [ -d xyz ]  -> True if file exists and it is a directory

    ### Explore the file types, There are 7 types on files in Linux.


COMMENT

ACTION=$1
 
if [ -z "$ACTION" ]; then 
    echo Argument is needed, Either start/stop
    
else 
    echo Thanks

fi  -->




# In Bash Scripting, even if the instruction x-fails, it just goes with the execution of other commands in sequence.
# That's the default behavior of BASH.
# If you don't want the script to proceeding further in case of any failure, you can use "set -e" in the beginning of the script.




###  How to keep our Roboshop Project Automation Code DRY ?  How can we eliminate the repititive code  

1) Best Possible Approach is define functions and call them on whenever you need.
2) The caviet here is, by default if you define a function inf x.sh , you can only call that function with in that file only.
3) To over the above challenge, what we can do is, we can define functions in a common.sh file and call all the needed functions from the common file.

a)  For nodejs components, let's create a function for nodejs and declare all the action in this and call it when you're using any nodejS   components.

b)  For python components, let's create a function for python and declare all the action in this and call it when you're using any python   components.

c)  For java components, let's create a function for java and declare all the action in this and call it when you're using any java components.

d)  For angularjs components, let's create a function for angularjs and declare all the action in this and call it when you're using any angularjs components.



