#!/bin/env bash
declare -ia arr
arr[1]=20
arr[2]=30
arr[5]=40
echo "${arr[*]}"
echo "${arr[2]}"
echo "size is" "${#arr[*]}"
