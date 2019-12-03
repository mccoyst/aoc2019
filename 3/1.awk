BEGIN {
	FS = ","
}
{
	for(i = 1; i <= NF; i++){
		wire[NR,i-1] = $i
		inscount[NR]++
	}
}
function abs(n){if(n < 0) return -n; else return n;}
END {
	md = 99999999

	x = 0
	y = 0
	for(i = 0; i < inscount[1]; i++){
		l = substr(wire[1,i], 2) + 0
printf("%s @ (%d, %d)\n", wire[1,i], x, y)
		if(wire[1,i] ~ /^U/){
			for(j = 0; j < l; j++){
				y++
				grid[x, y] = 1
			}
		}else if(wire[1,i] ~ /^D/){
			for(j = 0; j < l; j++){
				y--
				grid[x, y] = 1
			}
		}else if(wire[1,i] ~ /^L/){
			for(j = 0; j < l; j++){
				x--
				grid[x, y] = 1
			}
		}else if(wire[1,i] ~ /^R/){
			for(j = 0; j < l; j++){
				x++
				grid[x, y] = 1
			}
		}
	}

	x = 0
	y = 0
	for(i = 0; i < inscount[2]; i++){
		l = substr(wire[2,i], 2) + 0
printf("%s @ (%d, %d)\n", wire[2,i], x, y)
		if(wire[2,i] ~ /^U/){
			for(j = 0; j < l; j++){
				y++
				if(grid[x, y]){
printf("touch @ u(%d, %d)\n", x, y)
					mm = abs(x) + abs(y)
					if(mm < md){
						md = mm
					}
				}
			}
		}else if(wire[2,i] ~ /^D/){
			for(j = 0; j < l; j++){
				y--
				if(grid[x, y]){
printf("touch @ d(%d, %d)\n", x, y)
					mm = abs(x) + abs(y)
					if(mm < md){
						md = mm
					}
				}
			}
		}else if(wire[2,i] ~ /^L/){
			for(j = 0; j < l; j++){
				x--
				if(grid[x, y]){
printf("touch @ l(%d, %d)\n", x, y)
					mm = abs(x) + abs(y)
					if(mm < md){
						md = mm
					}
				}
			}
		}else if(wire[2,i] ~ /^R/){
			for(j = 0; j < l; j++){
				x++
				if(grid[x, y]){
printf("touch @ r(%d, %d)\n", x, y)
					mm = abs(x) + abs(y)
					if(mm < md){
						md = mm
					}
				}
			}
		}
	}

	print md
}
