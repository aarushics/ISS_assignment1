current_year=$(date +'%Y')
current_month=$(date +'%m')
current_date=$(date +'%d')

while IFS= read -r line; do
	d=$(echo $line | awk '{print $NF}' | tr -d '/')
	date_input=${d:0:2}
	month_input=${d:2:2}
	year_input=${d: -4}
	name=$(echo $line | awk 'NF{NF--};1' )
	age=$((current_year - year_input))

	if [[ $month_input > $current_month ]]; then
		age=$((age - 1))
	else
		if [[ $month_input == $current_month ]]; then
			if [[ $date > $current_date ]]; then
				age=$((age - 1))
			fi
		fi
	fi
	
	echo $name $age >> q2_output.txt

done < $1

