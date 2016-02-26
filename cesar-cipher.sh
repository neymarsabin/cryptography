#this is  a bash script to implement or simulate the cesar cipher technique of cryptography.




echo "enter your plain text(word only) \n"
read ptext
#transforming into lower text..........
echo $ptext | tr '[:upper:]' '[:lower:]' >  ./file1.txt    

echo "Enter the value of the key ( <26)"
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
	    
	    chr(){
		((t+=$n))
		printf "\\$(printf '%03o' "$t" )"
	    }
	    chr
	    ;;
    esac
    
    done < ./file1.txt
rm ./file1.txt








