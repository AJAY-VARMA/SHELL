#!/bin/bash
echo "enter the stake"
read stake
echo "enter the goal"
read goal
echo "enter the number of times"
read number
losse=0
won=0
fail=0
for(( i=1;i<=number;i++ ))
do
cash=stake
while(( cash!=goal && cash!=losse))
do
random=$(( $RANDOM%10 ))
if(( random>=5 ))
then
((cash++))
else
((cash--))
fi
done
if(( cash==goal ))
then
(( won++ ))
elif(( cash==losse ))
then
(( fail++ ))
fi
done
echo "number of wons= $won "
echo " number of losse= $fail"
echo -e "won percentage:\c"
echo  "100*$won/$number" | bc
echo -e "losse percentage:\c"
echo "100*$fail/$number" | bc
