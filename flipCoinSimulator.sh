#!/bin/bash 

declare -A dict

echo "Welcome to flipCoin simulator "

num=15
for(( i = 0; i < num; i++ ))
do
	checkRandom=$((RANDOM%2))
	if [ $checkRandom -eq 0 ]
	then
		dict[heads]=$((${dict[heads]}+1))
		Hpercentage=$((${dict[heads]}*100/num))
	else
		dict[tails]=$((${dict[tails]}+1))
		Tpercentage=$((${dict[tails]}*100/num))
	fi
done

echo  "tail percent is $Tpercentage" "head percent is $Hpercentage" 


