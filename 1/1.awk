{
	d = int($1 / 3) - 2;
	t += d;
}
END {
	print t;
}
