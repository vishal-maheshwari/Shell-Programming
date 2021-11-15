#!/bin/env bash
#Find duplicate files optimized
dir="${1:-.}"
while read fileInfo; do
	shasum="${fileInfo%% *}"
    fileName="${fileInfo##* }"
	if [[ $shasum == $lastShaSum ]]; then 
		printf "%s = %s\n" "$fileName" "$lastFile"
	else
		lastFile="$fileName"
		lastShaSum=$shasum
	fi
done < <(find "$dir" -type f -print0 | xargs -0 sha256sum | sort)
#0.05 seconds
