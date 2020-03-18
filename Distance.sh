#!/bin/bash
x=$1
y=$2
distance=0
distance=$(echo "$x*$x+$y*$y" | bc) 
echo  "scale=2;sqrt($distance)" | bc -l 
