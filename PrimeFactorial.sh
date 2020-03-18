#! /bin/bash
echo "enter the number for prime factorial"
read number
for((i=2;i<number;i++))
do
while((number%i==0))
do
echo "$i"
((number=number/i))
done
done
if((number>2))
then
echo $number
fi
