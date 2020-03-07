#!/bin/bash -x

echo "Welcome to flipCoin simulator "
checkRandom=$((RANDOM%2))
if [ $checkRandom -eq 0 ]
then
	echo "heads"
else
	echo "tails"
fi 
