#!/bin/bash

#simulationg cesar cipher in bash
read -p "do u want to 1)encrypt \n 2)decrypt" CHOOSE_NUMBER

case $CHOOSE_NUMBER in
    1) 

	read -p "enter your plain text:" ptext
	
	#transforming into lower text..........
	echo $ptext | tr '[:upper:]' '[:lower:]' >  ./file1.txt    
	
	n=0
	echo "Enter the value of the key ( <26) "
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
			    p=$s-122
 			    r=97+$p-1
 			    ((t=$r))
 			    printf "\\$(printf '%03o' "$t" )"
			else
			    ((t+=$n))
			    printf "\\$(printf '%03o' "$t" )"
			fi
		    }
		    crypt
		    ;;
	    esac
	    
	done < ./file1.txt
	;;


    2)
	read -p "enter your ciphered text to decrypt"
	
	
	;;
    *)
	echo "hello world"
	
esac




        










