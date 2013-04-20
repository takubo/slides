BEGIN {
	year = 2012
	$0 = "hello, Okayama"
	print
	for (i = 0; i < 5; i++ ) {
		print i
	}
	print "23rd Open Labo Okayama in", year
}
