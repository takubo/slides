#!/usr/local/bin/gawk -f
BEGIN {
    net = "/inet/tcp/0/localhost/3333"
}

{
    print $0 |& net
}

END {
    close(net)
}
