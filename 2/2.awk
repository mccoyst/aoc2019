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
	for(noun = 0; noun < 100; noun++){
	for(verb = 0; verb < 100; verb++){
	for(i = 0; i < length(s); i++){
		m[i] = s[i]
	}
	m[1] = noun
	m[2] = verb
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
		}else{
			print "1202 program alarm"
			break
		}
	}

	if(m[0] == 19690720){
		printf("%d\n", 100*noun+verb)
		exit
	}
	}
	}
}
