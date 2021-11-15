#!/bin/env bash
fun1() {
	declare -i line=1
	for i in "$@"; do
		printf "%d variable is %s\n" $line "$i"
		((line++))
	done
	return 1
}
fun1 a b c d e f && echo function ended successfully
