#!/bin/bash
echo enter a
read a
echo enter b
read b
echo enter c
read c
((delta=$b*$b-4*$a*$c))
if(( $delta> 0))
then
root1=$(echo "scale=2;(-$b+sqrt($delta))/(2*$a)" | bc -l)
root2=$(echo "scale=2;(-$b-sqrt($delta))/(2*$a)" | bc -l)
echo "root1=$root1"
echo "root2=$root2"
fi
