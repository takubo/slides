#!/usr/local/bin/gawk -f

BEGIN {
	$0 = "大都会"
	print 1, $"0"
	print 2, $""
	print 3, $"foo"
	print 4, $(l ^ o ^ l)

	$1 = "岡山"
	print 5, $"1G"
	print 6, $ - - - - + + 1
}
