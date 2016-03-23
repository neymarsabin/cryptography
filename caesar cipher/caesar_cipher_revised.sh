#!/bin/bash

# Description:
#   this is  a bash script to implement or simulate the
# Caesar_cipher : https://en.wikipedia.org/wiki/Caesar_cipher
# technique of cryptography.
#
# Enhancements:
#    - log cypher and input in file.txt
#    - refactoring
#    - decrypt

# global vars
NUMBER_OF_ALPHABETS=26
ASCII_VALUE_OF_Z=$(printf "%d" "'z") # i.e 122
ASCII_VALUE_OF_A=$(printf "%d" "'a") # i.e 97
DEFAULT_SHIT=10

#taking inputs; no errors are handled; assumed input is a-z chars
read -p "Enter your plain text: " ptext 

#transforming into lower text..........
echo $ptext | tr '[:upper:]' '[:lower:]' >  ./file1.txt    

read -p "Enter shift ciper count: " shift_by

function print_tochar(){
    printf "\\$(printf '%03o' "$1" )"
}

#this is how we encrypt
function encrypt(){
    new_value=$(( $1 + $shift_by ))
    expr ${new_value#-} % $NUMBER_OF_ALPHABETS
}

#this is how we decrypt
function decrypt(){
    #TODO: write one to decrypt
    new_value=$(( $1 + 26 - $shift_by ))
    expr ${new_value#-} % $NUMBER_OF_ALPHABETS

#    echo 'no thing done on decrypt, yet...'
#    echo 'run encrypt twice to decrypt text'
}

echo "started cyphering..."

# 
#@neymarsabin READMORE about IFS
while IFS= read -r -n1 char
do
    case $char in
	'')
            printf ""
	    ;;
	' ')
            printf ' '
            ;;
	'.')
	    printf "."
	    ;;
	*)
	    ascii_value=$(printf "%d" "'${char}" )     # a=97
            ascii_value0=$((ascii_value - ASCII_VALUE_OF_A)) #lets start a=0
	    
            ## print "(encrypt/decrypt  ascii_value0) + 97"
	    print_tochar $(( $(encrypt $((ascii_value0))) + ASCII_VALUE_OF_A)) 
	    ;;
    esac
    
done < ./file1.txt

echo -e "\nDone cyphering !!"

echo -e "do you want to decipher the cipher text?"









