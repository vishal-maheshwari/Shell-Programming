#!/bin/env bash
declare -i len
declare -i max=-1
declare -i min=$((10**10));
while read line; do
	len="${#line}"
	printf "%s[%d]\n" "$line" $len
	((max < len)) && max=$len
	((min > len)) && min=$len
done < names
printf "The maximum length=%d and minimum length=%d\n" $max $min
