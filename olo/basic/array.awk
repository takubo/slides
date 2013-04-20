#!/usr/local/bin/gawk -f

BEGIN {
	arr[1] = 1;
	print arr["1"]

	arr[1, 2] = 2;
	print arr[1, 2], arr[1 SUBSEP 2], arr[1 "\034" 2]

	SUBSEP = ":"
	arr[2, 3]  = 3;
	print arr[2 ":" 3]
}
