#!/usr/local/bin/gawk -f
BEGIN {
	val = 9
	switch (val) {
	case 0:
		print "zero"
		break;
	case 9:
		print "nine"
		break;
	case "f":
		print "ef"
		break;
	default:
		print "other"
		break;
	}
}
