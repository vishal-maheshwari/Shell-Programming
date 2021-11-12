#!/bin/env bash
#Largest of three numbers
declare -i i j k max
read -p "Enter three numbers: " i j k
max=$[i>j?i:j]
max=$[i>k?i:k]
printf "The largest number is %d\n" $max
exit 0
