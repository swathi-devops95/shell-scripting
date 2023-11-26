#!/bin/bash
#exit codes are very very important
#each and every action  in  linux will have an exit code when something comlptes it will have a exit code whether it is successful or failure
# 0-255 is the range of the codes
#among all 0 represents the last action completed succesfully   
#Any thing in between 1-250reprsents partial success,partial failure,or complete failure

# "Using this exit codes we determine whether the prvious command is a success or failure"- Based on yhat we are going to do lot of validations.
#tou take any scripts in the internet you can see extensively $?

# ex:go to terminal ->ls-ltr enter->and type->  echo $? -> enter you can see 0 as a result that means action completed succssfully