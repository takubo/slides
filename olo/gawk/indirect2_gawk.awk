#!/usr/local/bin/gawk -f
BEGIN {
	for (i = 1; i <= 9; i++)
		array[i] = i

	filter("is_odd", array)

	for (i in array)
		print array[i]
}

function is_even(n)
{
	return !(n % 2)
}

function is_odd(n)
{
	return n % 2
}

function filter(fun, a,    i)
{
	for (i in a)
		if (!@fun(a[i]))
			delete a[i]
}
