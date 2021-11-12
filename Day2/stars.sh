#!/bin/env bash
#Print stars
#*
#**
#***
#****
declare -i i j
for ((i=0; i<4; i++)); do
	for ((j=0; j<=i; j++)); do
		printf "*"
	done
	echo
done
exit 0
