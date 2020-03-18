#!/bin/bash
echo "enter the elements in array:"
read -a array
length=${#array[@]}
for(( i=0;i<length;i++ ))
do
for(( j=i+1;j<length;j++ ))
do
for(( k=j+1;k<length;k++ ))
do
if(( ${array[i]}+${array[j]}+${array[k]}==0 ))
then
echo " ${array[i]} + ${array[j]} +  ${array[k]} == 0 "
fi
done
done
done

