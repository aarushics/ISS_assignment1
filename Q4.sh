
for words in $(<$2); do
    sed -i "s/\<$words\>\s*//g" $1 > output1.txt
done
words=$3
echo $(<$1)
while IFS= read -r lines; do
    word_count="$(echo $lines | grep -ow $words | wc -l)"
    line_count="$(echo $lines | sed 's/[^a-zA-Z0-9]/ /g' | wc -w)" 
    echo -n $lines >> q4_output.txt
    echo -n " " >> q4_output.txt
    echo " $word_count $line_count" | awk '{printf "%.5f\n", $1 / $2}' >> q4_output.txt
done < $1
