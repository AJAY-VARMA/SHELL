#!/bin/bash 
echo -e "enter the number: \c"
read number
sum=0
if(( number!=0 ))
then
for(( i=1;i<=number;i++ ))
do
b=1
sum=$(echo  "scale=2;$sum+1/$i "| bc)
done
echo $var
else
echo "enter the number >0:"
fi


