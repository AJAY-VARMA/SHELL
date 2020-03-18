#! /bin/bash
echo "enter the number to flip"
read number
v=0
head=0
tail=0
for(( i=1;i<=number;i++ ))
do
v=$(($RANDOM%10))
if(( v>=5 ))
then
((head++))
else
((tail++))
fi
done 
echo "scale=2;100*$head/$number" | bc
echo "scale=2;100*$tail/$number" | bc

