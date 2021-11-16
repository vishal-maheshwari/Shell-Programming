#!/usr/bin/env -S awk --lint -f
BEGIN {
	FS=":"
}
{
	printUser($1, $2, $3, $4)
}
END {
	printf("Total users printed are %d\n", NR)
}
function printUser(userName, firstName, lastName, telNo) {
	printf("dn: uid=%s, dc=example, dc=com\n",userName)
	printf("cn: %s %s\n",firstName, lastName)
	printf("sn: %s\n", lastName)
	printf("telephoneNumber: %s\n", telNo)

}
