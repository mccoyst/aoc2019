BEGIN {
	Min = 271973
	Max = 785961
}
{
}
function yup(digits, n){
	pair = 0
	v = digits[1]
	for(i = 2; i <= nn; i++){
		if(digits[i] < v){
			return 0
		}
		if(digits[i] == v){
			pair = 1
		}
		v = digits[i]
	}
	return pair
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
