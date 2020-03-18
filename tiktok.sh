

#! /bin/bash

reset(){
  Arr=(. . . . . . . . .)
  player=1
  gamestatus=1
 
}

set(){
  idx=$(( $1 * 3 + $2 ))
  if [ ${Arr[$idx]} == "." ]
  then 
       Arr[$idx]=$3
       player=$((player%2+1))
  else
       echo "You can't place there!"
  fi
}

print(){
  echo "r\c 0 1 2"
  echo "0   ${Arr[0]} ${Arr[1]} ${Arr[2]}"
  echo "1   ${Arr[3]} ${Arr[4]} ${Arr[5]}"
  echo "2   ${Arr[6]} ${Arr[7]} ${Arr[8]}"
}

checkmatch(){
  if [  ${Arr[$1]} != "." ] && [ ${Arr[$1]} == ${Arr[$2]} ] && [  ${Arr[$2]} == ${Arr[$3]}  ] ;   then
    gamestatus=0
   fi
}

checkgame(){
  checkmatch 0 1 2
  checkmatch 3 4 5
  checkmatch 6 7 8
  checkmatch 0 3 6
  checkmatch 1 4 7
  checkmatch 2 5 8
  checkmatch 0 4 8
  checkmatch 2 4 6
}
hint()
{
  check 0 1 2
  check 3 4 5
  check 6 7 8
  check 0 3 6
  check 1 4 7
  check 2 5 8
  check 0 4 8
  check 2 4 6
}
check()
{
  if [  ${Arr[$1]} == "." ] && [ ${Arr[$3]} == ${Arr[$2]} ] && [ ${Arr[$3]} != "." ] && [ ${Arr[$2]} != "." ] ;   then
    row=$(( $1/3 ))
    column=$(( $1%3 ))
     if [  ${Arr[$3]} == "X" ] || [ ${Arr[$1]} == "X" ] || [ ${Arr[$2]} == "X" ] ;   then
          echo "put these values to block player 2"
        echo - e "hint   \c"
    echo -e " row: $row  \c"  
    echo "column : $column"
  
     echo ""
     echo ""
      else
      echo "put these values to win"
     echo -e "hint   \c"
    echo -e " row: $row  \c"  
    echo "column : $column"
     echo ""
    echo ""
    fi
 
  elif [  ${Arr[$2]} == "." ] && [ ${Arr[$1]} == ${Arr[$3]} ] && [ ${Arr[$3]} != "." ] && [ ${Arr[$1]} != "." ] ;   then
    row=$(( $2/3 ))
    column=$(( $2%3 ))
     if [  ${Arr[$3]} == "X" ] || [ ${Arr[$1]} == "X" ] || [ ${Arr[$2]} == "X" ] ;   then
         echo "put these values to block player 2"
       echo -e "hint  \c"
    echo -e " row: $row  \c"
    echo " column : $column "
  
      echo ""
      echo ""
     else
     echo "put these values to win"
    echo -e "hint  \c"
    echo -e " row: $row  \c"
    echo " column : $column "
     echo ""
     echo ""
     fi

    elif [  ${Arr[$3]} == "." ] && [ ${Arr[$1]} == ${Arr[$2]} ] && [ ${Arr[$1]} != "." ] && [ ${Arr[$2]} != "." ] ;   then
    row=$(( $3/3 ))
    column=$(( $3%3 ))
     if [  ${Arr[$3]} == "X" ] || [ ${Arr[$1]} == "X" ] || [ ${Arr[$2]} == "X" ] ;   then 
      echo "put these values to block player 2"
       echo -e " hint  \c"
    echo -e " row: $row  \c"
    echo "column : $column"
      echo ""
      echo ""
     else
     echo "put these values to win"
    echo -e " hint  \c"
    echo -e " row: $row  \c"
    echo "column : $column"
    echo ""
    echo ""
    fi
   fi  
   


}

reset
while (( 1 == 1 )) 
do
       echo ""
  if [ $player == 1 ]
  then 
       sym=O
  echo "Player $player's turn: ($sym)"
  else 
       sym=X 
  echo "Player computer's turn: ($sym)"
  fi
  print
  echo ""
  echo "  Command:"
  echo "	1. set [row] [column]"
  echo "	2. restart"
  echo ""
  echo ""
if(( $player==1))
        then
          hint
        fi
  while (( 1 == 1 )) 
  do
    if(( $player == 1 ))
    then
    read -r cmd a b
    fi
     if(( $player == 2))
     then
        cmd="set"
        a=$(( $(( $RANDOM % 10 )) % 3 ))
         b=$(( $(( $RANDOM % 10 )) % 3 ))
     fi
    if (( $cmd == "set" ))
    then
        
  	set $a $b $sym
	break
    elif (( $cmd == "restart" )) 
    then
	reset
	break
    else
	echo "wrong command, try again."
    fi
  done
  checkgame
  if [ $gamestatus != 1 ];
  then
    print
    echo "Gameover"
     player=$((player%2+1))
    echo "Player $player ($sym) win!!"
     echo "enter 1 for new game:"
     read n
     if(( $n==1 ))
     then
     reset
     fi
  fi
done
