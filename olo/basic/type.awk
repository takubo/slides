#!/usr/local/bin/gawk -f
BEGIN {
	distance = "30km"
	hour     = "4時間"
	velocity = distance / hour
	print "時速 =", velocity, "[km/h]"
}
