{
    for (i = 1; i <= NF; i++)
	e[i] = $i

    for (i = 1; i <= NF; i++) {
	for (j = 1; j <= NF; j++) {
		printf "%c ", e[i]==j ? "O" : "x"
	    }
	print ""
    }
    print ""
}
