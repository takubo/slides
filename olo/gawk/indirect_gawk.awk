#!/usr/local/bin/gawk -f
BEGIN {
	fun = "greeting"
	@fun("okayama")
}

function greeting(name)
{
	print "hello", name
}
