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
	ox = 27
	oy = 37
	for(coord in rocks){
		split(coord, c, ",")
		mx = c[1]
		my = c[2]
		if(mx == ox && my == oy){
			continue
		}
		yy = mx - ox
		xx = -(my - oy)
		if(xx == 0 && yy > 0){
			t = 1.5707963268
			r = yy
		}else if(xx == 0 && yy < 0){
			t = -1.5707963268
			r = -yy
		}else{
			if(yy >= 0 && xx < 0){
				math = "echo 'a("yy"/"xx")+3.1415926536;sqrt(("xx")^2 + ("yy")^2)' | 9 bc -l"
			}else if(yy < 0 && xx < 0){
				math = "echo 'a("yy"/"xx")-3.1415926536;sqrt(("xx")^2 + ("yy")^2)' | 9 bc -l"
			}else{
				math = "echo 'a("yy"/"xx");sqrt(("xx")^2 + ("yy")^2)' | 9 bc -l"
			}
			math | getline v
			t = v
			math | getline v
			r = v
			close(math)
		}
		if(t < 0){
			t += 6.2831853072
		}
		print r " " t " " (mx-1)","(my-1)
	}
}
