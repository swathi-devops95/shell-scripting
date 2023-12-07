#!/bin/bash

# What is a variable???
     #  A variable is something that holds the value which is "dyanamic"
# variable is used to declare the values:a,b,c are variables which holds values 10,20,xyz

    a=10                                    # a is a integer
    b=20                                    # b is a integer      
    c=xyz                                   # c is a string.
    x=

# IN LINUX/SHELL SCRIPTING THERE IS NO CONCEPT OF DATATYPES BY DEFAULT EVEYTHING IS A "STRING"

# If your input or variables are having special characters enclose them in double quotes ""

# How can i print the value of a variable????
      #  Using special character we are going to print the value of a variable.

# $: this is the special character used to print the value of a variable

# echo a    (gives you a)
# echo $a   (gives u value assigned to a)

echo $a
echo $b
echo $c

echo "printing the value of a : $a"             # $a and ${a} gives tou same result--prefer to use {}
echo "printing the value of a : ${a}"
echo "printing the value of b : ${b}"
echo "printing the value of x :${x}"


#[]-Square bracket
#{}- Flower bracket
#()- Paranthesis

echo "printing the value of c : $c"


