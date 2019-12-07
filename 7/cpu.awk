BEGIN {
	FS = ","
}
{
	for(i = 1; i <= NF; i++){
		m[i-1] = $i
	}
	exit
}
function op(n, modes){
	delete modes
	delete digits
	split("000" n, digits, "")
	code = 10*int(digits[length(digits)-1]) + digits[length(digits)]
	p = 1
	for(j = length(digits)-2; j > 0; j--){
		modes[p] = digits[j]
		p++
	}
	return code
}
function fetchop(pos){
	if(modes[pos]){
		return m[i+pos]
	}
	return m[m[i+pos]]
}
END {
	for(i = 0; i < length(m);){
		c = op(m[i+0], modes)
		if(c == 99){
			break
		}else if(c == 1){
			a = fetchop(1)
			b = fetchop(2)
			m[m[i+3]] = a + b
			i += 4
		}else if(c == 2){
			a = fetchop(1)
			b = fetchop(2)
			m[m[i+3]] = a * b
			i += 4
		}else if(c == 3){
			getline v
			m[m[i+1]] = int(v)
			i += 2
		}else if(c == 4){
			print fetchop(1)
			i += 2
		}else if(c == 5){
			bo = fetchop(1)
			if(bo){
				i = fetchop(2)
			}else{
				i += 3
			}
		}else if(c == 6){
			bo = fetchop(1)
			if(!bo){
				i = fetchop(2)
			}else{
				i += 3
			}
		}else if(c == 7){
			a = fetchop(1)
			b = fetchop(2)
			m[m[i+3]] = a < b
			i += 4
		}else if(c == 8){
			a = fetchop(1)
			b = fetchop(2)
			m[m[i+3]] = a == b
			i += 4
		}else{
			print "1202 program alarm"
			break
		}
	}
}
