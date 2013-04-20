#!/usr/local/bin/gawk -f

BEGIN {
	arr[2, 3] = "A";
	arr[2][3] = "B";
	print arr[2, 3]
	print arr[2][3]

	arr[2]["x"] = "c";
	print arr[2]["x"]
}
