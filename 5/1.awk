BEGIN {
	FS = ","
}
{
	for(i = 1; i <= NF; i++){
		m[i-1] = $i
		s[i-1] = m[i-1]
	}
}
END {
	for(i = 0; i < length(s); i++){
		m[i] = s[i]
	}
	for(i = 0; i < length(m);){
		if(m[i+0] == 99){
			x = 0
			break
		}else if(m[i+0] == 1){
			a = m[m[i+1]]
			b = m[m[i+2]]
			m[m[i+3]] = a + b
			i += 4
		}else if(m[i+0] == 2){
			a = m[m[i+1]]
			b = m[m[i+2]]
			m[m[i+3]] = a * b
			i += 4
		}else if(m[i+0] == 3){
			getline v <"stdin.txt"
			m[m[i+1]] = int(v)
			i += 2
		}else if(m[i+0] == 4){
			print m[m[i+1]]
			i += 2
		}else{
			print "1202 program alarm"
			break
		}
	}
}
