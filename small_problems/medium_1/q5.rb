# Diamonds!

# Write a method that displays a 4-pointed diamond in an n x n grid, where n is 
# an odd integer that is supplied as an argument to the method. You may assume 
# that the argument will always be an odd integer.

def row_generator(max_stars, curr_stars)
  puts ' ' * ((max_stars - curr_stars) / 2) + '*' * curr_stars
end

def diamond(n)
  curr_stars = 1
  while curr_stars < n
    row_generator(n, curr_stars)
    curr_stars += 2
  end
  while curr_stars > 0
    row_generator(n, curr_stars)
    curr_stars -= 2
  end
end

diamond(15)