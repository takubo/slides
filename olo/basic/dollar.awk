#!/usr/local/bin/gawk -f

BEGIN {
	$0 = "大都会"
	print $0

	$1 = "岡山"
	print $"1"
}
