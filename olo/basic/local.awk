#!/usr/local/bin/gawk -f
BEGIN {
	print double(3)
	print repeat("AWK!", 3)
}

function double(n)
{
	return n * 2
}

function repeat(str, num,    i, tmp)
{
	for (i = 0; i < num; i++) {
		tmp = tmp str
	}
	return tmp
}
