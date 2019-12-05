BEGIN {
	FS = ","
}
{
	for(i = 1; i <= NF; i++){
		m[i-1] = $i
	}
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
END {
	for(i = 0; i < length(m);){
		c = op(m[i+0], modes)
		if(c == 99){
			break
		}else if(c == 1){
			if(modes[1]){
				a = m[i+1]
			}else{
				a = m[m[i+1]]
			}
			if(modes[2]){
				b = m[i+2]
			}else{
				b = m[m[i+2]]
			}
			m[m[i+3]] = a + b
			i += 4
		}else if(c == 2){
			if(modes[1]){
				a = m[i+1]
			}else{
				a = m[m[i+1]]
			}
			if(modes[2]){
				b = m[i+2]
			}else{
				b = m[m[i+2]]
			}
			m[m[i+3]] = a * b
			i += 4
		}else if(c == 3){
			getline v <"stdin.txt"
			m[m[i+1]] = int(v)
			i += 2
		}else if(c == 4){
			if(modes[1]){
				print "outi: " m[i+1]
			}else{
				print "outa: " m[m[i+1]]
			}
			i += 2
		}else{
			print "1202 program alarm"
			break
		}
	}
}
