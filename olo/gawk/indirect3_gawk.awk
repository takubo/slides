#!/usr/local/bin/gawk -f

BEGIN {
	a1[1]          = 1;
	a1[2][3]       = 2;
	a1[4][5][6]    = 5;

	array_copy(a2, a1);
	array_dump(a2)
}

function array_copy(dst, src,    i) {
	for (i in src)
		if (isarray(src[i]))
			array_copy(dst, src[i])
		else
			dst[i] = src[i]
}

function array_dump(a)
{
	for (i in a)
		if (isarray(a[i]))
			array_copy(a[i])
		else
			print a[i]
}
