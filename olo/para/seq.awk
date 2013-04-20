BEGIN {
	cmd = "seq 1 3 10"

	while (cmd | getline $0 > 0) {
		print $0
	}
}

