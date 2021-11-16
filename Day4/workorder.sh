#!/bin/env bash
#Print contents of <workorder> tag, if it contains keyword customer

printf -v NEW_LINE "\n"
declare -i CustFound InWorkOrder
Lines=""
ProcessLine() {
	((InWorkOrder == 0)) && return
	Lines="${Lines}${Line}${NEW_LINE}"
	[[ "$Line" =~ "customer" ]] && CustFound=1
}
EndTagFound() {
	((CustFound == 1 )) && printf "%s" "$Lines"
	CustFound=0
	InWorkOrder=0
	Lines=""
}
while read Line; do
	[[ "$Line" =~ "<workorder>" ]] && InWorkOrder=1
	ProcessLine
	[[ "$Line" =~ "</workorder>" ]] && EndTagFound
done < "logFile.xml"


