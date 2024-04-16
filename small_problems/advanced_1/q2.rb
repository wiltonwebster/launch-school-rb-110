# Seeing Stars

# Write a method that displays an 8-pointed star in an nxn grid, where n is an 
# odd integer that is supplied as an argument to the method. The smallest such 
# star you need to handle is a 7x7 grid.

def star(n)
  top_half = (n - 1) / 2
  1.upto(top_half).each do |x|
    outer = x - 1
    inner = top_half - x
    puts ' ' * outer + '*' + ' ' * inner + '*'  + ' ' * inner+ '*' + ' ' * outer
  end
  puts '*' * n
  top_half.downto(1).each do |x|
    outer = x - 1
    inner = top_half - x
    puts ' ' * outer + '*' + ' ' * inner + '*'  + ' ' * inner+ '*' + ' ' * outer
  end
end

star(9)