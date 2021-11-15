#!/bin/env bash
while read a; do
	echo $a
done < <(seq 5)
