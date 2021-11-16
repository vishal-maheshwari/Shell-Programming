#!/usr/bin/env -S awk --lint -f
BEGIN {
	resetVariables()
}
/<workorder>/ {
	inWorkOrder=1
}
{
	if (inWorkOrder) {
		lines=sprintf("%s%s\n",lines,$0)
		if ($0 ~ /customer/ ) custFound=1
	}
}
/<\/workorder>/ {
	if (custFound) printf "%s", lines
	resetVariables()
}
function resetVariables() {
	custFound=inWorkOrder=0
	lines=""
}
