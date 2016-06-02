#!/bin/bash

#lab assignment

#taking input from the user as plain text
read -p "Enter the plain text:" ptext

#converting plain text into all lowercase and saving it into a file
echo $ptext | tr '[:upper:]' '[:lower:]' > .assign.txt

#function to convert each character into 7 bit ascii code ::: its binary value of the character ::
function convert_to_ascii {
    echo $1 | xxd -b | cut -d ' ' -f2  #change into binary and cut into pieces by each space delimeter
    
}

function convert_to_hex {
    echo "obase=16;ibase=2; $1" | bc 
}

function cut_and_swap {
    #for the first four bits
    first_four=$(echo -n $1 | head -c 4)
    last_four=$(echo -n $1 | tail -c 4)
    echo "$last_four$first_four" 
}




function main_program { 
    case $1 in
	yes)
	    
	    while IFS= read -r -n1 char
	    do
		case $char in
		    '')
			printf ""
			;;
		    ' ')
			printf " "
			;;
		    '.')
			printf "."
			;;
		    *)
			echo "----------------------"
			echo "For ::::  $char"
			convert_to_ascii $char | tail -c 8
			echo "after adding 0 to the leftmost part"
			
			convert_to_ascii $char
			echo  "after swapping the first and last four bits"
			cut_and_swap $(convert_to_ascii $char)
			echo  "changing the four bits to hexadecimal value"
			new_ascii=$(cut_and_swap $(convert_to_ascii $char))
			
			echo "----------------------"
			convert_to_hex $new_ascii
			echo "----------------"
			
			;;
		    
		esac
		
		

		
		
		
	    done < .assign.txt

	    ;;
	no)
	    
	    
	    while IFS= read -r -n1 char
	    do
		case $char in
		    '')
			printf ""
			;;
		    ' ')
			printf ""
			;;
		    '.')
			printf "."
			;;
		    *)
			#echo "----------------------"
			#echo "For ::::  $char"
			# convert_to_ascii $char | tail -c 8
			# echo "after adding 0 to the leftmost part"
			
			#  convert_to_ascii $char
			#  echo  "after swapping the first and last four bits"
			#  cut_and_swap $(convert_to_ascii $char)
			#  echo  "changing the four bits to hexadecimal value"
			new_ascii=$(cut_and_swap $(convert_to_ascii $char))
			convert_to_hex $new_ascii
		 
		 
	 		;;
		    
		esac
		

		
		
	    done < .assign.txt
	    ;;
    esac
    }


main_program yes
main_program no

#remove the cache file
rm .assign.txt
