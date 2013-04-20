#!/usr/local/bin/gawk -f
BEGIN {
    net = "/inet/tcp/3333/0/0"

    while (net |& getline $0 > 0) {
	print $0
	if ($0 == "quit") break
    }
    close(net)
}
