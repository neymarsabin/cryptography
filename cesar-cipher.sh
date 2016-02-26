#!/bin/bash

#this is  a bash script to implement or simulate the cesar cipher technique of cryptography.




echo "enter your plain text:"
read ptext
#transforming into lower text..........
echo $ptext | tr '[:upper:]' '[:lower:]' >  ./file1.txt    

echo "Enter the value of the key ( <26) or more than 26:::: doesnt matter!!!!"
 read n


while z= read -r -n1 char
do
    case $char in
	'')
	    echo
	    ;;
	' ')
	    echo ' '
	    ;;
	'.')
	    echo '.'
	    ;;
	*)
	    t=$(printf "%d" "'${char}" )
 	    s=`expr $t + $n` 
	    

 	    crypt () {
 	    if [ $s -gt 122 ]
 		then
 		   #p=26-$n
 		    r=97+$n
 		    ((t=$r))
 		    printf "\\$(printf '%03o' "$t" )"

 	    else
		((t+=$n))
		printf "\\$(printf '%03o' "$t" )"
 		fi

#	    echo $t
	     	    }
	    crypt
	    ;;
    esac
    
    done < ./file1.txt









