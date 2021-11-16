#!/usr/bin/env -S awk --lint -f
BEGIN {
	unixTotal=unixCount=0
	dsaTotal=dsaCount=0
	unixTop1=unixTop2=0
	dsaTop1=dsaTop2=0
}
$3 == "Unix" {
	unixCount++
	unixTotal+=$4
	updateUnixToppers($4)
}
$3 == "DSA" {
	dsaCount++
	dsaTotal+=$4
	updateDSAToppers($4)
}
END {
	printf "Unix average %.0f\n", unixTotal/unixCount
	printf "Toppers of unix %d and %d\n", unixTop1, unixTop2
	printf "DSA average %.0f\n", dsaTotal/dsaCount
	printf "Toppers of DSA %d and %d\n", dsaTop1, dsaTop2
}
function updateUnixToppers(marks) {
	if (marks > unixTop1) {
		unixTop2=unixTop1
		unixTop1=marks
	} else if (marks > unixTop2) {
		unixTop2=marks
	}
}
function updateDSAToppers(marks) {
	if (marks > dsaTop1) {
		dsaTop2=dsaTop1
		dsaTop1=marks
	} else if (marks > dsaTop2) {
		dsaTop2=marks
	}
}
