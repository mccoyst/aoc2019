BEGIN {
	Min = 271973
	Max = 785961
}
{
}
function yup(digits, n){
	delete paired
	v = digits[1]
	for(i = 2; i <= nn; i++){
		if(digits[i] < v){
			return 0
		}
		if(digits[i] == v){
			paired[v]++
		}
		v = digits[i]
	}
	for(p in paired){
		if(paired[p] == 1){
			return 1
		}
	}
	return 0
}
END {
	for(n = Min; n < Max; n++){
		nn = split(n+"", digits, "")
		if(yup(digits, nn)){
			cuties++
		}
	}
	print cuties
}
