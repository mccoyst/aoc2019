BEGIN {
	zking = 9999999
	onetwo = 0
}
{
	delete hist
	split($0, chars, "")
	for(i = 1; i <= length(chars); i++){
		hist[chars[i]]++
	}
	if(hist[0] < zking){
		zking = hist[0]
		onetwo = hist[1] * hist[2]
	}
}
END {
	print onetwo
}
