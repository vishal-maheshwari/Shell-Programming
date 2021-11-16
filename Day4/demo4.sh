#!/bin/env bash
declare -a arr=(abc pqr xyz)
declare -i i j flag
declare -i len=${#arr[*]}
while ((flag == 0)); do
	flag=1
	for ((i=0; i<len-1; i++)); do
		j=$((i+1))	
		[[ "${arr[$i]}" < "${arr[$j]}" ]] && {
			t="${arr[$i]}"
			arr[$i]="${arr[$j]}"
			arr[$j]=$t
			flag=0
		}
	done
done
echo "${arr[*]}"
