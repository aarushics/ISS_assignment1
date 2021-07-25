#!/bin/bash
clear


if test "$1" == ""; then
	path=$pwd
   else
    path="$1"
    cd $path
fi


touch dir_list.txt file_list.txt dir_sort.txt file_sort.txt

for FILE in *; do
    if [[ -d $FILE ]]; then
        directory_val=$(find $FILE -type f | wc -l)
        directory_name=$FILE
        #echo $directory_name"," $directory_val "file(s)" >> dir_list.txt 
        for a  in $(find $directory_name -type d); do
        echo $a "," $(find $a -type f | wc -l)" file(s)" >> dir_list.txt
        done
              
    elif [[ -f $FILE ]]; then
        size=$(find "$FILE" -printf "%s")
        name=$FILE
        echo $size $name >> file_list.txt
    fi
done

sort -rk 2 dir_list.txt >>dir_sort.txt
sort -rn file_list.txt | awk '{print $2}' >>file_sort.txt
echo "Directories:"
cat dir_sort.txt
echo
echo "Files:"
cat file_sort.txt
rm dir_sort.txt file_sort.txt dir_list.txt file_list.txt

