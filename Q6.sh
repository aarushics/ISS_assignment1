while getopts 'C:f:k:l:n:o:c:v:ad' tags; do
    case ${tags} in
    C) command=${OPTARG} ;;
    f) fn=$OPTARG ;;
    l) ln=$OPTARG ;;
    n) contact=$OPTARG ;;
    o) company=$OPTARG ;;
    k) key=$OPTARG ;;
    c) header=$OPTARG ;;
    v) value=$OPTARG ;;
    a) ord="asc" ;;
    d) ord="desc" ;;
    esac
done


if [[ $command == "insert" ]]; then
    #echo $fn","$ln","$contact","$company >>contacts.csv
    echo $fn","$ln","$contact","$company >>contacts.csv

elif [[ $command == "edit" ]]; then

    touch tmp.csv
    while read -r line; do

        tmpname=$(echo $line | awk -F, '{print $1}')
        if [[ $key == $tmpname ]]; then
            echo $fn","$ln","$contact","$company >>tmp.csv

        else
            echo $line >>tmp.csv
        fi
    done <contacts.csv

    cat tmp.csv >contacts.csv
    rm tmp.csv
elif [[ $command == "display" ]]; then
    echo "fname,lname,contact,Office"
    if [[ $ord == "asc" ]]; then
        sort -k1df contacts.csv
    else
        sort -k1rdf contacts.csv
    fi
elif [[ $command == "search" ]]; then
    if [[ $header == "fname" ]]; then
        column=0
    elif [[ $header == "lname" ]]; then
        column=1
    elif [[ $header == "contact" ]]; then
        column=2
    fi

    while read -r line; do
        readarray -d "," -t comp <<<"$line"
        if [[ $value == ${comp[column]} ]]; then
            echo $line
        fi
    done <contacts.csv
elif [[ $command == "delete" ]]; then
    if [[ $header == "fname" ]]; then
        column=1
    elif [[ $header == "lname" ]]; then
        column=2
    elif [[ $header == "contact" ]]; then
        column=3
    fi

    touch tmp.csv
    while read -r line; do
        comp=$(echo $line | awk -v num=$column -F, '{printf "%s\n", $num}')
        # echo $comp $value
        if [[ $value != $comp ]]; then
            echo $line >>tmp.csv
        fi
    done <contacts.csv
    cat tmp.csv >contacts.csv
    rm tmp.csv
fi


