#!/bin/bash

#There  are four types of commands avialbale:

# 1) Binary             (/bin, /sbin)
                       # /bin-commands which are saved inside bin are regular commands -ex-go to terminal and  (type cat   enter) you can see->cat is /user/bin/cat
                                                                                                               # (type yum  enter) you can see->yum is /user/bin/yum
                       #/sbin-  (secure bin) commands which are saved in sbin are secure commands that can be invoked only by the  "root user"

# 2) Aliases            (Aliases are shortcuts      aliase net ="netstat-tulpn")
#3)Shell -built in commands         commands comes up with "shell"
                                    # ex- got to terminal
                                    #     type cd  -> enter  ->cd is a shell builtin
                                    #     type echo -> enter -> echo is a builtin
                                    #     type break -> enter -> break is a shell builtin

#4) Functions                       # Functions are nothing but a set of commands that can be written in a sequence order and can be called n number of times whenever required.


# how to declare a function:-

#This is how we declare a function :

# f() {

#     echo hai
# }

# f               # this is how we call a function.   

# devops() {
#            echo    this is aws devops course
#            echo    the entire course is trained by me
#            echo    we are going to teach you all market standards
#            echo    course tenure is 3 months
#            echo    all you need to do is hands on practise on daily basis
# }

# devops
#             echo  message completed

# sleep 10
# devops 
#             echo messahe completed
        
# sleep 10
# devops
#             echo message completed

# sample () {
#     echo " hi from sample function"
#     echo " sample function is completed"
#     echo "bye"
# }
# sample

hai () {
    echo hai
}


start() {

    hai

    echo "number of sessions opened are $(who | wc -l)"
    echo "todays date is $(date +%F)"
    echo "cpu utilization in last 5 min $(uptime |awk -F : '{print $NF}' | awk -F , '{print $2}')"
    echo "cpu utilization in last 15 min $(uptime |awk -F : '{print $NF}' | awk -F , '{print $3}')"
    

       
}

 
start
                            ## "calling a function fromanother function"


# "This is called declaring a function and calling a function"


#If you want to print since the machine is up the command is uptime

# Load average in last 5 min:
#uptime |awk -F : '{print $NF}' | awk -F , '{print $2}'