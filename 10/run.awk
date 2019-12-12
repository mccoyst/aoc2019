END {
	system("9 awk -f 2.awk < input.txt | 9 sort -n -k 1 -k 2 | awk '{preds[$1]++; print $0, preds[$1]}' | 9 sort -n -k 5 -k 1 | 9 awk '{if(NR == 200) print $3}'")
}
