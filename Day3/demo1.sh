#!/bin/env bash
A="abc" #variable initialized
INTVAR=50
functionOnVariable() {
	local a="pqr"
	declare -i intVar=20
}
echo $a
functionOnVariable
echo $intVar
