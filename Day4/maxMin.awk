#!/usr/bin/env -S awk --lint -f
BEGIN {
	max=-1
	min=2^20
}
{
	len=length($0 "")
	printf("%s[%d]\n", $0, len);
	if (max < len) max=len
	if (min > len) min=len
}
END {
	printf("Max length=%d   Min length=%d\n", max,min)
}
