{
	layers[NR] = $0
}
END {
	split(layers[NR], bottom, "")
	for(i = NR-1; i > 0; i--){
		split(layers[i], chars, "")
		for(j = 1; j <= length(chars); j++){
			if(chars[j] < 2){
				bottom[j] = chars[j]
			}
		}
	}
	for(j = 1; j <= length(bottom); j++){
		printf("%d", bottom[j])
	}
	print ""
}
