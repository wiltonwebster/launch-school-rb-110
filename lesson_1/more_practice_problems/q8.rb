# What happens when we modify an array while we are iterating over it? 

# It's possible that modifying an array could change the behavior of the 
# iteration, if items are removed or added.


# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# On each iteration of the block, we remove an element from the beginning of the
# array, which causes the iteration to skip an element, since the indices have
# all been affected by the shift. Thus, this .each call will output 1 and 3. The
# 2 is skipped since it will have moved to index 0 as the iteration moves to 
# index 1, and the 4 will be skipped as it will have moved again to index 1 as
# the iteration moves to index 2. 


# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# For a similar reason, this code will only output 1 and 2. Since Array#pop(1)
# removes the final element, each iteration will shorten the array by 1 element.
# Thus, when we arrive at index 2 after 2 iterations, there is no longer an
# element at that position.