#!/bin/env bash
#Find duplicate files
dir="${1:-.}"
while read fileInfo; do
	shasum=$(echo "$fileInfo" | cut -d ' ' -f 1)
    fileName=$(echo "$fileInfo" | cut -d ' ' -f 3) 
	if [[ $shasum == $lastShaSum ]]; then 
		printf "%s = %s\n" "$fileName" "$lastFile"
	else
		lastFile="$fileName"
		lastShaSum=$shasum
	fi
done < <(find "$dir" -type f -exec sha256sum '{}' \; | sort)
#0.5 seconds
