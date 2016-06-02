A=1
puts "enter the value of a, b , and n "
a=gets.chomp
b=gets.chomp
n=gets.chomp
c=b.to_i
for i in 0..c
  
    A = (A * b ) % n
  end
  print #{A} 






