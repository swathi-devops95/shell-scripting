#!/bin/bash
#Taking the input from the command line "promt variable"

# whenever you are asked to enter your details that means breaking the script and entering  details promts comes into picture

read -p "enter your name:" name     #whatever name you enter will be saved under a "variable" called "name" that means name is a variable here.
                                    #"enter your name" is a promt
                                    # read is something which is not widely used
echo -e "name of the person who ran the script is $name"

## in the above line we used -e this e works only when we use escape sequence character(\n \t) otherwise it wont react if we mention also.