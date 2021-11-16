#!/usr/bin/env -S awk --lint -f
BEGIN {
	FS=":"
	sum=0
}
{
	sum+=$3
}
END {
	printf "Sum of all marks is %d\n",sum
}
