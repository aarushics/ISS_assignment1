

while IFS= read -r line; do
	input=$line
	echo "$input" | sed "s/./#/5g" >> q1_output.txt
done < $1

