#!/bin/env bash
declare -i a=20
declare -i b=9
declare -i c=$((a / b))
echo $c
echo "$a / $b" | bc -l
bc -l <<< "$a / $b"
