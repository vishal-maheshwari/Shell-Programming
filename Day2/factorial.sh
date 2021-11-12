#!/bin/env bash
#Factorial of a number
(($# == 1)) || {
	echo "Usage: $0" "<<number>>"
	exit 1
}
declare -i fact=1 number=$1 n
for ((n=2; n<=number; n++)); do
	fact=$[fact * n]
done
printf "The factorial of %d is %d\n" $number $fact
exit 0
