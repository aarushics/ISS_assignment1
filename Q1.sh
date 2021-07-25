clear
read -p " Input :"  inpString
echo "$inpString" | sed "s/./#/5g"


