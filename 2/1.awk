BEGIN {
	FS = ","
}
{
	for(i = 1; i <= NF; i++){
		m[i-1] = $i
	}
}
END {
	for(i = 0; i < length(m); i += 4){
		if(m[i+0] == 99){
			x = 0
			break
		}else if(m[i+0] == 1){
			a = m[m[i+1]]
			b = m[m[i+2]]
			m[m[i+3]] = a + b
		}else if(m[i+0] == 2){
			a = m[m[i+1]]
			b = m[m[i+2]]
			m[m[i+3]] = a * b
		}else{
			print "1202 program alarm"
			break
		}
	}

	for(j = 0; j < length(m); j++){
		printf("%3d: %d\n", j, m[j])
	}
}
