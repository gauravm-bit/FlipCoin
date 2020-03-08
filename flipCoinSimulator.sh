#!/bin/bash  -x

declare -A dict
declare -A doubleDict
declare -A tripleDict

echo "Welcome to flipCoin simulator "
read -p "Enter the number of times coin to be flipped " num


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

echo  "Singlet outcome is tail percent is $Tpercentage" "head percent is $Hpercentage" 

#doublet
for (( i = 0; i < num; i++ ))
do
   randomCheck1=$((RANDOM%2))
   randomCheck2=$((RANDOM%2))
   if (( $randomCheck1 == 0 && $randomCheck2 == 0 ))
   then
      doubleDict[HH]=$((${doubleDict[HH]}+1))
   elif (( $randomCheck1 == 0 && $randomCheck2 == 1 ))
   then
		doubleDict[HT]=$((${doubleDict[HT]}+1))
	elif (( $randomCheck1 == 1 && $randomCheck2 == 0 ))
	then
		doubleDict[TH]=$((${doubleDict[TH]}+1))
	else
		doubleDict[TT]=$((${doubleDict[TT]}+1))
	fi
done

echo "doublet answer is"


HHpercent=`echo "scale = 3 ; (${doubleDict[HH]}*100)/$num" | bc -l`
THpercent=`echo "scale = 3 ; (${doubleDict[TH]}*100)/$num" | bc -l`
HTpercent=`echo "scale = 3 ; (${doubleDict[HT]}*100)/$num" | bc -l`
TTpercent=`echo "scale = 3 ; (${doubleDict[TT]}*100)/$num" | bc -l`

echo "HH came "${doubleDict[HH]}
echo "percentage of HH is " $HHpercent"%"
echo "TH came "${doubleDict[TH]}
echo "percentage of TH is " $THpercent"%"
echo "HT came "${doubleDict[HT]}
echo "percentage of HT is " $HTpercent"%"
echo "TT came "${doubleDict[TT]}
echo "percentage of TT is " $TTpercent"%"

#triplet

for (( i = 0; i < num; i++ ))
do
   randomCheck1=$((RANDOM%2))
   randomCheck2=$((RANDOM%2))
	randomCheck3=$((RANDOM%2))
   if (( $randomCheck1 == 0 && $randomCheck2 == 0 && $randomCheck3 == 0 ))
   then
       tripleDict[HHH]=$((${tripleDict[HHH]}+1))
   elif (( $randomCheck1 == 0 && $randomCheck2 == 0 && $randomCheck3 == 1 ))
   then
      tripleDict[HHT]=$((${tripleDict[HHT]}+1))
   elif (( $randomCheck1 == 0 && $randomCheck2 == 1 && $randomCheck3 == 0 ))
   then
      tripleDict[HTH]=$((${tripleDict[HTH]}+1))
   elif (( $randomCheck1 == 1 && $randomCheck2 == 0 && $randomCheck3 == 0 ))
	then
      tripleDict[THH]=$((${tripleDict[THH]}+1))
	elif (( $randomCheck1 == 1 && $randomCheck2 == 1 && $randomCheck3 == 1 ))
   then
      tripleDict[TTT]=$((${tripleDict[TTT]}+1))
   elif (( $randomCheck1 == 1 && $randomCheck2 == 1 && $randomCheck3 == 0 ))
   then
      tripleDict[TTH]=$((${tripleDict[TTH]}+1))
   elif (( $randomCheck1 == 1 && $randomCheck2 == 0 && $randomCheck3 == 1 ))
   then
      tripleDict[THT]=$((${tripleDict[THT]}+1))
   else
      tripleDict[HTT]=$((${tripleDict[HTT]}+1))
   fi
done

HHHpercent=`echo "scale = 3 ; (${tripleDict[HHH]}*100)/$num" | bc -l`
HHTpercent=`echo "scale = 3 ; (${tripleDict[HHT]}*100)/$num" | bc -l`
HTHpercent=`echo "scale = 3 ; (${tripleDict[HTH]}*100)/$num" | bc -l`
THHpercent=`echo "scale = 3 ; (${tripleDict[THH]}*100)/$num" | bc -l`
TTTpercent=`echo "scale = 3 ; (${tripleDict[TTT]}*100)/$num" | bc -l`
TTHpercent=`echo "scale = 3 ; (${tripleDict[TTH]}*100)/$num" | bc -l`
THTpercent=`echo "scale = 3 ; (${tripleDict[HHH]}*100)/$num" | bc -l`
HTTpercent=`echo "scale = 3 ; (${tripleDict[HHH]}*100)/$num" | bc -l`


echo "HHH came "${tripleDict[HHH]}" times"
echo "percentage of HHH is " $HHHpercent"%"

echo "HHT came "${tripleDict[HHT]}" times"
echo "percentage of HHT is " $HHTpercent"%"

echo "HTH came "${tripleDict[HTH]}" times"
echo "percentage of HTH is " $HTHpercent"%"

echo "THH came "${tripleDict[THH]}" times"
echo "percentage of THH is " $THHpercent"%"

echo "TTT came "${tripleDict[TTT]}" times"
echo "percentage of TTT is " $TTTpercent"%"

echo "TTH came "${tripleDict[TTH]}" times"
echo "percentage of TTH is " $TTHpercent"%"

echo "THT came "${tripleDict[THT]}" times"
echo "percentage of THT is " $THTpercent"%"

echo "HTT came "${tripleDict[HTT]}" times"
echo "percentage of HTT is " $HTTpercent"%"

