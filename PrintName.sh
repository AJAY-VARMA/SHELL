#! bin/bash
echo "enter the user name:"
read name
if(( ${#name} > 3 ))
then
echo hi $name,How are you? 
else
echo "enter the name of >=4"
fi
