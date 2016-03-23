#!/bin/bash

#lab assignment

#taking input from the user as plain text
read -p "Enter the plain text:" ptext

#converting plain text into all lowercase and saving it into a file
echo $ptext | tr [':upper:'] [':lower:'] > .assign.txt

#function to convert each character into 7 bit ascii code ::: its binary value of the character ::
function convert_to_ascii {
    echo $1 | xxd -b | cut -d ' ' -f2  #change into binary and cut into pieces by each space delimeter
    
}

function convert_to_hex {
    echo "obase=16;ibase=2; $1" | bc 
}

for_a=$(convert_to_ascii z)
echo $for_a
for_hex_a=$(convert_to_hex $for_a)
echo $for_hex_a

function cut_and_swap {
    #for the first four bits
    first_four=$(echo -n $1 | head -c 4)
    last_four=$(echo -n $1 | tail -c 4)
}
cut_and_swap 
echo $first_four
echo $last_four
swap=$(echo "$last_four$first_four")
echo $swap
