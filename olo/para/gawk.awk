BEGIN {
	cmd = "cat -n"

	print "a" |& cmd
	print "b" |& cmd
	print "c" |& cmd
	print "q" |& cmd

	while (cmd |& getline $0) {
		print $0
		if (/q/) break
	}
}
