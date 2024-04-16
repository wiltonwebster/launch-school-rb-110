# Combine Two Lists

# Write a method that combines two Arrays passed in as arguments, and returns a
# new Array that contains all elements from both Array arguments, with the 
# elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the 
# same number of elements.

def interleave(first_array, second_array)
  result = []
  (0...first_array.size).each do |idx|
    result << first_array[idx]
    result << second_array[idx]
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

def zip_interleave(first_array, second_array)
  first_array.zip(second_array).flatten
end

p zip_interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
