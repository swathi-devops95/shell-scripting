#!/bin/bash
#There are 4 type of commands avialable
# 1) Binary                     (/bin ,/sbin)
                                #/bin--commands which are saved inside the bin are regular commands.
                                #/sbin--commands which are saved in sbin which is nothing but secure bin are the commands which can be invoked only by the root user.

# 2) Aliases                    (Aliases are shortcuts, alias net="netstat -tulpn")

# 3) Shell built -in commands   #commands which comes with the shell
                                #ex-type cd ,type echo , type break 

# 4) Functions
            #functions are nothing but a set of commands that can be written in a sequence and cn be called n number of times as per 


# how to declare a function?

# This is how you declare a function 
# f() {
#     echo hai
# }        

# this is how we call a function
# f

#function is majorly used to group certain sort of things and call it whenever you want
#function helps you in eliminating repetive set of codes n number of times

# sample() {
#     echo hai
#     from sample function
#     echo sample function is completed
# }
# sample


# i would like to declare a function which tells statistics
stat() {
     echo "number of sessions opened are $(who | wc -l)"
     echo "todays date is $(date +%F)"
}
stat