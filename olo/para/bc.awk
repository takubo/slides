
BEGIN {
	cmd = "echo 5 ^ 500 | bc "
	while (cmd | getline $0 > 0) {
		sub(/\\$/, "")
		x = x $0
	}
	print x
}
