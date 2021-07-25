clear
read -p " Input :"  inpString
echo "$inpString" | sed "s/./#/5g" >> q1_output.txt
echo 

