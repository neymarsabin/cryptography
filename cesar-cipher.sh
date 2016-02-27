#!/bin/bash

#this is  a bash script to implement or simulate the cesar cipher technique of cryptography.




echo "enter your plain text:"
read ptext
#transforming into lower text..........
echo $ptext | tr '[:upper:]' '[:lower:]' >  ./file1.txt    

n=0
echo "Enter the value of the key ( <26) "
read n

case $1 in
    -e)
	
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
    
    -d)
	echo "hello world"
	
	

	
	;;
    *)
	echo
	;;
    esac
		  



        










