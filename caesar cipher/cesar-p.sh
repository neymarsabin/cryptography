#!/bin/bash
# global vars
NUMBER_OF_ALPHABETS=26
ASCII_VALUE_OF_Z=$(printf "%d" "'z") # i.e 122
ASCII_VALUE_OF_A=$(printf "%d" "'a") # i.e 97
DEFAULT_SHIT=10

#taking inputs; no errors are handled; assumed input is a-z chars
read -p "Enter your plain text or ciphered text: " ptext 

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

#echo "started cyphering..."


function while_loop() {
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
	    print_tochar $(( $($1 $((ascii_value0))) + ASCII_VALUE_OF_A)) 
	    ;;
    esac
    
done < ./file1.txt

}


read -p "1)Encrypt or 2)decrypt: " CHOOSE_NUMBER

case $CHOOSE_NUMBER in
    1)
	echo -e "\n ------------------"
	while_loop encrypt
	echo -e "\n ------------------ \n Done encrypting "
	;;
    2)
	echo -e "\n ------------------ "
	while_loop decrypt
	echo -e "\n ------------------ \n Done decrypting "
	;;
    *)
	echo "please choose one number:  1 or 2 "
	;;
esac

#remove cache files
rm ./file1.txt
