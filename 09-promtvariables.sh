#!/bin/bash

# whenever you are asked to enter your details that means breaking the script and ebtering promts comes into picture

read -p "enter your name:" name     #whatever name you enter will be saved under a variable called name
                                    #"enter your name" is a promt
echo -e "name of the person who ran the script is $name"