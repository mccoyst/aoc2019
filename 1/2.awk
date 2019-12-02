{
	d = int($1 / 3) - 2;
	t += d;
	f = int(d / 3) - 2;
	while(f > 0){
		t += f;
		f = int(f / 3) - 2;
	}
}
END {
	print t;
}
