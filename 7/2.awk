function swap(a, x, y){
	tmp = a[x]
	a[x] = a[y]
	a[y] = tmp
}
function perm(a){
	k = length(a) - 2
	for(; k >= 0; k--){
		if(a[k] < a[k+1]){
			break
		}
	}

	if(k < 0 || a[k] >= a[k+1]){
		return 0
	}

	i = length(a) - 1
	for(; i > k; i--){
		if(a[k] < a[i]){
			break
		}
	}

	if(i == k){
		return 0
	}

	swap(a, k, i)
	for(j = 1; j < length(a) - k - 1; j++){
		swap(a, k+j, length(a)-j)
	}
	return 1
}
END{
	bestest = 0
	for(p = 0; p < 5; p++){
		phases[p] = p+5
	}
	while(perm(phases)){
		zero = "{ 9 awk -f cpu.awk < e; }"
		one = "{ { cat input.txt; echo "phases[1]"; "zero"; } | 9 awk -f cpu.awk; }"
		two = "{ { cat input.txt; echo "phases[2]"; "one"; } | 9 awk -f cpu.awk; }"
		three = "{ { cat input.txt; echo "phases[3]"; "two"; } | 9 awk -f cpu.awk; }"
		four = "{ { cat input.txt; echo "phases[4]"; "three"; } | 9 awk -f cpu.awk; }"
		cmd = "mkfifo e; { cat input.txt; echo "phases[0]"; echo 0; "four"; } | tee e.txt > e; rm e"
		if(system(cmd)){
			break
		}

		eee = "tail -n 1 e.txt"
		eee | getline v
		close(eee)
		v = int(v)
		if(v > bestest){
			bestest = v
		}
	}
	print bestest
}
