#!/bin/bash
clear
prev=$pwd

if test "$1" != ""; then
    path="$1"
    cd $path
else
    path=$pwd
fi

MYTAB=''
touch dir.txt file.txt dir_ans.txt file_ans.txt

for FILE in *; do
    if [[ -d $FILE ]]; then
        directory_val=$(find $FILE -type f | wc -l)
        directory_name=$FILE
        echo $directory_name${MYTAB}"," $directory_val "file(s)" >>dir.txt
    elif [[ -f $FILE ]]; then
        filesize=$(find "$FILE" -printf "%s")
        filename=$FILE
        echo $filesize $filename >>file.txt
    fi
done

sort -rk 2 dir.txt >>dir_ans.txt
sort -rn file.txt | awk '{print $2}' >>file_ans.txt
echo "Directories:"
cat dir_ans.txt
echo
echo "Files:"
cat file_ans.txt
rm dir_ans.txt file_ans.txt dir.txt file.txt
cd $prev
