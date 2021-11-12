#!/bin/env bash
#Display name of directories and their count
function directoryList() {
	find . -maxdepth 1 -type d | sed 1d 
}
echo "Directory names:"
directoryList
printf "Count of dirs is " 
directoryList | wc -l
