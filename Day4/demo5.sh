#!/bin/env bash
seq 100 > /tmp/big.txt
cleanUp() {
	echo "cleaning..."
	rm /tmp/big.txt
	exit 1
}
trap cleanUp SIGINT SIGTERM
while :; do
	sleep 1
	date
	echo "My pid is " "$$"
done
