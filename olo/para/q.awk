BEGIN {
	N = 4
}

{
	for (i = 1; i <= NF; i++)
		q[i] = $i
}

END {
	if (NF == N) {
		if (ok(q, N))
		    print
	} else {
#print "#", N, NR, NF
		for (i = 1; i <= N; i++) {
			cmd = "awk -f" rep(" ", i) "q.awk"
			print $0, i | cmd
		}
	}
}

function ok(queen, n,    i, j)
{
	for (i = 1; i <= n - 1; i++)
		for (j = i + 1; j <= n; j++)
			if (queen[i] == queen[j] || abs(queen[i] - queen[j]) == j - i)
				return 0
	return 1;
}

function abs(x)
{
	return (x < 0) ? -x : x
}

function rep(str, num,     res)
{
	while (num-- > 0) res = res str
	return res
}
