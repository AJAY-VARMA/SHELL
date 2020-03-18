#! /bin/bash
number=$1
sum=1
if(( number>=0 && number<31 ))
then
if(( number==0 ))
then 
echo "1"
else
for(( i=1;i<=$number;i++ ))
do
(( sum=sum*2 ))
done
echo $sum
fi
else
echo "enter the another number:"
fi
