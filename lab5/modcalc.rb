#a ruby program to calculate modular division 

$A=1


printf "enter the values for a, b and n"
$a=gets.to_i
$b=gets.to_i
$n=gets.to_i


for i in 0..$b
 $A=($A*$a) % $n ;

end

puts $A 







