# stopword=$2
for words in $(<$2); do
    sed -ien "s/\<$words\>\s*//g" $1
done

words=$3

while IFS= read -r lines; do
    para1="$(echo $lines | grep -ow $word | wc -l)"
    para2="$(echo $lines | sed 's/[^a-zA-Z0-9]/ /g' | wc -w)" 
    echo -n $line >> q4_output.txt
    echo -n " " >> q4_output.txt
    echo "$para1 $para2" | awk '{printf "%.5f\n", $1 / $2}' >> q4_output.txt
done < $1
