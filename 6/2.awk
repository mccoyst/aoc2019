BEGIN {
	FS = ")"
}
{
	dorbits[$2] = $1
}
END {
	youdex = 0
	sandex = 0
	for(p in dorbits){
		i = p
		while(i = dorbits[i]){
			if(p == "YOU"){
				youroute[youdex] = i
				youdex++
			}else if(p == "SAN"){
				sanroute[sandex] = i
				sandex++
			}
		}
	}

	for(x = 0; x < youdex; x++){
		youpart++
		sanpart = 0
		for(y = 0; y < sandex; y++){
			if(sanroute[y] == youroute[x]){
				print youpart + sanpart - 1
				exit
			}
			sanpart++
		}
	}
}
