BEGIN {
	FS = ")"
}
{
	dorbits[$2] = $1
}
END {
	for(p in dorbits){
		i = p
		while(i = dorbits[i]){
			ooo++
		}
	}
	print ooo
}
