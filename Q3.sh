if [[ "$1" != "" ]]
  then
    input="$1"    
else
    input='paragraph.txt' #paraagraph.txt is a textfile on local machine
fi

echo "1. Words - start with ‘s’ and is not follow by ‘a’"
grep -w -o 's[[:alnum:]]*' $input | grep -wv 'sa.*'

echo "2. Word starts with ‘w’ and is followed by ‘h’"
grep -w -o 'wh[[:alnum:]]*' $input

echo "3. Word starts with ‘t’ and is followed by ‘h’"
grep -w -o 'th[[:alnum:]]*' $input

echo "4. Word starts with ‘a’ and is not followed by ‘n’"
grep -w -o 'a[[:alnum:]]*' $input | grep -wv 'an.*'
