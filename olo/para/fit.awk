BEGIN {
	fit_ini("a * x + k")
}

{
	fit_dat($1, $2)
}

END {
	fit_res("a * x + k", ans)
}

function fit_ini(expr,    vars, i, tmp)
{
	print "f(x) = " expr |& "gnuplot"

vars[0] = "a"
vars[1] = "k"

	tmp = "fit f(x) \"-\" using 1:2 via "
	for (i in vars)
		tmp = sprintf("%s%s, ", tmp, vars[i])
	sub(/, $/, "", tmp)
	print tmp |& "gnuplot"

}

function fit_dat(x, y)
{
	print x, y |& "gnuplot"
}

function fit_res(expr, anssers,    vars, i, tmp)
{
	print "e" |& "gnuplot"
	print "print \"\"" |& "gnuplot"
	print "print \"a = \", a" |& "gnuplot"
	print "print \"k    = \", k" |& "gnuplot"

	print "quit" |& "gnuplot"

	while ("gnuplot" |& getline tmp)
		print tmp
}

function fit(data, expr, anssers,    vars, i, tmp)
{
	#print "f(x) = a * x + k"
	print "f(x) = " expr |& "gnuplot"

vars[0] = "a"
vars[1] = "k"

	#print "fit f(x) \"-\" using 1:2 via a, k"
	tmp = "fit f(x) \"-\" using 1:2 via "
	for (i in vars)
		tmp = sprintf("%s%s, ", tmp, vars[i])
	sub(/, $/, "", tmp)
	print tmp |& "gnuplot"

	#最初のデータ番号までiを進める
	for (i = 0; ; i++)
		if ((i SUBSEP "x") in data)
			break

	for ( ; ; i++) {
		if (!((i SUBSEP "x") in data))
			break
		print data[i, "x"], data[i, "y"] |& "gnuplot"
	}

	print "e" |& "gnuplot"
	print "print \"\"" |& "gnuplot"
	print "print \"a = \", a" |& "gnuplot"
	print "print \"k    = \", k" |& "gnuplot"

	print "quit" |& "gnuplot"

	while ("gnuplot" |& getline tmp)
		print tmp
}

function fit_posix(data, expr, anssers,    vars, i, tmp, cmnds, NL)
{
	NL = "\\n"

	#print "f(x) = a * x + k"
	cmnds = cmnds NL "f(x) = " expr
	#cmnds = "f(x) = " expr

vars[0] = "a"
vars[1] = "k"

	#print "fit f(x) \"-\" using 1:2 via a, k"
	tmp = "fit f(x) \"-\" using 1:2 via "
	for (i in vars)
		tmp = sprintf("%s%s, ", tmp, vars[i])
	sub(/, $/, "", tmp)
	cmnds = cmnds NL tmp

	#最初のデータ番号までiを進める
	for (i = 0; ; i++)
		if ((i SUBSEP "x") in data)
			break

	for ( ; ; i++) {
		if (!((i SUBSEP "x") in data))
			break
		cmnds = cmnds NL data[i, "x"] " " data[i, "y"]
	}

	cmnds = cmnds \
	NL "e" \
	NL "print \"\"" \
	NL "print \"a = \", a" \
	NL "print \"k    = \", k" \
	NL "quit"

	#system("echo -e '" cmnds "'")# | gnuplot" | getline tmp
	"echo -e '" cmnds "' | gnuplot" | getline tmp
	#print tmp
}

