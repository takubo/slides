BEGIN {
	cmd = "cat -n"

	print "a" | cmd
	print "b" | cmd
	print "c" | cmd
	print "d" | cmd
}
