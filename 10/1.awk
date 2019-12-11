BEGIN {
	SUBSEP = ","
}
{
	split($0, chars, "")
	for(i = 1; i <= length(chars); i++){
		if(chars[i] == "#"){
			rocks[i, NR] = 0
		}
	}
}
END {
	for(coord in rocks){
		split(coord, c, ",")
		mx = c[1]
		my = c[2]
		delete front
		delete back
		for(targ in rocks){
			if(targ == coord){
				continue
			}
			split(targ, t, ",")
			tx = t[1]
			ty = t[2]
			if((tx - mx) == 0){
				if(ty < my){
					front["vert"] = 1
				}else{
					back["vert"] = 1
				}
			}else{
				if(tx < mx){
					slope = "" ((ty - my) / (mx - tx))
					front[slope] = 1
				}else{
					slope = "" ((ty - my) / (tx - mx))
					back[slope] = 1
				}
			}
		}
		sight[coord] = length(front) + length(back)
	}

	for(coord in sight){
		if(sight[coord] > best_score){
			best_score = sight[coord]
			best_rock = coord
		}
	}
	split(best_rock, rawk, ",")
	print (rawk[1] - 1) "," (rawk[2]-1) " " best_score
}
