#!/bin/bash
 
echo "Enter the keyword:"
read keyWord
 
declare -a keySquare
declare -a plainText
allCharacters="ABCDEFGHIKLMNOPQRSTUVWXYZ"
 
#Function to find the location of char in key-square
locateInKeySquare() {
        char=$1
        for((j=0;j<${#keySquare[@]};j++))
        do
                if [ "${keySquare[$j]}" == "$char" ]
                then
                        return $j
                fi
        done
}
 
#Function to add a given character into the key-square
addToKeySquare() {
        char=$1
       
        #change character to uppercase
        char=`echo $char | tr '[:lower:]' '[:upper:]'`
 
        #If the character is 'J', then change it to 'I'
        if [ "$char" == 'J' ]
        then
                char='I'
        fi
       
        #Return if the parameter is not a character
        if [ `echo $allCharacters | grep -c "$char"` -eq 0 ]
        then
                return
        fi
       
        #If the character is already present, then quit
        if [ `echo ${keySquare[@]} | grep -c "$char"` -ne 0 ]
        then
                return;
        fi
 
        keySquare=( ${keySquare[@]} $char )
}
 
#Function to print the key-square
printKeySquare() {
        for((i=0;i<${#keySquare[@]};i++))
        do
                if [ `echo $i%5 | bc` -eq 0 ]
                then
                        echo ""
                fi
       
                echo -n ${keySquare[$i]}
        done   
        echo ""
}
 
#Add all the characters from the keyword into the key-square
for((i=1;i<=${#keyWord};i++))
do
        cur=`echo $keyWord | cut -c $i`
        addToKeySquare $cur
done
 
#Add the remaining characters into the key-square
for((i=1;i<=${#allCharacters};i++))
do
        cur=`echo $allCharacters | cut -c $i`
        addToKeySquare $cur
done
 
printKeySquare
 
echo "Enter the plain string:"
read plainTextString
 
tmp=""
 
for((i=1;i<=${#plainTextString};i++))
do
        char=`echo $plainTextString | cut -c $i`
 
        #change character to uppercase
        char=`echo $char | tr '[:lower:]' '[:upper:]'`
 
        #If the character is 'J', then change it to 'I'
        if [ "$char" == 'J' ]
        then
                char='I'
        fi
       
        #Return if the parameter is not a character
        if [ `echo $allCharacters | grep -c "$char"` -eq 0 ]
        then
                continue
        fi
       
        if [ "$tmp" == "$char" ]
        then
                continue
        fi
       
        tmp="$tmp$char"
       
        if [ ${#tmp} -eq 2 ]
        then
                plainText=( ${plainText[@]} $tmp )
                tmp=""
        fi
done
 
if [ ${#tmp} -eq 1 ]
then
        tmp=$tmp"X"
        plainText=( ${plainText[@]} $tmp )
fi


echo ${plainText[*]}
 
for((i=0;i<${#plainText[@]};i++))
do
        char1=`echo ${plainText[$i]} | cut -c 1`
        char2=`echo ${plainText[$i]} | cut -c 2`
       
        locateInKeySquare $char1
        pos1=$?
       
        locateInKeySquare $char2
        pos2=$?
       
        r1=`echo "(($pos1)/5)" | bc`
        c1=`echo "(($pos1)%5)" | bc`
 
        r2=`echo "(($pos2)/5)" | bc`
        c2=`echo "(($pos2)%5)" | bc`
       
        #Rule 1
        if [ $r1 -eq $r2 ]
        then
                c1=`echo "(($c1+1)%5)" | bc`
                c2=`echo "(($c2+1)%5)" | bc`
 
        #Rule 2
        elif [ $c1 -eq $c2 ]
        then
                r1=`echo "(($r1+1)%5)" | bc`
                r2=`echo "(($r2+1)%5)" | bc`
       
        #Rule 3
        else
                tmp=$c1
                c1=$c2
                c2=$tmp
        fi
	
        pos1=`echo "($r1*5)+$c1" | bc`
        pos2=`echo "($r2*5)+$c2" | bc`
       
        char1=${keySquare[$pos1]}
        char2=${keySquare[$pos2]}
       
        echo -n $char1$char2
done
echo ""
