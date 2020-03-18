#!/bin/bash
echo "enter the temperature in Faherheit:"
read temp
echo "enter the wind speed in miles per hour"
read vel
echo "scale=2;$vel^16" | bc -l
if(( temp<50 && vel<120 && vel>3))
then
windchill=$(echo "scale=2;35.74+0.6215*$temp+(0.4275*$temp-35.75)*$vel^0.16" |bc -l)
echo $windchill
fi
