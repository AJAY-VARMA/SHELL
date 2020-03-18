#! /bin/bash
echo "enter the year"
read year
if(( year>=1000 && year<=9999 ))
then
if(( year%4==0 ))
then
if(( year%100==0 ))
then
if(( year%400==0 ))
then
echo "leap year"
else
echo "not a leap year"
fi
else
echo "leap year"
fi
else
echo "not a leap year"
fi
else
echo "enter the year >=1000"
fi
