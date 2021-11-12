#!/bin/env bash
#Accept a login name and check its login status

read -p "Enter username: " user
w | grep -q "$user" && {
	echo "$user has logged in"
	exit 0
}
echo "$user has not logged in"
exit 1

